#! /bin/bash
while [ 0 ]
do
echo "Inserisci la data di nascita:"
read giorno mese anno
if [[ ! -z `echo $anno | grep '\<....\>'` ]]
then
 if ! echo $mese | grep [^[:alpha:]] > /dev/null
 then
  export mese=`echo $mese | tr 'a-z' 'A-Z' | cut -c -3`
  echo " "
  echo "Il giorno in cui sei nato era:"`date +%A --date=$giorno$mese$anno`
  exit 0
 else
  echo " "
  echo "Il giorno in cui sei nato era:"`date +%A --date=$anno-$mese-$giorno`
  exit 0
 fi
 else
 echo "L'anno deve essere di 4 cifre!"
fi 
done
exit
