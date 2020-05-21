#grep "$1" 0312_Dealer_schedule | awk '{print $1, $2, $5, $6}'

printf "Enter date: "
read date1

printf "Enter time: "
read time1

echo "You have entered date = $date1 time = $time1"

grep -i "${time1}.*" ${date1}* | awk '{printf("%s %s %s %s \n", $1,$2,$5,$6)}'
