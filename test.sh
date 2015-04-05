#!/bin/bash

sudo systemctl start "$@"

systemctl status "$@"
