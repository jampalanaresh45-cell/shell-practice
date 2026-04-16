#!/bin/bash

TO_ADDRESS="$1"
SUBJECT="$2"
ALERT_TYPE="$3"
MESSAGE_BODY="$4"
IP_ADDRESS="$5"
To_TEAM="$6"

escape() {
  printf '%s' "$1" | sed 's/[&|]/\\&/g'
}

FORMATTED_BODY=$(escape "$MESSAGE_BODY")
To_TEAM=$(escape "$To_TEAM")
ALERT_TYPE=$(escape "$ALERT_TYPE")
IP_ADDRESS=$(escape "$IP_ADDRESS")

FINAL_BODY=$(sed -e "s|TO_TEAM|$To_TEAM|g" \
                 -e "s|ALERT_TYPE|$ALERT_TYPE|g" \
                 -e "s|IP_ADDRESS|$IP_ADDRESS|g" \
                 -e "s|MESSAGE|$FORMATTED_BODY|g" template.html)

{
echo "To: $TO_ADDRESS"
echo "Subject: $SUBJECT"
echo "Content-Type: text/html"
echo ""
echo "$FINAL_BODY"
} | msmtp "$TO_ADDRESS"