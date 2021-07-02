# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mspinnet <mspinnet@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/01/25 21:33:18 by mspinnet          #+#    #+#              #
#    Updated: 2021/02/10 14:01:01 by mspinnet         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.12

RUN apk update && apk upgrade
RUN apk add openssh openssl supervisor vsftpd openrc curl libc6-compat

COPY ./supervisor.conf /etc/supervisord.conf
RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.17.2_linux_amd64.tar.gz
RUN tar xf telegraf-1.17.2_linux_amd64.tar.gz
COPY ./telegraf.conf .
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/vsftpd.pem -out /etc/ssl/private/vsftpd.pem -subj '/C=RF/ST=TATARSTAN/L=KAZAN/O=21S/CN=MSPINNET'
RUN adduser -D user
RUN echo "user:user" | chpasswd;
RUN chmod 777 /home/user
COPY ./vsftpd.conf /etc/
COPY ./setup.sh /etc/

EXPOSE 21 21000

CMD sh /etc/setup.sh