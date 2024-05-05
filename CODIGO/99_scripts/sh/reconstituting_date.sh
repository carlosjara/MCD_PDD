#!/bin/bash

# Nombre del archivo de registro
log_file="reconstructing_exercise.txt"

# Función para ejecutar comandos y registrar el tiempo
execute_and_log() {
    command=$1

    # Mostrar el comando en el registro
    echo "Command: $command" >> "$log_file"

    # Ejecutar el comando y registrar el tiempo
    { date; $command; date;} 2>&1 | tee -a "$log_file"
    echo "" >> "$log_file"  # Agregar una línea en blanco al final para separar las entradas
}

# Limpiar el archivo de registro si ya existe
> "$log_file"

# Ejecutar los comandos de unzip
execute_and_log "unzip datag-nonstd-p1.zip"
execute_and_log "unzip datag-nonstd-p2.zip"
execute_and_log "unzip datag-nonstd-p3.zip"

# Combinar archivos datagaa, datagab y datagac en datagrams-nonstd.zip
execute_and_log "cat datagaa datagab datagac > datagrams-nonstd.zip"

# Comprobar la integridad del archivo zip
execute_and_log "time zip -T datagrams-nonstd.zip"

# Extraer datagrams-nonstd.zip
execute_and_log "time unzip datagrams-nonstd.zip"
