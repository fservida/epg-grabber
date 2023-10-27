FROM node:current-alpine3.17

RUN apk update && \
    apk add --no-cache bash git && \
    adduser -D -s /bin/bash epg_grabber

RUN mkdir /opt/epg_grabber && \
    chown epg_grabber /opt/epg_grabber

USER epg_grabber
WORKDIR /opt/epg_grabber/

COPY start.sh /opt/epg_grabber/start.sh

RUN git clone --depth 1 -b master https://github.com/iptv-org/epg.git /opt/epg_grabber/epg && \
    cd /opt/epg_grabber/epg && \
    npm install

EXPOSE 3000

CMD bash -c "/opt/epg_grabber/start.sh"