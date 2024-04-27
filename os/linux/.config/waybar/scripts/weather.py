#!/bin/python
# -*- coding: utf-8 -*-

# Procedure
# Surf to https://openweathermap.org/city
# Fill in your CITY
# e.g. Antwerp Belgium
# Check url
# https://openweathermap.org/city/2803138
# you will the city code at the end
# create an account on this website
# create an api key (free)
# LANG included thanks to krive001 on discord


import requests
import time

CITY = "3919968"
API_KEY = "db3a6fb4df5aa2e5158c9673b45f992d"
UNITS = "Metric"
UNIT_KEY = "C"
# UNIT_KEY = "F"
# LANG = "en"
LANG = "es"
# LANG = "nl"
# LANG = "hu"

REQ = requests.get(
    "http://api.openweathermap.org/data/2.5/weather?id={}&lang={}&appid={}&units={}".format(
        CITY, LANG, API_KEY, UNITS
    )
)
try:
    # HTTP CODE = OK
    if REQ.status_code == 200:
        CURRENT = REQ.json()["weather"][0]["description"].capitalize()
        TEMP = int(float(REQ.json()["main"]["temp"]))
        print("{}, {}°{}".format(CURRENT, TEMP, UNIT_KEY))
        time.sleep(600)
    else:
        print("Error: BAD HTTP STATUS CODE " + str(REQ.status_code))
        time.sleep(2)
except (ValueError, IOError):
    print("Error: Unable print the data")
    time.sleep(2)
