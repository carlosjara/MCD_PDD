#!/bin/bash

# Definir la función para descargar y registrar
download_and_log() {
    url=$1
    filename=$2
    log_file=$3

    # Imprimir el nombre del archivo que se está descargando
    echo "Downloading $filename..."
	# Imprimir el nombre del archivo que se está descargando en el archivo de registro
    echo "Downloading $filename..." >> "$log_file"
    # Ejecutar el comando time junto con wget para medir el tiempo de descarga
    { time wget --show-progress -O "$filename" "$url"; } 2>> "$log_file"

    # Agregar una línea en blanco al final para separar las entradas
    echo "" >> "$log_file"
}

# Nombre del archivo de registro
log_file="wget_log.txt"

# Limpiar el archivo de registro si ya existe
> "$log_file"

# Descargar cada archivo y registrar la salida
#download_and_log "https://icesiedu-my.sharepoint.com/:t:/g/personal/16282252_icesi_edu_co/EfBSOhG9OlZOs1FyJ5kkTrgBUKfhNLWBhLnbeD8Qlu_Qug?e=hYJZt9&download=1" "datag-211MRows-shasum.txt" "$log_file"
#download_and_log "https://icesiedu-my.sharepoint.com/:u:/g/personal/16282252_icesi_edu_co/ERtK4p0yrmhFsJpb70_HJQcB0DNgSLjKN0IFyT5MFrboqw?e=qXISZx&download=1" "datag-211MRows.zip" "$log_file"
download_and_log "https://icesiedu-my.sharepoint.com/:u:/g/personal/16282252_icesi_edu_co/EeW-IX84sANCj8WJiWb6ZSEBr-Rg_Qr1JhzfyYXgkgBYRg?e=CVXNcQ&download=1" "datag-nonstd-p1.zip" "$log_file"
download_and_log "https://icesiedu-my.sharepoint.com/:u:/g/personal/16282252_icesi_edu_co/EQh7AzMdFCFPsobZz8f5NRwBwldA0c5arCxV0WScl20FZA?e=z6Xf1q&download=1" "datag-nonstd-p2.zip" "$log_file"
download_and_log "https://icesiedu-my.sharepoint.com/:u:/g/personal/16282252_icesi_edu_co/EfYxbZUWFCRMu4CuqAo7i_QBXrqtZjykKQOmO63Lx1onbw?e=ORhFIQ&download=1" "datag-nonstd-p3.zip" "$log_file"
download_and_log "https://icesiedu-my.sharepoint.com/:t:/g/personal/16282252_icesi_edu_co/EV94nsbflR9GsuFUUK8tlcMBpr8Vhyp6YCRCC0I5Ul4UXQ?e=omFCvh&download=1" "datagrams-nonstd-shasum.txt" "$log_file"
download_and_log "https://icesiedu-my.sharepoint.com/:u:/g/personal/16282252_icesi_edu_co/EVgEBgIZo2JHu4MF5fgElekBDGRhlD61Eqpew7-sRtjMlw?e=TkGHoU&download=1" "datagrams-nonstd.zip" "$log_file"
download_and_log "https://icesiedu-my.sharepoint.com/:x:/g/personal/16282252_icesi_edu_co/EeagjJprX6hMsXsMtKSQYSUBeb43vJa8mx4GIeaLS8hhIQ?e=tdcKTF&download=1" "stops.csv" "$log_file"
download_and_log "https://icesiedu-my.sharepoint.com/:t:/g/personal/16282252_icesi_edu_co/Eal2nzrG9PdAjZzFgEjV7lMBzN61kNTQuVB_IgOUoskx6g?e=cat8kU&download=1" "stops-shasum.txt" "$log_file"