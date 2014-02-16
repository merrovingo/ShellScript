#!/bin/bash
# Script para realizar activiades de una agenda
# Autor: Enrique Tezozomoc Perez Campos
# FCA-UNAM
# merrovingo@gmail.com
#######################################################
#	Defincion de funciones	#
#######################################################
function nuevos_registros(){
	clear
	echo "Ingresa tu nombre:"
	read NOMBRE
	echo "$NOMBRE" >> $AGENDA
	echo "Ingresa tu numero de telefono:"
	read TELEFONO
	echo "$TELEFONO" >> $AGENDA
	echo "Ingresa tu fecha de nacimiento:"
	read NACIMIENTO
	echo "$NACIMIENTO" >> $AGENDA
	echo "Ingresa tu direccion de correo electronico:"
	read MAIL
	echo "$MAIL" >> $AGENDA
	echo "Datos almacenados correctamente en $AGENDA"
	sh agenda.sh
}
function nueva_agenda(){
	clear
	echo "Ingresa el nombre para tu agenda:"
	read AGENDA
	touch $AGENDA
	echo "Agenda creada correctamente"
	sh agenda.sh
}
#########################################################
#		Main				#
#########################################################
clear
echo "----------- Agenda -----------"
echo "------------------------------"
echo "Elige una opcion:"
echo "1 - Crear una agenda"
echo "2 - Crear un registro nuevo"
echo "3 - Buscar un registro"
echo "4 - Salir"
read RESPUESTA
case $RESPUESTA in
	1) nueva_agenda()
	;;
	2) nuevos_registros()
	;;
	4) echo "Nos vemos..."
	exit
	;;
	*) echo "Opcion no valida, intentalo nuevamente"
	sh agenda.sh
	;;
esac