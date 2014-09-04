#!/bin/bash
#Copyright (c) 2014 MarcPhemt
#mrc.mng.mm@gmail.com
#download with Axel
echo "##################"
echo "Download with AXEL"
echo "##################"
echo "Ver 2.0"
echo "Paste the URL for download.."
read URL
axel -n 4 $URL
echo "FINISHED"
echo "Thank you for using the script :)"
sleep 3s
exit
