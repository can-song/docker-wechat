#!/bin/bash

# groupmod -o -g "${AUDIO_GID}" audio
# groupmod -o -g "${VIDEO_GID}" video
# if [ "${GID}" != "$(id -g songcan)" ]; then
#     groupmod -o -g "$GID" songcan
# fi
# if [ "${UID}" != "$(id -u songcan)" ]; then
#     usermod -o -u $UID songcan
# fi

# shellcheck disable=SC2117
su - songcan

echo "start wechat"
"/opt/deepinwine/apps/Deepin-WeChat/run.sh"
sleep 300

while test -n "$(pidof WeChat.exe)"
do
    sleep 60
done
echo "exit"

# "/opt/deepinwine/apps/Deepin-$APP/run.sh"
