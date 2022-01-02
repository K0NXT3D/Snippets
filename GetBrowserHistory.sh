#!/bin/bash
# Simple Browser History Grabber.
# R. Seaverns 2020
# Prerequisites: sqlite3
# Google Chromium (Linux)
# Mozilla FireFox (Linux)

#Rip Chrome History
sqlite3 ~/.config/chromium/Default/History "select datetime(last_visit_time/1000000-11644473600,'unixepoch'),url from  urls order by last_visit_time asc" > ChromeHistory.txt;

#Rip Firefox History
sqlite3 ~/.mozilla/firefox/*default/places.sqlite "SELECT datetime(moz_historyvisits.visit_date/1000000,'unixepoch'), moz_places.url FROM moz_places, moz_historyvisits WHERE moz_places.id = moz_historyvisits.place_id"|sort|less > FirefoxHistory.txt;
