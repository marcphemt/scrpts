#Scaricare con Axel
figlet "AXEL"
echo "Incolla l URL del sito per il download.."
read URL
axel -n 4 $URL
figlet "FINISHED"
sleep 3s
exit
