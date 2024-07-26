#!/bin/bash

URL="https://rapportsoft.in:30002"

# below line will took the http response code
RESPONSE=$(curl -s -o /dev/null -w "%{http_code}" "$URL")

# below line will check the http response is 200 or not
if [ "$RESPONSE" -eq 200 ]; then
    echo "The application $URL is running and up."
else
    echo "The application $URL is down."
fi
