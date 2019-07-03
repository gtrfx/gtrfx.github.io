#!/usr/bin/env perl

my $target="/Users/hcheon/Desktop/gtrfx.github.io/_posts";
my @num2month=("","jan","feb","mar","apr","may","jun","jul","aug","sep","oct","nov","dec");
sub move
{
    opendir(my $d,$_[0]);
    my @dd=readdir($d);
    closedir($d);
    foreach my $df (@dd)
    {
        if ($df !~ /^\./)
        {
            my $fname=$_[0]."/".$df;
            if (-d $fname)
            {
                move($fname);
            }
            else
            {
                if ($df =~ /^([0-9]{4})-([0-9]{2})-[0-9]{2}.*\.md/)
                {
                    my $mon=$num2month[int($2)];
                    my $tdir=$target."/$1/$1-$mon";
                    if (!-d $tdir)
                    {
                        `mkdir $tdir`;
                    }
                    `mv $fname $tdir`;
                    #print $df." $tdir\n";
                }
            }
        }
    }
}

move(".");