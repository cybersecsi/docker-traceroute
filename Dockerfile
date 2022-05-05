FROM ubuntu as builder
RUN apt-get update && apt-get install -y wget netbase  build-essential && wget http://packetfactory.openwall.net/projects/firewalk/dist/traceroute/traceroute-1.4a12-packetfatory.tar.gz  
RUN tar -xf traceroute-1.4a12-packetfatory.tar.gz   
WORKDIR /traceroute-1.4a13
RUN ./configure && sed -i 's/^INCLS.*/INCLS = -I. -I linux-include/g' Makefile && make

FROM ubuntu
RUN apt-get update && apt-get install netbase
COPY --from=builder /traceroute-1.4a13/ /traceroute-1.4a13
WORKDIR /traceroute-1.4a13
ENTRYPOINT ["./traceroute"]