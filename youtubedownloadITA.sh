#!/bin/bash
#Copyright (c) 2014 MarcPhemt
#mrc.mng.mm@gmail.com
#Questo script è inteso per avere un interfaccia
#semplice per l uso di youtube-dl.

echo "************************"
echo "***YouTube Downloader***"
echo "************************"
echo "Questo script funziona SOLO"
echo "col programma Youtube-dl!!!"
echo " "
echo "Copia l URL dalla barra degli indirizzi"
echo "Incolla l URL" #'URL'
read URL
while [ 0 ]
do
  echo "Vuoi solo l Mp3? (s/n)" #'VAR'
  read VAR
   if [ $VAR == "s" ]
    then
     youtube-dl -x --audio-format mp3 --no-mtime $URL
     echo "BYE BYE"
     sleep 5s
    exit 0
   elif [ $VAR == "n" ]
    then
     echo "Che formato vuoi?"
     youtube-dl -F $URL
     echo "Digita il numero del formato." #'NUM'
     read NUM
     youtube-dl -f $NUM $URL
     echo "BYE BYE"
     sleep 5s
    exit 0
   else
    echo "Selezione sbagliata!! Usa 's' o 'n'!!" 
   fi
done 

exit
