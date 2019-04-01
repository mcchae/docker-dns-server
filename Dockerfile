FROM sameersbn/bind:9.11.3-20190113

# for tcpdump
RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y tcpdump

