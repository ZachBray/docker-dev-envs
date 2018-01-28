FROM ubuntu:latest

# INSTALL LIBRARIES FOR XWINDOWS
RUN apt-get update && apt-get install -y \
	libasound2 \
	libatk1.0-0 \
	libcairo2 \
  libcanberra-gtk-module \
	libcups2 \
	libdatrie1 \
	libdbus-1-3 \
	libfontconfig1 \
	libfreetype6 \
	libgconf-2-4 \
	libgcrypt20 \
	libgl1-mesa-dri \
	libgl1-mesa-glx \
	libgdk-pixbuf2.0-0 \
	libglib2.0-0 \
	libgpg-error0 \
	libgraphite2-3 \
	libnotify-bin \
	libnss3 \
	libnspr4 \
	libpango-1.0-0 \
	libpangocairo-1.0-0 \
	libxcomposite1 \
	libxcursor1 \
	libxdmcp6 \
	libxi6 \
	libxrandr2 \
	libxrender1 \
	libxss1 \
	libxtst6 \
	liblzma5 \
	libxkbfile1 \
	sudo \
	gnupg \
	wget \
	ttf-bitstream-vera \
	pulseaudio \
	lxappearance \
	locales \
	curl

# INSTALL GIT
RUN apt-get update && \
    apt-get install -y git

# SET UP WORKSPACE
RUN apt-get update && \
    apt-get install -y sudo
RUN useradd dev && \
    echo "ALL            ALL = (ALL) NOPASSWD: ALL" >> /etc/sudoers
RUN mkdir -p /home/dev
RUN chown -R dev:dev /home/dev
