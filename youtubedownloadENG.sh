#!/bin/bash
#Copyright (c) 2014 MarcPhemt
#mrc.mng.mm@gmail.com
echo "************************"
echo "***YouTube Downloader***"
echo "************************"
echo "This script works ONLY with"
echo "Yputube-dl program!!!!!!!!!"
echo " "
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
