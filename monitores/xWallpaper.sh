#!/bin/bash

while true;do
	# Carpetas con fondos
	WALLPAPER_DIR1="/mnt/datos/Wallpapers/Horizontal/"
	WALLPAPER_DIR2="/mnt/datos/Wallpapers/Vertical/"

	# Seleccionar una imagen aleatoria de cada carpeta
	IMG1=$(find "$WALLPAPER_DIR1" -type f \( -iname '*.jpg' -o -iname '*.png' \) | shuf -n 1)
	IMG2=$(find "$WALLPAPER_DIR2" -type f \( -iname '*.jpg' -o -iname '*.png' \) | shuf -n 1)

	# Establecer como fondo de escritorio para dos monitores
	# Ójo con esto, feh asigna los fondos en función de como los devuelva xrandr --listmonitors
	feh --no-fehbg --bg-fill "$IMG1" "$IMG2"

	sleep 5m
done
