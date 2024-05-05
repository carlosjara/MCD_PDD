###
### Codigo Grupo : Laura Espinosa - Carlos Jaramillo
### 
###
###
###

function contar_columnas(file, line_number) {
    while ((getline < file) > 0) {
        line_count++
        if (line_count == line_number) {
            return NF
            close(file)
        }
    }
}

function procesar_linea(linea) {
    if (match(linea, /(SUP.*[[:space:]])([0-9],)(.*)$/, arr)) {
        return sprintf("%s%s", arr[2], arr[3])
    }
}

function columnas_adicionales(file, n) {
	close(file)
    file = ARGV[1]
    ARGV[1] = file
	line_count = 1
    while ((getline < file) > 0) {
        num_columns = split($0, fields, ",")
        if (num_columns > n) {
            nuevo_valor++
			print procesar_linea($0)
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
     # start_line = 999998
     # end_line = 1000010
    
    # Count the number of columns in line 1000000
     # while ((getline < ARGV[1]) > 0) {
		 # contador++
         # if (contador >= start_line && contador <= end_line) {
			 # num_columns = split($0, fields, ",")
			 # if (num_columns >columnas_) {
				 # nuevo_valor++
			 # } else {
				 # print $0
			 # }
         # } else if (contador > end_line) {
             # break
         # }
     # }
     # exit
