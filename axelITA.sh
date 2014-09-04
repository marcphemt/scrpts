#!/bin/bash
#Copyright (c) 2014 MarcPhemt
#mrc.mng.mm@gmail.com
#download with Axel
echo "##################"
echo "Download with AXEL"
echo "##################"
echo "Ver 2.0"
echo "Incolla l URL del sito per il download.."
read URL
axel -n 4 $URL
echo "HO FINITO"
echo "Grazie per aver usato lo script :)"
sleep 3s
exit
