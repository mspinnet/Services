# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mspinnet <mspinnet@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/01/24 14:31:28 by mspinnet          #+#    #+#              #
#    Updated: 2021/02/10 14:03:15 by mspinnet         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.12

RUN apk update && apk upgrade
RUN apk add nginx openssl supervisor openssh libc6-compat curl

COPY ./nginx.conf /etc/nginx/conf.d/default.conf
COPY ./supervisor.conf /etc/supervisord.conf
RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.17.2_linux_amd64.tar.gz
RUN tar xf telegraf-1.17.2_linux_amd64.tar.gz
COPY ./telegraf.conf .
RUN mkdir /etc/nginx/ssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/mspinnet.key -out /etc/nginx/ssl/mspinnet.pem -subj "/C=RF/ST=TATARSTAN/L=KAZAN/O=21S/CN=MSPINNET"
RUN echo "root:user" | chpasswd;
COPY ./setup.sh /tmp/
RUN chmod +x /tmp/setup.sh
COPY ./sshd_config /etc/ssh/
RUN mkdir -p /run/nginx

EXPOSE 80 443 22

CMD sh /tmp/setup.sh