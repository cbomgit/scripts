#!/bin/bash

su - christian -c /home/christian/networkconnect

ln -sf /run/systemd/resolve/resolv.conf /etc/resolv.conf
