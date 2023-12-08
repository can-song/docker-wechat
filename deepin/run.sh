#! /user/bin/env bash
    
docker run -d --name deepin --device /dev/snd --ipc="host"\
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v /mnt:/mnt \
    -v /mnt/orange/deepin:/deepin \
    -v /home/songcan:/home/host \
    -e DISPLAY="unix${DISPLAY}" \
    -e XMODIFIERS=@im=fcitx \
    -e QT_IM_MODULE=fcitx \
    -e GTK_IM_MODULE=fcitx \
    -e AUDIO_GID="$(getent group audio | cut -d: -f3)" \
    -e GID="$(id -g)" \
    -e UID="$(id -u)" \
    songcan/deepin:latest