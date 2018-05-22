FROM arm32v7/debian:stretch-slim
MAINTAINER Michael Ruettgers <michael@ruettgers.eu>

ENV DEBIAN_FRONTEND noninteractive

ENV PACKAGES \
  libcurl3 \
  libspeexdsp1 \
  libspeex1 \
  libjpeg62-turbo \
  libncurses5 \
  libtiff5 \
  libperl5.24 \
  libgdbm3 \
  libdb5.3 \
  libssl1.1 \
  libpcre3 \
  libsqlite3-0 \
  libedit2 \
  libldns2 \
  libpq5 \
  libsndfile1 \
  libopus0 \
  liblua5.1-0

ENV BUILD_PACKAGES \
  git \
  autoconf \
  automake \
  devscripts \
  gawk \
  libjpeg-dev \
  libncurses5-dev \
  libtool-bin \
  python-dev \
  libtiff5-dev \
  libperl-dev \
  libgdbm-dev \
  libdb-dev \
  gettext \
  libssl-dev \
  libcurl4-openssl-dev \
  libpcre3-dev \
  libspeex-dev \
  libspeexdsp-dev \
  libsqlite3-dev \
  libedit-dev \
  libldns-dev \
  libpq-dev \
  libsndfile-dev \
  libopus-dev \
  liblua5.1-0-dev \
  yasm

RUN set -xe && \
  apt-get -y update && \
  apt-get install -y ${PACKAGES} ${BUILD_PACKAGES} && \
  mkdir -p /tmp/build && \
  cd /tmp/build && \
  git clone --depth=1 https://freeswitch.org/stash/scm/fs/freeswitch.git && \
  cd /tmp/build/freeswitch && \
  ./bootstrap.sh -j && \
  ./configure -C && \
  make && \
  make install && \
  make uhd-sounds-install && \
  make uhd-moh-install && \
  apt-get -y remove ${BUILD_PACKAGES} && \
  apt-get -y autoremove && \
  apt-get clean && \
  rm -rf /tmp/build

ENV PATH ${PATH}:/usr/local/freeswitch/bin

CMD ["/usr/local/freeswitch/bin/freeswitch"]