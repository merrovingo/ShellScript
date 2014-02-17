#!/bin/sh
# Script para instalar la paqueteria del sistema
# Probado en Ubuntu 12.04 LTS
# Autor: Enrique Tezozomoc Perez Campos
# merrovingo@gmail.com
#####################################################
#		Variables		#
#####################################################
DEBIAN_FRONTEND=noninteractive
USUARIO=$(id -u)
ID_ROOT="0"
#####################################################
#		Funciones		#
#####################################################
multimedia () {
	echo "Instalando VLC...."
	apt-get install -y vlc
	echo "Instalado VLC"
}
desarrollo () {
	echo "Instalando eclipse..."
	apt-get install -y eclipse
	echo "Instalado eclipse"
}
compresor () {
	echo "Instalando 7zip..."
	apt-get install -y p7zip
	echo "Instalado 7Zip"
}
#####################################################
#		Main			#
#####################################################
clear
echo "Instalador de paquetes"
echo "El Script debe de ser ejecutado como root"
echo "Comprobando..."
if test "$USUARIO" = "$ID_ROOT"
	then
	echo "Todo correcto, iniciando la instalacion..."
	multimedia	| tee -a paquetes.log
	desarrollo	| tee -a paquetes.log
	compresor	| tee -a paquetes.log
	exit 0
else
	echo "El Script necesita permisos de root"
	echo "Por favor vuelva a intentarlo..."
	exit 1
fi