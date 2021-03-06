FROM coolq/wine-coolq

LABEL Maintainer="Z4HD@outlook.com"
LABEL SourceCodeAuthor="jqqqqqqqqqq@gmail.com"

WORKDIR /home/user

RUN apt update &&\
    apt -y install python3 python3-pip wget unzip

RUN wget -O /tmp/CTBSource.zip https://github.com/jqqqqqqqqqq/coolq-telegram-bot/archive/master.zip &&\
    sudo -Hu user unzip -d /home/user/ /tmp/CTBSource.zip &&\
    mv coolq-telegram-bot-master coolq-telegram-bot &&\
    cd ./coolq-telegram-bot &&\
    mv bot_constant-json.py bot_constant.py &&\
    pip3 install --upgrade pip &&\
    pip3 install -r requirements.txt &&\
    rm -f /tmp/CTBSource.zip

WORKDIR /home/user/coolq-telegram-bot

ENV CTB_JSON_SETTINGS_PATH="/home/user/coolq/bot_constant.json"
