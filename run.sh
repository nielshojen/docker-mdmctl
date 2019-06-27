#!/bin/sh

execConnect="/mdmctl config set"

if [[ ${CONFIG_NAME} ]]; then
  execConnect="${execConnect} -name ${CONFIG_NAME}"
  execSwitch="/mdmctl config switch -name ${CONFIG_NAME}"
else
  execConnect="${execConnect} -name production"
  execSwitch="/mdmctl config switch -name production"
fi

if [[ ${API_KEY} ]]; then
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

if [[ ${APNS_CERT} ]] && [[ ${APNS_CERT_PASS} ]] && [[ ${APNS_CERT_PASS} ]]; then
  execUpload="/mdmctl mdmcert upload -cert ${APNS_CERT} -private-key ${APNS_CERT_KEY} -password=${APNS_CERT_PASS}"
  echo "Uploading APNS Cert"
  eval $execUpload
fi

sleep infinity
