FROM bestwu/wechat:latest

# RUN apt-get update -y --allow-unauthenticated && \
#     apt-get install -y --no-install-recommends procps deepin.com.wechat

ENV HOSTNAME=deepin
# RUN echo "deepin" > /etc/hostname

RUN apt-get update -y
# RUN apt-get install -y --no-install-recommends procps sudo
# RUN echo "songcan	ALL=(ALL:ALL) ALL" >> /etc/sudoers

# RUN apt-get install -y --no-install-recommends procps git vim

RUN apt-get -y autoremove --purge && apt-get autoclean -y && apt-get clean -y && \
    find /var/lib/apt/lists -type f -delete && \
    find /var/cache -type f -delete && \
    find /var/log -type f -delete && \
    find /usr/share/doc -type f -delete && \
    find /usr/share/man -type f -delete

ENV APP=WeChat \
    AUDIO_GID=63 \
    VIDEO_GID=39 \
    GID=1000 \
    UID=1000

RUN userdel -rf wechat

RUN groupadd -o -g $GID songcan && \
    groupmod -o -g $AUDIO_GID audio && \
    groupmod -o -g $VIDEO_GID video && \
    useradd -d "/home/songcan" -m -o -u $UID -g songcan -G audio,video songcan


RUN mkdir -p /deepin/wechat && \
    chown songcan:songcan /deepin && \
    ln -sn "/deepin/wechat" "home/songcan/WeChat Files"

RUN chmod +777 /tmp

VOLUME [ "/deepin" ]

ADD entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
# RUN rm /entrypoint.sh
# ENTRYPOINT [ "/opt/deepinwine/apps/Deepin-$APP/run.sh" ]

ADD wechat.sh /home/songcan/start
RUN chmod +x /home/songcan/start

WORKDIR /home/songcan/
USER songcan