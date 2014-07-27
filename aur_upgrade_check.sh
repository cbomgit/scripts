#!/bin/bash

PACKAGES="$(pacaur -k)"

echo $PACKAGES | mail -s "AUR Updates" christianbboman@gmail.com
