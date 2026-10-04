FROM alpine

# renovate: datasource=github-tags depName=flutter/flutter versioning=semver-coerced  
ARG FLUTTER_VERSION=3.47.6

RUN apk update
RUN apk add git gcompat clang cmake ninja pkgconfig bash curl

ENV FLUTTER_HOME=/root/tools/flutter \
    FLUTTER_VERSION=$FLUTTER_VERSION

RUN git clone --depth 1 --branch ${FLUTTER_VERSION} https://github.com/flutter/flutter.git ${FLUTTER_HOME}

ENV FLUTTER_ROOT=$FLUTTER_HOME
ENV PATH=$PATH:$FLUTTER_ROOT/bin

RUN flutter doctor
RUN chown -R root:root ${FLUTTER_HOME}