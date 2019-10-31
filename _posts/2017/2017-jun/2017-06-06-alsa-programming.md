---
layout: post
title: "ALSA programming"
---

ALSA 프로그래밍은 다음과 같다. 오디오 디바이스를 열고 필요한 파라미터를 설정해준 뒤에 필요한 작업을 끝이 날 때까지 수행하다가 끝이나면 디바이스를 클로우즈하고 빠지는 것이다.

쉽게 말해서 파일 작업을 하는 것이나 큰 차이가 없다. 

``
open_the_device();
set_the_parameters_of_the_device();
while (!done) {
/* one or both of these */
receive_audio_data_from_the_device();
deliver_audio_data_to_the_device();
}
close the device
```

아래의 프로그램은 위 모델을 그대로 만들어놓은 것인데, 보는 바와 같이 막연히 버퍼에서 데이터를 받아서 처리하는 것으로 끝나는 것처럼 (아니면 에러를 내뿜는) 보이지만, 음성처리는 실시간 처리이고 오디오 인터페이스를 통해 들어온 데이터가 버퍼에 준비되어있을때만 동작하도록 해야한다. 따라서, 아래는 단순히 프로그램은 이렇게 한다를 의미할 뿐 실질적으로 의미있는 프로그램은 아니다.

```
#include <stdio.h>
#include <stdlib.h>
#include <alsa/asoundlib.h>

main (int argc, char *argv[])
{
int i;
int err;
short buf[128];
snd_pcm_t *capture_handle;
snd_pcm_hw_params_t *hw_params;

if ((err = snd_pcm_open (&capture_handle, argv[1], SND_PCM_STREAM_CAPTURE, 0)) < 0) {
fprintf (stderr, "cannot open audio device %s (%s)\n", 
argv[1],
snd_strerror (err));
exit (1);
}

if ((err = snd_pcm_hw_params_malloc (&hw_params)) < 0) {
fprintf (stderr, "cannot allocate hardware parameter structure (%s)\n", snd_strerror (err));
exit (1);
}

if ((err = snd_pcm_hw_params_any (capture_handle, hw_params)) < 0) {
fprintf (stderr, "cannot initialize hardware parameter structure (%s)\n",snd_strerror (err));
exit (1);
}

if ((err = snd_pcm_hw_params_set_access (capture_handle, hw_params, SND_PCM_ACCESS_RW_INTERLEAVED)) < 0) {
fprintf (stderr, "cannot set access type (%s)\n",snd_strerror (err));
exit (1);
}

if ((err = snd_pcm_hw_params_set_format (capture_handle, hw_params, SND_PCM_FORMAT_S16_LE)) < 0) {
fprintf (stderr, "cannot set sample format (%s)\n", snd_strerror (err));
exit (1);
}

if ((err = snd_pcm_hw_params_set_rate_near (capture_handle, hw_params, 44100, 0)) < 0) {
fprintf (stderr, "cannot set sample rate (%s)\n", snd_strerror (err));
exit (1);
}

if ((err = snd_pcm_hw_params_set_channels (capture_handle, hw_params, 2)) < 0) {
fprintf (stderr, "cannot set channel count (%s)\n",
snd_strerror (err));
exit (1);
}

if ((err = snd_pcm_hw_params (capture_handle, hw_params)) < 0) {
fprintf (stderr, "cannot set parameters (%s)\n",snd_strerror (err));
exit (1);
}

snd_pcm_hw_params_free (hw_params);

if ((err = snd_pcm_prepare (capture_handle)) < 0) {
fprintf (stderr, "cannot prepare audio interface for use (%s)\n", snd_strerror (err));
exit (1);
}

for (i = 0; i < 10; ++i) {
if ((err = snd_pcm_readi (capture_handle, buf, 128)) != 128) {
fprintf (stderr, "read from audio interface failed (%s)\n", snd_strerror (err));
exit (1);
}
}

snd_pcm_close (capture_handle);
exit (0);
}
```

파일 처리와 달리 실시간 처리를 해야하니까 처리를 위해 필요한 만큼의 데이터가 쌓이면 신호처리 함수를 불러서 실행하고 결과를 내보낸 뒤에 쉬고 하는 작업을 계속해서 반복해야 하는데, 막연히 기다리기만 할 수 없으니까 인터럽트를 이용해서 신호 처리 함수를 인터럽트 콜백 함수에 넣고 실행한다.

