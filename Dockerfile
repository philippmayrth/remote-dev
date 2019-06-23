FROM ubuntu:18.04


RUN apt-get update && apt-get install -y \
	curl \
	gnupg2
 
# Add yarn repository
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update && apt-get install -y \
	neovim \
	git \
	python \
	python-pip \
	python3 \
	python3-pip \
	nodejs \
	yarn \
	apache2 \
	mariadb-server

# https://www.mycli.net - A mysql client with autocomoplete
RUN pip install mycli

RUN mkdir -p /data/db/mariadb
RUN mkdir -p /workdir

VOLUME /data
VOLUME /workdir

# HTTP Server
EXPOSE 80
EXPOSE 3000
EXPOSE 3306

