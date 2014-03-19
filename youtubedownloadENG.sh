#!/bin/bash
#Questo script è inteso per avere un interfaccia
#semplice per l uso di youtube-dl.
#Scritto per uso personale, siete liberi di modificarlo!
#Copyright @MarcPhemt, scritto con medit, OS archlinux.
echo "************************"
echo "***YouTube Downloader***"
echo "************************"
echo "Copy url of youtube video"
echo "Paste URL" #'URL'
read URL
while [ 0 ]
do
  echo "Do you want only Mp3? (y/n)" #'VAR'
  read VAR
   if [ $VAR == "y" ]
    then
     youtube-dl -x --audio-format mp3 --no-mtime $URL
     echo "BYE BYE"
     sleep 5s
    exit 0
   elif [ $VAR == "n" ]
    then
     echo "Choose format for the video"
     youtube-dl -F $URL
     echo "Select number of format" #'NUM'
     read NUM
     youtube-dl -f $NUM $URL
     echo "BYE BYE"
     sleep 5s
    exit 0
   else
    echo "Wrong!! Digit 'y' or 'n'!!" 
   fi
done 

exit
