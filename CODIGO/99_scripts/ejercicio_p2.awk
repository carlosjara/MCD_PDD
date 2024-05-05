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


{
	print sprintf("%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s",$1,$2,$3,$4,$5,$6,$7,$8,$9,$10,revisar_fecha($11),$12)
}
