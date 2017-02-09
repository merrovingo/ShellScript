#! /bin/bash

USUARIO=$(whoami)
HOME_USUARIO=$(getent passwd "$USUARIO" | cut -d: -f6)

cd $HOME_USUARIO
pwd
