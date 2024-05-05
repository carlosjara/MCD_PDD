function count_columns(file) {
    # Open the file
    while ((getline < file) > 0) {
        # Count the number of fields (columns) using comma as delimiter
        num_columns = split($0, fields, ",")
        # Close the file
        close(file)
        # Return the number of columns
        return num_columns
    }
}

# Función para encontrar las líneas que tienen más de 12 campos
function find_lines_with_more_than_12_columns(file) {
    # Abrir el archivo
    while ((getline < file) > 0) {
        # Contar el número de campos (columnas)
        num_columns = split($0, fields, ",")
        # Si el número de campos es mayor que 12, imprimir la línea
        if (num_columns > 12) {
            print "Linea con mas de 12 columnas:", $0
        }
    }
    # Cerrar el archivo
    close(file)
}

# Main program
BEGIN {
    # Print the number of columns in the specified file
    #print count_columns(ARGV[1])
	find_lines_with_more_than_12_columns(ARGV[1])
    # Exit after processing begins
    exit
}