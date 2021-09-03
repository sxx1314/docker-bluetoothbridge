FROM python:3.9.7

RUN apt-get update 
RUN apt-get install -y bluez bluetooth git vim

RUN pip3 install bluepy paho-mqtt pyyaml

RUN git clone https://github.com/shaonianzhentan/meizu_ble.git /meizu_ble



COPY docker_entrypoint.sh /docker_entrypoint.sh
RUN chmod +x /docker_entrypoint.sh

RUN apt-get clean && rm -rf /var/lib/apt/lists
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN echo 'Asia/Shanghai' >/etc/timezone
ENV LANG zh_CN.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL zh_CN.UTF-8


ENTRYPOINT [ "/docker_entrypoint.sh" ]
