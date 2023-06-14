---
layout: post
title: "What you can do with your Raspberry pi"
categories: 
  - life
  - linux
  - single board computer
author: "Keith"
---

## 서버로서의 활용

라스베리파이로 할 수 있는 일은 다음과 같이 정리된다.

- 가정용 서버로 사용할 때 (linux를 올렸을 때를 가정)
  - nfs server (NAS)
  - samba server (NAS)
  - ssh/sftp server
  - forked-daap server (iTunes server)
  - personal ldap/mail server: depending on your IP address
  - web server (blog server)
  - dbms server (mysql, postgre, sqlite)
  - rtorrent client
  - webdab server (NAS)
  - openvpn server (or other vpn servers)
  - motion server (surveillance camera)

위 기능들은 raspberry pi-I으로도 가능한 기능이긴 하나 II면 안정적으로 기동하고 꼭 3일 필요는 없다. mail server로 활용하려는 경우, 사용하는 ip address가 blacklist에 들어있지 않아야 한다. 아쉽게도 많은 ip address들이 blacklist에 들어있어서 다른 mail server들과 mail relay를 할 수 없기에 메일 받기는 가능하나 보내기가 불가능하다.

## PC로서의 활용

- 독립된 PC로 사용할 때
    - Linux
    - Chromium OS
    - Windows
    - Android

아쉽게도 램 용량이 작아서 그 어떤 OS라도 GUI 환경에서 사용하는 것은 비추다. Linux를 command line이나 ssh로 기동하는 것은 충분히 빠르지만, GUI로 쓰면 모든 OS가 답답함을 준다. processor가 느려서라기 보단 RAM 용량이 1GB로 너무 작기 때문이다. 2GB 이상의 램을 확보할 수 있으면 약간의 불편을 감수하고 사용할 수 있다.

Chromium OS는 웹 브라우징, 간단한 개인 업무를 위해 충분히 사용가능하다. 안드로이드도 7.1까지 나와있긴 하지만 램용량이 문제다. 1GB는 너무 불편하다. 개인용 PC로 활용할 경우 4GB는 되어야 쓸만하다.

## 결론

프로세서의 성능은 좋으나 GUI 활용을 목적으로 나온 물건이 아니다보니 1GB RAM에서는 몹시 불편함을 느낄 수 있다. 2GB 정도가 되었더라면 좋았을텐데 하는 아쉬움을 감출 수가 없는데, 후속 제품은 여러 해째 말만 돌뿐 나오지 않고 있다. 그것은 아마도 프로세서가 크게 진보하지 못하고 있어서 적당한 가격의 또 성능이 개선된 SoC를 얻지 못하고 있기 때문이 아닐까 한다.

4K processing 기능은 꼭 필요한 기능이 아니나 이미 탑재하고 있는 프로세서의 성능을 충분히 발휘할 수 있게 하려면 GPU를 어느 정도 개선하고 RAM 용량만 늘리면 어디 내놔도 부족할 것이 없는 싱글보드컴퓨터이다. 상대적으로 PC 활용이 가능한 셀러론 보드들의 경우를 보면 2GB 이상이거나 확장이 가능하게 되어있다. 

따라서 라스베리 파이로 쾌적한 GUI 작업은 비추하고 오직 command line interface로 활용이 적당할 것으로 보여진다. 