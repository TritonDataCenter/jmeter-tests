#!/bin/bash

now=$(date -u "+%a, %d %h %Y %H:%M:%S GMT")
alg=rsa-sha256
if [ -z ${KEY_LOCATION} ];
then 
  KEY_LOCATION=$HOME/.ssh/id_rsa.pub;
  P_KEY=$HOME/.ssh/id_rsa 
fi
MANTA_KEY_ID=$(ssh-keygen -E md5 -lf $KEY_LOCATION | sed 's/MD5://' | awk '{print $2}')
keyId=/$MANTA_USER/keys/$MANTA_KEY_ID
now=$(date -u "+%a, %d %h %Y %H:%M:%S GMT")
sig=$(echo "date:" $now | \
		    tr -d '\n' | \
                    openssl dgst -sha256 -sign ${P_KEY} | \
                    openssl enc -e -a | tr -d '\n')
printf "{ \n    \"alg\" : \"$alg\",\n    \"key\" : \"${keyId}\" ,\n    \"sig\" : \"${sig}\",\n    \"date\" : \"${now}\" }\n"
       
