# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mspinnet <mspinnet@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/01/25 21:33:18 by mspinnet          #+#    #+#              #
#    Updated: 2021/02/10 14:04:11 by mspinnet         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.12

RUN apk update && apk upgrade
RUN apk add nginx openssl openssh supervisor curl php-fpm openrc php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session libc6-compat
COPY ./nginx.conf /etc/nginx/conf.d/default.conf
COPY ./supervisor.conf /etc/supervisord.conf
RUN curl -O https://wordpress.org/latest.tar.gz
RUN tar -xzvf latest.tar.gz && rm -rf latest.tar.gz
RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.17.2_linux_amd64.tar.gz
RUN tar xf telegraf-1.17.2_linux_amd64.tar.gz
COPY ./telegraf.conf .
COPY ./wp-config.php ./wordpress
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/mspinnet.key -out /etc/nginx/mspinnet.crt -subj "/C=RF/ST=TATARSTAN/L=KAZAN/O=21S/CN=MSPINNET"
COPY ./setup.sh /tmp/
RUN chmod +x /tmp/setup.sh
RUN mkdir -p /run/nginx

EXPOSE 5050

CMD sh /tmp/setup.sh