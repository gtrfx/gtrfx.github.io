---
layout: post
title: "Command line에서 Time Lapse 만들기"
tags: [time lapse]
---

생활의 기록을 남긴다고 했을 때, 4k video clip보단 time lapse가 유리할 때가 많다. 시간이 흐른 뒤에 살펴보기도 편리하고 말이다. 저장 용량도 작고 오랜 시간 기록이 가능하고 쉽게 말해 자동으로 요약이 되는 셈이다보니 나는 이 방법을 더 선호한다. 

카메라 별로 time lapse를 지원하는 방법이 좀 다른데, 내가 사용하는 카메라는 time lapse video clip을 자동으로 만들어주지 않고 JPG로 그냥 기록한다. 쉽게 말해서 일반 still shot을 주기적으로 때려넣는 것 외에 별 다른 것은 없는 것이다. 

이게 좀 편한 것은 동영상 파일이 여러 개로 저장될 것을 어차피 나중에 그렇게 모여진 still shot들을 한꺼번에 모아서 처리할 수 있기 때문인데 더 편한 것 같다.

문제는 이것을 동영상 편집 프로그램에서 가져다가 처리하긴 좀 부담이 된다는 것이다. 차라리 batch file 돌리듯 모여진 still shot들을 하나의 동영상으로 엮어넣은 뒤에 H265로 압축하면 결과물의 크기도 작고 원하는 결과물도 빠르면 1분 내에 전부 얻을 수 있다. 동영상 편집 프로그램에 가져다 넣고 지지고볶고 하는 것을 생각하면 상상도 할 수 없이 빠르다고 보면 된다. 

ffmpeg을 설치하자. Mac이면 homebrew를 이용하면 된다. 그리고 HandbrakeCLI가 있으면 transcoding을 쉽게 할 수 있다.

다음은 내가 사용하는 일괄 편집 perl script이다. 참조하기 바란다. 외장 USB reader라든가 HDD로 붙은 것에서 JPG를 모조리 찾아내서 그것들을 ffmpeg으로 무손실로 전부 이어붙인 파일을 만들고 그것을 h.265로 인코딩한다. 인코딩 품질은 4k를 고려해서 10Mbps이다. 최종 결과물은 대략 이어붙인 파일의 2% 정도 크기로 줄어든다. 

ffmpeg으로만 해도 되는 일을 왜 handbrake까지 거들게 하냐 라는 말을 할 수 있을텐데, 솔직히 time lapse clip 하나만 있는 경우에는 뭘로 해도 별로 상관이 없다. 그런데, time lapse clip과 일반적인 movie clip을 ffmpeg으로 이어붙이려고 보면 미묘한 차이에 의해서 뒤에 붙은 영상들이 다 날아가는 일이 있어서다. 

별다른 영상 편집 소프트웨어로 작업할 게 아니라면 frame rate과 resolution은 전부 하나로 통일해서 이어붙이고 작업하는 게 좋다. 

60fps로 작업하는 이들도 많은 것 같은데, 중요한 영상이 아니라면 4k 24fps가 적당하다고 보여진다. FHD는 요새 화면에서는 이해하긴 어렵지만 blurry한 결과물을 준다. 

```perl

#!/usr/bin/env perl
use Cwd;
use Date::Format;

my $src="/Volumes/Untitled";
my $cwd=getcwd();

my $rot="";

$rot=($ARGV[0] eq "180") ? "--rotate":$rot;

sub get_jpg
{
    opendir(my $dh,$_[0]);
    my @d=readdir($dh);
    closedir($dh);
    my @list;
    foreach my $u (@d)
    {
        if ($u !~ /^\./)
        {
            if (($u =~ /jpg$/i))
            {
                my $f=$_[0]."/".$u;
                my @m=stat($f);
                my $data=time2str('%Y%m%d%H%M%S',@m[10]);
                my $davi=$data.".avi";
                my $dmp4=$data.".mp4";
                `ffmpeg -pattern_type glob -i '$_[0]/*.JPG' -vcodec copy $cwd/$davi`;
                `HandBrakeCLI -i $cwd/$davi -o $cwd/$dmp4 -e vt_h265 -r 24 -b 10000 --no-decomb --no-comb-detect --no-unsharp $rot`;
                `rm $cwd/$davi`;
                last;
            }
            my $dir=$_[0]."/".$u;
            if (-d $dir)
            {
                get_jpg($_[0]."/".$u);
            }
        }
    }
}
get_jpg($src);
```



