---
title: "How to use your music server from outside of your local network"
---
# How to use your music server from outside of your local network

### What is this?I'm using a raspberry pi to manage all of my stuff in order to reuse it remotely whenever I need it. Some people might say this one is a "self" cloud or "local" cloud. As I know, lots of people have their own "local" cloud at their local network (home network) to store all their stuff in addition to other famous cloud services.When you have a huge music library or collection of yours, it is really cumbersome to put them into your mobile devices whenever you need them. Otherwise you need to pay some money for using a public/famous music cloud. This is a simple scheme to play your music at your local network remotely whenever you need it. You can also save up your precious memory space of your portable devices (smartphones/tablets or laptops).### Prerequisites1. Fast internet service (Wifi or LTE)1. daap server (running daapd or iTunes homeshare)2. gateway forwarding your daap traffic outside of your local network3. daap player (iTunes, daap player (android))4. mDNS proxy### How to make a secure tunnel to your local networkBasically, you have two options for making a secure or unsecure tunnel to your local network.1. ssh tunnel: very simple and secure, but one port at a time2. VPN (PPTP/IPSEC/OpenVPN): secure for some VPN schemes, and you can redirect all you traffic to your local network. ### Precedures1. Open a secure tunnel to your local network2. Run your daap player1. For iTunes or players using mDNS1. Run a mDNS proxy`dns-sd -P "service_name_in_your_iTune" _daap._tcp.[protocol type] local[domain_name] 3689[port number] your_host.local.[host_name] ip_address "Machine Name=your_host_name"`or`avahi-publish-service` (only in Linux)2. For players supporting daap: just run your daap player and configure your server: `server_ip_address:3689`3. Enjoy!
