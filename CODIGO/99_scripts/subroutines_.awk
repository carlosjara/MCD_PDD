# Función para contar el número de columnas en una línea específica
function contar_columnas(file, line_number) {
    # file : Archivo a procesar 
	# line_number: Numero de Linea a revisar 
	# [Cuidado]: se lee linea a linea (costoso)
    while ((getline < file) > 0) {
        line_count++
        if (line_count == line_number) {
            return NF
			close(file)
        }
    }
}

# Función para encontrar las líneas que tienen más de cierto número de columnas
function columnas_adicionales(file, n) {
    
	while ((getline < file) > 0) {
		line_count++
        
		num_columns = split($0, fields, ",")
        
		if (num_columns > n) {
			nuevo_valor++
        } else {
			print $0
		}
    }
	
	close(file)
}


BEGIN {
    columnas_ = contar_columnas(ARGV[1], 5)
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
