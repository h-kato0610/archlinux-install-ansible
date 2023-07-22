FROM archlinux:latest
ARG PKG="ansible"

RUN echo "Asia/Tokyo" > /etc/timezone \
  && ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime \
  && curl https://archlinux.org/mirrorlist/\?country\=JP\&protocol\=https\&ip_version\=4\&ip_version\=6 > /tmp/mirrorlist && sed -e "s/^#//g" /tmp/mirrorlist > /etc/pacman.d/mirrorlist \
  && useradd -m -s /bin/bash docker \
  && echo 'Defaults visiblepw'               >> /etc/sudoers  \
  && echo 'docker ALL=(ALL) NOPASSWD:ALL'    >> /etc/sudoers

RUN pacman -Syy --noconfirm && pacman -Syu --noconfirm

RUN pacman -S $PKG --noconfirm

RUN mkdir /ansible
