#!/bin/bash

if [ "$#" -ne 2 ]; then
  echo "${0} <certificates_path> <registry_host>"
else
  cert_path=${1}
  host=${2}

  if [ -d /etc/docker/certs.d/${host} ]; then
    rm -f /etc/docker/certs.d/${host}/*
  else
    mkdir -p /etc/docker/certs.d/${host}
  fi
  cp ${cert_path}/* /etc/docker/certs.d/${host}
fi
