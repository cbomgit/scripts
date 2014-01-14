#!/usr/bin/env python2.7

import pywapi

weather = pywapi.get_weather_from_weather_com('80013',units='imperial')
print weather["current_conditions"]["temperature"], "F", weather["current_conditions"]["text"]


