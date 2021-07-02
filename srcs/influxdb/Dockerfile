# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mspinnet <mspinnet@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/01/25 21:33:18 by mspinnet          #+#    #+#              #
#    Updated: 2021/02/10 14:02:09 by mspinnet         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.12

RUN apk update && apk upgrade
RUN apk add supervisor curl influxdb libc6-compat
RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.17.2_linux_amd64.tar.gz
RUN tar xf telegraf-1.17.2_linux_amd64.tar.gz
COPY ./telegraf.conf .
COPY ./supervisor.conf /etc/supervisord.conf

COPY ./setup.sh /etc/

EXPOSE 8086

CMD sh /etc/setup.sh