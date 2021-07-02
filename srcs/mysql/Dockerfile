# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mspinnet <mspinnet@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/01/25 21:33:18 by mspinnet          #+#    #+#              #
#    Updated: 2021/02/10 14:02:39 by mspinnet         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.12

RUN apk update && apk upgrade
RUN apk add openssl openssh supervisor curl php-fpm openrc mysql mysql-client mariadb-openrc libc6-compat

COPY ./supervisor.conf /etc/supervisord.conf
RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.17.2_linux_amd64.tar.gz
RUN tar xf telegraf-1.17.2_linux_amd64.tar.gz
COPY ./telegraf.conf .
COPY ./mspinnet_site.sql .
COPY ./setup.sh /etc/
COPY ./mariadb-server.cnf /etc/my.cnf.d/

EXPOSE 3306

CMD sh /etc/setup.sh