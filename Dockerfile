FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
ARG LATEST_VERSION

RUN apt-get update \
  && apt-get install -y \
  # luanti deps
  build-essential \
  g++ \
  make \
  libc6-dev \
  cmake \
  libpng-dev \
  libjpeg-dev \
  libgl1-mesa-dev \
  libsqlite3-dev \
  libogg-dev \
  libvorbis-dev \
  libopenal-dev \
  libcurl4-gnutls-dev \
  libfreetype6-dev \
  zlib1g-dev \
  libgmp-dev \
  libjsoncpp-dev \
  libzstd-dev \
  libluajit-5.1-dev \
  gettext \
  # optional
  libsdl2-dev \
  openssl \
  libncurses5-dev \
  libncursesw5-dev \
  curl \
  # for fetching stuff
  git \
  wget \
  ca-certificates \
  # for linuxdeploy
  file \
  --no-install-recommends \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /workdir

RUN wget -nv -O linuxdeploy.AppImage https://github.com/linuxdeploy/linuxdeploy/releases/download/continuous/linuxdeploy-x86_64.AppImage && chmod +x linuxdeploy.AppImage

RUN wget -nv -O luanti-source.tar.gz "https://github.com/luanti-org/luanti/archive/refs/tags/${LATEST_VERSION}.tar.gz" && \
  mkdir -p luanti-source && \
  tar -xzf luanti-source.tar.gz --strip-components=1 -C luanti-source && \
  rm luanti-source.tar.gz

WORKDIR /workdir/luanti-source
RUN cmake -B ../luanti-build \
  -DCMAKE_CXX_FLAGS="-flto=auto" \
  -DCMAKE_INSTALL_PREFIX=/usr \
  -DCMAKE_BUILD_TYPE=MinSizeRel \
  -DRUN_IN_PLACE=FALSE \
  -DBUILD_UNITTESTS=FALSE \
  -DBUILD_DOCUMENTATION=FALSE \
  -DBUILD_SERVER=FALSE \
  -DENABLE_REDIS=FALSE \
  -DENABLE_POSTGRESQL=OFF

RUN cmake --build ../luanti-build --parallel "$(nproc)" --config Release

WORKDIR /workdir
RUN mkdir -p AppDir && DESTDIR=AppDir cmake --install luanti-build 

COPY build.sh /build.sh
RUN chmod +x /build.sh

CMD ["/build.sh"]