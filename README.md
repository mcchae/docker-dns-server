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

