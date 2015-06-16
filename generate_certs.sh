#!/bin/bash

if [ "$#" -ne 1 ]; then
  echo "${0} <certificates_path>"
else
  path=${1}
  if [ ! -d ${path} ]; then
    mkdir ${path}
    openssl req -newkey rsa:2048 -nodes \
      -keyout ${path}/server.key \
      -x509 -days 365 -out ${path}/server.crt \
      -config openssl.cnf
  else
    echo "${path} already exists!"
  fi
fi
