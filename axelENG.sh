#download with Axel
figlet "AXEL"
echo "Paste the URL for download.."
read URL
axel -n 4 $URL
figlet "FINISHED"
sleep 3s
exit
