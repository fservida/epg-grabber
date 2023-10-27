#!/bin/bash

npm --prefix /opt/epg_grabber/epg run grab -- --site=tv.blue.ch --cron="5 6,9,12,15,18,21,0 * * *" &
npm --prefix /opt/epg_grabber/epg run serve
