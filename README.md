# Jabber

There are two services that provide jabber/VoIP functionallity: ejabberd and
turn. Ejabberd is for chat and file transfer while turn makes it possible for 
computers behind NAT/firewall to use jabber's jingle protocol which is a 
protocol for audio and video calls. Both jabber and turn have to share a common 
secret. The following config will tell ejabberd to use external turn server.

ejabberd.yml:
```
mod_stun_disco:
  secret: Sekrit
  services:
    -
      host: turn.{{ jabber_domain }}
      port: 3478
      type: stun
    -
      host: turn.{{ jabber_domain }}
      port: 3478
      type: turn
      restricted: true
    -
      host: turn.{{ jabber_domain }}
      port: 5349
      type: turns
      restricted: true
```
