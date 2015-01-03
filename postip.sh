#!/bin/bash

echo url="https://www.duckdns.org/update?domains=boman&token=0ca3cf04-4aff-4d65-97e8-409fdd4d2b53&ip=" | curl -k -o ~/.cache/duckdns/duck.log -K -

