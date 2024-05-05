# Función para contar el número de columnas en una línea específica
function contar_columnas(file, line_number) {
    while ((getline < file) > 0) {
        line_count++
        if (line_count == line_number) {
            return NF
            close(file)
        }
    }
}
function revisar_fecha(fecha)
{
    split(fecha, dateArr, /[-:. ]/)

    months = "JAN FEB MAR APR MAY JUN JUL AUG SEP OCT NOV DEC"
    split(months, monthArr," ")
	
    for (i=1; i<=12; i++) {
        if (dateArr[2] == monthArr[i]) {
            month = sprintf("%02d", i)
            break
        }
    }
	if (dateArr[8]=="PM") {
		fecha_ajustada = sprintf("%s-%s-%s %s:%s:%s", "20" dateArr[3], month, dateArr[1], dateArr[4]+12, dateArr[5], dateArr[6])
	}else{
		fecha_ajustada = sprintf("%s-%s-%s %s:%s:%s", "20" dateArr[3], month, dateArr[1], dateArr[4], dateArr[5], dateArr[6])
	}
	return fecha_ajustada
}


# Función para procesar una línea que cumple con cierta condición
function procesar_linea(linea) {
    if (match(linea, /(SUP.*[[:space:]])([0-9],)(.*)$/, arr)) {
        return sprintf("%s%s", arr[2], arr[3])
    }
}

# Función para encontrar las líneas que tienen más de cierto número de columnas
function columnas_adicionales(file, n) {
	# Reiniciar la posición del puntero del archivo al principio
    close(file)
    file = ARGV[1]
    ARGV[1] = file
	line_count = 1
    while ((getline < file) > 0) {
        #print $0
        num_columns = split($0, fields, ",")
        #print num_columns
		#print revisar_fecha($11)
        if (num_columns > n) {
            nuevo_valor++
			print procesar_linea($0) # Procesa la línea y la imprime
		} else {
            print $0
        }
		line_count++
    }
    
    close(file)
}

BEGIN {
    columnas_ = contar_columnas(ARGV[1], 1)
    columnas_adicionales(ARGV[1],columnas_)
}
