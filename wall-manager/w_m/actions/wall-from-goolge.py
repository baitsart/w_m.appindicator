#!/usr/bin/env python
import os
import sys
import time
from urllib import FancyURLopener
import urllib2
import simplejson
import random
from sys import argv as s
searchTerm = (s[1] if len(s)>1 else 'Wallpaper HD')

# Replace spaces ' ' in search term for '%20' in order to comply with request
searchTerm = searchTerm.replace(' ','%20')

count= 0

for i in range(5):
    # Notice that the start changes for each iteration in order to request a new set of images for each loop

    url = ('https://ajax.googleapis.com/ajax/services/search/images?' +
       'v=1.0&q='+searchTerm+'&userip=192.168.0.1&start='+str(random.randrange(1, 50))+'&imgsz=xxlarge''&as_filetype=jpg''rsz=[1-8]')

    request = urllib2.Request(url, None, {'Referer': 'testing'})
    response = urllib2.urlopen(request)

    # Get results using JSON
    results = simplejson.load(response)
    data = results['responseData']
    dataInfo = data['results']

    # Iterate for each result and get unescaped url
    for myUrl in dataInfo:
        count = count + 1
        print myUrl['unescapedUrl']
