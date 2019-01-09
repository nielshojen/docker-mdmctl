#!/bin/sh

execConnect="/mdmctl config"

# add api key if specified
if [[ ${CONFIG_NAME} ]]; then
  execConnect="${execConnect} -name ${CONFIG_NAME}"
  execSwitch="mdmctl config switch -name ${CONFIG_NAME}"
else
  execConnect="${execConnect} -name production"
  execSwitch="mdmctl config switch -name production"
fi

if [[ ${API_KEY} = true ]]; then
  execConnect="${execConnect} -api-token ${API_KEY}"
else
  execConnect="${execConnect} -api-token NONE"
fi

if [[ ${SERVER_URL} ]]; then
  execConnect="${execConnect} -server-url ${SERVER_URL}"
else
  execConnect="${execConnect} -server-url https://micromdm.example.com"
fi

echo "Connecting using: $execConnect"
eval $execConnect

echo "Select config using: $execSwitch"
eval $execSwitch

sleep 3600
