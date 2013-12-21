#!/bin/bash

cat /etc/pacman.d/update.log | mail -s "Update Log" christianbboman@gmail.com
