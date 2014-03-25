#! /bin/bash

#Colors:
red="\e[0;31m"
green="\e[0;32m"
yell="\e[1;33m"
blue="\e[0;34m"
z="\e[0m"



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
  options[${#options[*]}]="Install International Weather";
  options[${#options[*]}]="Esc";
  select opt in "${options[@]}"; do
  case ${opt} in
  
  ${options[0]}) photooftheday;;
  ${options[1]}) axel;;
  ${options[2]}) meteooraperora;;
  ${options[3]}) translate;;
  ${options[4]}) youtube;;
  ${options[5]}) birthdate;;
  ${options[6]}) inter;;
   
  (Esc) break; ;;
  esac;
  done
}

function inter()
{
 cancel
 wget https://github.com/marcphemt/scrpts/raw/master/weather.sh
 chmod +x weather.sh
 echo -e "Use it typing $yell ./weather.sh $z"
 echo -e "Press $green ENTER $z"
 read
 returne
 
}	

function photooftheday()
{
 cancel
 
 wget https://github.com/marcphemt/scrpts/raw/master/photooftheday.sh
 chmod +x photooftheday.sh
 echo -e "Use it typing $yell ./photooftheday.sh $z"
 echo -e "Press $green ENTER $z"
 read
 returne
}

function axel()
{
 cancel
 
 echo -e "Do you want the script in english or italiano? $yell (Type eng/ita) $z"
 read ling
  if [[ $ling == eng ]]
  then
   wget https://github.com/marcphemt/scrpts/raw/master/axelENG.sh
   chmod +x axelENG.sh
   echo -e "Use it typing $yell ./axelENG.sh $z"
   echo -e "Press $green ENTER $z"
   read
  elif [[ $ling == ita ]]
  then
   wget https://github.com/marcphemt/scrpts/raw/master/axelITA.sh
   chmod +x axelITA.sh
   echo -e "Usa lo script scrivendo $yell ./axelITA.sh $z"
   echo -e "Premi $green INVIO $z"
   read
  else
   echo -e "$red type 'eng' or 'ita' $z" 
   echo -e "Press $green ENTER $z"
   read
   axel
  fi
 returne 
}

function meteooraperora()
{
 cancel
 
 echo -e "$red Remember, this script is only for Italian towns! $z"
 echo -e "Press $green ENTER $z to install, or type $red 'esc' $z to quit.."
 read tas
  if [[ $tas == esc ]]
  then
   returne
  else
   if [ -e /bin/figlet ]
    then
	wget https://github.com/marcphemt/scrpts/raw/master/meteooraperora.sh
	chmod +x meteooraperora.sh
	echo -e "Usa lo script scrivendo $yell ./meteooraperora.sh $z"
    echo -e "Premi $green INVIO $z"
    read
   else
    wget https://github.com/marcphemt/scrpts/raw/master/meteooraperora1.sh
	chmod +x meteooraperora1.sh
	echo -e "Usa lo script scrivendo $yell ./meteooraperora1.sh $z"
    echo -e "Premi $green INVIO $z"
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
  echo -e "Do you want the script in english or italiano? $yell (Type eng/ita) $z"
  read a
   if [[ $a == eng ]]
    then
    wget https://github.com/marcphemt/scrpts/raw/master/youtubedownloadENG.sh
    chmod +x youtubedownloadENG.sh
    echo -e "Use it typing $yell ./youtubedownloadENG.sh $z"
    echo -e "Press $green ENTER $z"
    read
	returne
   elif [[ $a == ita ]]
    then
    wget https://github.com/marcphemt/scrpts/raw/master/youtubedownloadITA.sh
    chmod +x youtubedownloadITA.sh
    echo -e "Usa lo script scrivendo $yell ./youtubedowloadITA.sh $z"
    echo -e "Premi $green INVIO $z"
    read
	returne
   else
    echo -e "$red Type 'eng' or 'ita' $z"
	echo -e "Press $green ENTER $z"
	read
	youtube
   fi
 else
   echo -e "$red Figlet is not istelled on your machine!! $z"
   echo -e "$red Install it, and retry! $z"
 fi 
 returne
}

function birthdate()
{
 cancel
 
 echo -e "$red Is only in italian.....for now! ^^ $z"
 read
 wget https://github.com/marcphemt/scrpts/raw/master/esercizio_giornodinascita.sh
 chmod +x esercizio_giornodinascita.sh
 echo -e "Usa lo script scrivendo $yell ./esercizio_giornodinascita.sh $z"
 echo -e "Premi $green INVIO $z"
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
  echo -e "Use it typing $yell ./translate.sh $z"
  echo -e "Press $green ENTER $z"
  read
  returne
 else
  echo -e "$red You have to install google-translate-cli!! $z"
  echo -e "$yell Install it than retry! $z"
  echo -e "Press $green ENTER $z"
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
