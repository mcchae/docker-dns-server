# DNS 서버 for docker container

이 컨테이너는 bind 서버를 이용하여 DNS 서비스를 구성합니다.

## 사용법
docker-compose 설정 파일로 다음과 같이 설정합니다.

```yaml
version: '2'

services:
  bind:
#   restart: always
    image: mcchae/dns-server
    ports:
    - "53:53/udp"
    - "53:53/tcp"
    - "10000:10000/tcp"
    volumes:
    - ${PWD}/dhv/bind:/data
```

## 주의할 점
docker 디폴트 bridge 모드로 사용할 경우, 호스트에서 접속해서 정보를 가져오려고 하면, 안되는 경우가 있는데, 이 경우에는

`dhv/bind/bind/etc/named.conf.options` 파일에

```txt
options {
	directory "/var/cache/bind";
	...
	// allow all
	allow-recursion { any; };
	allow-query { any; };
	allow-query-cache { any; };
}
```
라는 allow all 섹션을 추가해 줍니다.

## 테스트

```sh
$ dig @localhost google.com
```

