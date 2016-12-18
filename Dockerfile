FROM ubuntu:16.04

WORKDIR /root/
RUN apt-get update && apt-get install -y wget unzip
RUN wget http://emqtt.io/downloads/latest/ubuntu16_04
RUN unzip /root/ubuntu16_04
RUN cp -r /root/emqttd/ /opt/

ADD build.sh /etc/init.d/emqttd
RUN chmod +x /etc/init.d/emqttd 

CMD export HOME=/root
CMD /opt/emqttd/bin/emqttd start && tail -f /dev/null