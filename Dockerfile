FROM alpine:latest
# gotta find a way to switch ARCH between x86_64 and armhf when building
ENV ARCH x86_64
RUN apk add --no-cache --virtual build-deps wget tar bzip2 \
  && wget --no-verbose https://download.kiwix.org/release/kiwix-tools/kiwix-tools_linux-$ARCH.tar.gz -O kiwix-tools.tar.gz \
  && tar -xzf kiwix-tools.tar.gz --no-anchored kiwix-manage --strip=1 -C / \
  && rm kiwix-tools.tar.gz \
  && apk del build-deps

ENTRYPOINT ["/kiwix-manage"]
