FROM docker:19.03.6-dind


ENV TZ="Asia/Chongqing"

RUN sed -i 's#https\?://dl-cdn.alpinelinux.org/alpine#https://mirrors.cqupt.edu.cn/alpine#g' /etc/apk/repositories \
    && apk upgrade \
    && apk add --no-cache bash jq  tzdata vim gcompat  \
    && ln -sf /usr/share/zoneinfo/${TZ} /etc/localtime \
    && echo ${TZ} > /etc/timezone



COPY image-sync.sh /usr/bin/image-sync.sh
RUN chmod +x /usr/bin/image-sync.sh
CMD ["/bin/bash", "/usr/bin/image-sync.sh"]
