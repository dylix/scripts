#!/bin/bash

# Change this to match your correct profile
PROFILE="8zgkv4kl.default"

cd "${HOME}/.mozilla/firefox"

if test -z "$(mount | grep -F "${HOME}/.mozilla/firefox/${PROFILE}" )"
then
    mount "${HOME}/.mozilla/firefox/${PROFILE}"
fi

if test -f "${PROFILE}/.unpacked"
then
    tar --exclude '.unpacked' -cpf packed.tmp.tar "$PROFILE"
    mv packed.tar packed.tar.old
    mv packed.tmp.tar packed.tar
else
    tar xpf packed.tar &&\
    touch "${PROFILE}/.unpacked"
fi
