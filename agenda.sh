#!/bin/bash
# Script para realizar activiades de una agenda
# Autor: Enrique Tezozomoc Perez Campos
# FCA-UNAM
# merrovingo@gmail.com
#######################################################
#	Defincion de variables	#
AGENDA="Agenda.txt"
#######################################################
#	Defincion de funciones	#
#######################################################
nueva_agenda () {
	clear
	echo "Comprobando que no exista una agenda..."
	NOMBRE_AGENDA=$(ls $AGENDA)
	if test "$NOMBRE_AGENDA" = "$AGENDA"
		then
		echo "La agenda ya existe !!!"
		sleep 4
		sh agenda.sh
	else
		> $AGENDA
		echo "Agenda creada correctamente"
		sleep 4
		sh agenda.sh
	fi
}
nuevos_registros () {
	clear
	echo "Ingresa tu nombre:"
	read NOMBRE
	echo "Ingresa tu numero de telefono:"
	read TELEFONO
	echo "Ingresa tu fecha de nacimiento:"
	read NACIMIENTO
	echo "Ingresa tu direccion de correo electronico:"
	read MAIL
	echo "Nombre: $NOMBRE 	Telefono: $TELEFONO 	Fecha de nacimiento: $NACIMIENTO 	Correo electronico: $MAIL" >> $AGENDA
	echo "Datos almacenados correctamente"
	sleep 4
	sh agenda.sh
}
nueva_busqueda () {
	clear
	echo "Busqueda de registros"
	echo "Elige una opcion:"
	echo "1 - Buscar por nombre"
	echo "2 - Buscar por telefono"
	echo "3 - Buscar por fecha de nacimiento"
	echo "4 - Buscar por correo electronico"
	echo "5 - Salir"
	read RESPUESTA_BUSQUEDA
	case $RESPUESTA_BUSQUEDA in
		1) echo "Ingresa el nombre:"
		read BUSQUEDA_NOMBRE
		grep $BUSQUEDA_NOMBRE $AGENDA
		echo "Presiona cualquier tecla para continuar..."
		read pausa
		nueva_busqueda
		;;
		2) echo "Ingresa el numero de telefono:"
		read BUSQUEDA_TEL
		grep $BUSQUEDA_TEL $AGENDA
		echo "Presiona cualquier tecla para continuar..."
		read pausa
		nueva_busqueda
		;;
		3) echo "Ingresa la fecha de nacimiento:"
		read BUSQUEDA_FECHA
		grep $BUSQUEDA_FECHA $AGENDA
		echo "Presiona cualquier tecla para continuar..."
		read pausa
		nueva_busqueda
		;;
		4) echo "Ingresa la direccion de correo:"
		read BUSQUEDA_MAIL
		grep $BUSQUEDA_MAIL $AGENDA
		echo "Presiona cualquier tecla para continuar..."
		read pausa
		nueva_busqueda
		;;
		5) echo "Nos vemos..."
		;;
		*) echo "Selecciona una opcion valida"
		nueva_busqueda
		;;
	esac
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
	1) nueva_agenda
	;;
	2) nuevos_registros
	;;
	3) nueva_busqueda
	;;
	4) echo "Nos vemos..."
	;;
	*) echo "Opcion no valida, intentalo nuevamente"
	sleep 2
	sh agenda.sh
	;;
esac