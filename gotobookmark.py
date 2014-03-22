#!/usr/bin/env python

import json
import subprocess

bookmarks_path="/home/christian/.config/chromium/Default/Bookmarks"
with open(bookmarks_path) as f:
    text = f.read()
    bookmarks = json.loads(text)

for bookmark in bookmarks['roots']['bookmark_bar']['children']:
    print(bookmark['name'],bookmark['url'])
