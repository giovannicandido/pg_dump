FROM alpine:3.5
MAINTAINER Giovanni Silva

RUN apk -Uv add python py-pip \
 && apk -UvX http://dl-4.alpinelinux.org/alpine/edge/main add postgresql \
 && pip install awscli \
 && apk --purge -v del py-pip \
 && rm -rf /var/cache/apk/*
ADD dump /

CMD ["/dump"]