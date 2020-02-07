FROM alpine:latest

RUN apk add --no-cache --virtual build-deps wget tar bzip2 \
  && wget --no-verbose https://download.kiwix.org/release/kiwix-tools/kiwix-tools_linux-x86_64.tar.gz -O kiwix-tools.tar.gz \
  && tar -xzf kiwix-tools.tar.gz --no-anchored kiwix-manage \
  && rm kiwix-tools.tar.gz \
  && mv kiwix-*/kiwix-manage . \
  && apk del build-deps

ENTRYPOINT ["/kiwix-manage"]
