#FNR <  10  {print $0}
#NR  == 11		 {print "..." FNR " - " NR }
$2 ~ /2019\/09\/[3]/ {print $0}