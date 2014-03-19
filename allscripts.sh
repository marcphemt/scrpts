#copyright @ Marcphemt 19/03/2014
#email mrc.mng.mm@gmail.com

#! /bin/bash

#functions
function cancel()
{
   clear
   echo ""
}

function begin()
{ 
clear
  echo "****************************"
  echo "Download Marcphemt's scripts"
  echo "****************************"
  echo " " 
  declare -a options
  options[${#options[*]}]="Install Photo Of The Day";
  options[${#options[*]}]="Install Axel";
  options[${#options[*]}]="Install Meteo Ora Per Ora (only IT)";
  options[${#options[*]}]="Install Google Translate";
  options[${#options[*]}]="Install Youtube Dowload";
  options[${#options[*]}]="Install Birth Date";
  options[${#options[*]}]="Esc";
  select opt in "${options[@]}"; do
  case ${opt} in
  
  ${options[0]}) photooftheday;;
  ${options[1]}) axel;;
  ${options[2]}) meteooraperora;;
  ${options[3]}) translate;;
  ${options[4]}) youtube;;
  ${options[5]}) birthdate;;
   
  (Esc) break; ;;
  esac;
  done
}

function photooftheday()
{
 cancel
 
 wget https://github.com/marcphemt/scrpts/raw/master/photooftheday.sh
 chmod +x photooftheday.sh
 echo "Use it typing ./photooftheday.sh"
 echo "Press ENTER"
 read
 returne
}

function axel()
{
 cancel
 
 echo "Do you want the script in english or italiano? (Type eng/ita)"
 read ling
  if [[ $ling == eng ]]
  then
   wget https://github.com/marcphemt/scrpts/raw/master/axelENG.sh
   chmod +x axelENG.sh
   echo "Use it typing ./axelENG.sh"
   echo "Press ENTER"
   read
  elif [[ $ling == ita ]]
  then
   wget https://github.com/marcphemt/scrpts/raw/master/axelITA.sh
   chmod +x axelITA.sh
   echo "Usa lo script scrivendo ./axelITA.sh"
   echo "Premi INVIO"
   read
  fi
 returne 
}

function meteooraperora()
{
 cancel
 
 echo "Remember, this script is only for Italian towns!"
 echo "Press ENTER to install, or type esc to quit.."
 read tas
  if [[ $tas == esc ]]
  then
   returne
  else
   if [ -e /bin/figlet ]
    then
	wget https://github.com/marcphemt/scrpts/raw/master/meteooraperora.sh
	chmod +x meteooraperora.sh
	echo "Usa lo script scrivendo ./meteooraperora.sh"
    echo "Premi INVIO"
    read
   else
    wget https://github.com/marcphemt/scrpts/raw/master/meteooraperora1.sh
	chmod +x meteooraperora1.sh
	echo "Usa lo script scrivendo ./meteooraperora1.sh"
    echo "Premi INVIO"
    read
   fi
  fi
 returne 
}

function youtube()
{
 cancel
 
 if [ -e /bin/youtube-dl ]
 then
  echo "Do you want the script in english or italiano? (Type eng/ita)"
  read a
   if [[ $a == eng ]]
    then
    wget https://github.com/marcphemt/scrpts/raw/master/youtubedownloadENG.sh
    chmod +x youtubedownloadENG.sh
    echo "Use it typing ./youtubedownloadENG.sh"
    echo "Press ENTER"
    read
	returne
   elif [[ $a == ita ]]
    then
    wget https://github.com/marcphemt/scrpts/raw/master/youtubedownloadITA.sh
    chmod +x youtubedownloadITA.sh
    echo "Usa lo script scrivendo ./youtubedowloadITA.sh"
    echo "Premi INVIO"
    read
	returne
   fi
 else
   echo "Figlet is not istelled on your machine!!"
   echo "Install it, and retry!"
 fi 
 returne
}

function birthdate()
{
 cancel
 
 echo "Is only in italian.....for now! ^^ "
 read
 wget https://github.com/marcphemt/scrpts/raw/master/esercizio_giornodinascita.sh
 chmod +x esercizio_giornodinascita.sh
 echo "Usa lo script scrivendo ./esercizio_giornodinascita.sh"
 echo "Premi INVIO"
 read
 returne
}

function translate()
{
 cancel
 
 if [ -e /bin/translate ]
  then
  wget https://github.com/marcphemt/scrpts/raw/master/translate.sh
  chmod +x translate.sh
  echo "Use it typing ./translate.sh"
  echo "Press ENTER"
  read
  returne
 else
  echo "You have to install google-translate-cli!!"
  echo "Install it than retry!"
  echo "Press ENTER"
  read
  returne
 fi
 returne 
   
}


function returne()
{
 cancel
 begin
 exit   
}


begin
