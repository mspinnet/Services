# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mspinnet <mspinnet@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/01/25 21:33:18 by mspinnet          #+#    #+#              #
#    Updated: 2021/02/10 14:01:43 by mspinnet         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.12

RUN apk update && apk upgrade
RUN apk add openssh openssl supervisor curl libc6-compat

COPY ./supervisor.conf /etc/supervisord.conf
RUN curl -O https://dl.grafana.com/oss/release/grafana-7.3.7.linux-amd64.tar.gz 
RUN tar -zxvf grafana-7.3.7.linux-amd64.tar.gz --strip-components 1

RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.17.2_linux_amd64.tar.gz
RUN tar xf telegraf-1.17.2_linux_amd64.tar.gz
COPY ./telegraf.conf .
COPY ./grafana.db /data/grafana.db

COPY ./setup.sh .

EXPOSE 3000

CMD sh setup.sh