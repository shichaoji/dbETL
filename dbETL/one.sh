#! /bin/sh

O="https://storage.scrapinghub.com/items/276632/";


for ((i=$2; i<$3; i++));

do
#echo $i
S="$O$1/$i"

name[i]="diary_$1_$i.csv"
#echo ${name[i]}

commend[i]="curl $S?apikey=secret&format=csv&fields=post_ID,comments,favor,views&include_headers=1"
#echo ${commend[i]}

done;

#${commend[13]} > ${name[13]}

# ------- exec 

: '
for idx in "${!commend[@]}"; do {

  echo "Process \"$idx\" started";

  ${commend[idx]} > ${name[idx]} & pid=$!

  PID_LIST+=" $pid";

} done



trap "kill $PID_LIST" SIGINT



echo "Parallel processes have started";


wait $PID_LIST

echo
'
# --- for loop
for idx in "${!commend[@]}"; do {


  echo "Process \"$idx\" started";

  ${commend[idx]} > ${name[idx]} 

} done


find . -maxdepth 1 -name '*.csv' -size -800000c -exec mv {} archive/trash \;
find . -maxdepth 1 -name 'diary*.csv' -size +1000k -exec mv {} data/ \;

echo "All processes have completed";





#curl $SS > post_`date +%T-%m-%d-%y`_dltm.csv


