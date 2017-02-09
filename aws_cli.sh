#! /bin/bash

# Script diseñado para funcionar en Debian 8.x
# Se debe ejecutar como root o sudo

USUARIO=$(whoami)
HOME_USUARIO=$(getent passwd "$USUARIO" | cut -d: -f6)

echo "Instalando Python pip"

apt-get install python-pip

echo "Instalando herramienta AWS..."

pip install --upgrade --user awscli

echo "Configurando las variables de entorno..."

cd $HOME_USUARIO

echo "export PATH=~/.local/bin:$PATH" >> .profile

source ~/.profile

echo "Instalacion terminada"

aws --version
