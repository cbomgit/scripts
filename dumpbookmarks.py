#!/usr/bin/env python2.7

import json

#open and read the bookmarks file to a string object
bookmarks_file = open("/home/christian/.config/chromium/Default/Bookmarks", 'r')
bookmarks = bookmarks_file.read()

#encode the string to a JSON object, then get a dict`
json.dumps(bookmarks)
bookmarks = json.loads(bookmarks)

for str in bookmarks["roots"]["bookmark_bar"]["children"]:
    print str["url"]

#close the boomarks file
bookmarks_file.close()
