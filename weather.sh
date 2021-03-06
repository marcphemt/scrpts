#! /bin/bash
#Colors:
r="\e[0;31m"
green="\e[0;32m"
y="\e[1;33m"
blue="\e[0;34m"
z="\e[0m"


function info()
{
clear
echo -e $green "######################################################" $z
echo " In order to use the script go to"
echo -e "$y http://weather.yahoo.com/ $z, then"
echo " search for your city and copy the"
echo " code (i.e. 718112) from the address bar"
echo -e $green "THANK YOU!" $z
echo -e $green "######################################################" $z
echo ""
echo "Now paste here the [CODE] of the city.."
read VAR1
rm .city.txt 2> /dev/null
touch .city.txt
echo "$VAR1" >> .city.txt
echo "ALL DONE"
echo "Press ENTER to restart the script"
read
}

function weather()
{
VAR=`cat .city.txt`
DATA=`date +%u`
curl -s "http://weather.yahooapis.com/forecastrss?w=$VAR&u=c" > ~/weather.xml
temp=`grep "yweather:condition" ~/weather.xml | grep -o "temp=\"[^\"]*\"" | grep -o "\"[^\"]*\"" | grep -o "[^\"]*"`
cond=`grep "yweather:condition" ~/weather.xml | grep -o "text=\"[^\"]*\"" | grep -o "\"[^\"]*\"" | grep -o "[^\"]*"`
wind=`grep "yweather:wind" ~/weather.xml | grep -o "speed=\"[^\"]*\"" | grep -o "\"[^\"]*\"" | grep -o "[^\"]*"`
k=`grep "yweather:units" ~/weather.xml | grep -o "speed=\"[^\"]*\"" | grep -o "\"[^\"]*\"" | grep -o "[^\"]*"`
h=`grep "yweather:atmosphere" ~/weather.xml | grep -o "humidity=\"[^\"]*\"" | grep -o "\"[^\"]*\"" | grep -o "[^\"]*"`
hour=`grep "yweather:condition" ~/.cache/weather.xml | grep -o "date=\"[^\"]*\"" | grep -o "\"[^\"]*\"" | grep -o "[^\"]*" | sed -e 's/CET//g'`
city=`grep "yweather:location" ~/weather.xml | grep -o "city=\"[^\"]*\"" | grep -o "\"[^\"]*\"" | grep -o "[^\"]*"`
a=`grep "day=" ~/weather.xml | grep "Mon" | grep -o "text=\"[^\"]*\"" | grep -o "\"[^\"]*\"" | grep -o "[^\"]*" | tr '/' ' '`
conda=`grep "Mon" ~/weather.xml | grep -o "high=\"[^\"]*\"" | grep -o "\"[^\"]*\"" | grep -o "[^\"]*" | tr '/' ' '`
condaa=`grep "Mon" ~/weather.xml | grep -o "low=\"[^\"]*\"" | grep -o "\"[^\"]*\"" | grep -o "[^\"]*" `
b=`grep "day=" ~/weather.xml | grep "Tue" | grep -o "text=\"[^\"]*\"" | grep -o "\"[^\"]*\"" | grep -o "[^\"]*" | tr '/' ' '`
condb=`grep "Tue" ~/weather.xml | grep -o "high=\"[^\"]*\"" | grep -o "\"[^\"]*\"" | grep -o "[^\"]*"`
condbb=`grep "Tue" ~/weather.xml | grep -o "low=\"[^\"]*\"" | grep -o "\"[^\"]*\"" | grep -o "[^\"]*"`
c=`grep "day=" ~/weather.xml | grep "Wed" | grep -o "text=\"[^\"]*\"" | grep -o "\"[^\"]*\"" | grep -o "[^\"]*" | tr '/' ' '`
condc=`grep "Wed" ~/weather.xml | grep -o "high=\"[^\"]*\"" | grep -o "\"[^\"]*\"" | grep -o "[^\"]*"`
condcc=`grep "Wed" ~/weather.xml | grep -o "low=\"[^\"]*\"" | grep -o "\"[^\"]*\"" | grep -o "[^\"]*"`
d=`grep "day=" ~/weather.xml | grep "Thu" | grep -o "text=\"[^\"]*\"" | grep -o "\"[^\"]*\"" | grep -o "[^\"]*" | tr '/' ' ' `
condd=`grep "Thu" ~/weather.xml | grep -o "high=\"[^\"]*\"" | grep -o "\"[^\"]*\"" | grep -o "[^\"]*"`
conddd=`grep "Thu" ~/weather.xml | grep -o "low=\"[^\"]*\"" | grep -o "\"[^\"]*\"" | grep -o "[^\"]*"`
e=`grep "day=" ~/weather.xml | grep "Fri" | grep -o "text=\"[^\"]*\"" | grep -o "\"[^\"]*\"" | grep -o "[^\"]*" | tr '/' ' '`
conde=`grep "Fri" ~/weather.xml | grep -o "high=\"[^\"]*\"" | grep -o "\"[^\"]*\"" | grep -o "[^\"]*"`
condee=`grep "Fri" ~/weather.xml | grep -o "low=\"[^\"]*\"" | grep -o "\"[^\"]*\"" | grep -o "[^\"]*"`
f=`grep "day=" ~/weather.xml | grep "Sat" | grep -o "text=\"[^\"]*\"" | grep -o "\"[^\"]*\"" | grep -o "[^\"]*" | tr '/' ' '`
condf=`grep "Sat" ~/weather.xml | grep -o "high=\"[^\"]*\"" | grep -o "\"[^\"]*\"" | grep -o "[^\"]*"`
condff=`grep "Sat" ~/weather.xml | grep -o "low=\"[^\"]*\"" | grep -o "\"[^\"]*\"" | grep -o "[^\"]*"`
g=`grep "day=" ~/weather.xml | grep -w "Sun" | grep -o "text=\"[^\"]*\"" | grep -o "\"[^\"]*\"" | grep -o "[^\"]*" | tr '/' ' '`
condg=`grep -w "Sun" ~/weather.xml | grep -o "high=\"[^\"]*\"" | grep -o "\"[^\"]*\"" | grep -o "[^\"]*"`
condgg=`grep -w "Sun" ~/weather.xml | grep -o "low=\"[^\"]*\"" | grep -o "\"[^\"]*\"" | grep -o "[^\"]*"`

if [[ $DATA == 7 ]]
 then
 meteo1
 elif [[ $DATA == 1 ]]
 then
 meteo2
 elif [[ $DATA == 2 ]]
 then
 meteo3
 elif [[ $DATA == 3 ]]
 then
 meteo4
 elif [[ $DATA == 4 ]]
 then
 meteo5
 elif [[ $DATA == 5 ]]
 then
 meteo6
 elif [[ $DATA == 6 ]]
 then
 meteo7
fi
}

function meteo1()
{
echo -e "$green TODAY$z"
echo " $city, $cond $temp°" 
echo -e " Wind: $wind$k Humidity: $h%"
echo " $hour"
echo -e $blue" #################################"$z
echo -e "$green SUN=$z $g \n     $r MAX:$z $condg°$y MIN:$z $condgg° " 
echo ""
echo -e "$green MON=$z $a \n     $r MAX:$z $conda°$y MIN:$z $condaa° "
echo ""
echo -e "$green TUE=$z $b \n     $r MAX:$z $condb°$y MIN:$z $condbb° "
echo ""
echo -e "$green WED=$z $c \n     $r MAX:$z $condc°$y MIN:$z $condcc° "
echo ""
echo -e "$green THU=$z $d \n     $r MAX:$z $condd°$y MIN:$z $conddd° "
echo -e $blue" #################################"$z
rm ~/weather.xml 2> /dev/null
echo " Thank You For Using The Script!"
echo " Press ENTER"
read
exit 0
}

function meteo2()
{
echo -e "$green TODAY$z"
echo " $city, $cond $temp°"
echo -e " Wind: $wind$k Humidity: $h%"
echo " $hour" 
echo -e $blue" #################################"$z
echo -e "$green MON=$z $a \n     $r MAX:$z $conda°$y MIN:$z $condaa° "
echo ""
echo -e "$green TUE=$z $b \n     $r MAX:$z $condb°$y MIN:$z $condbb° "
echo ""
echo -e "$green WED=$z $c \n     $r MAX:$z $condc°$y MIN:$z $condcc° "
echo ""
echo -e "$green THU=$z $d \n     $r MAX:$z $condd°$y MIN:$z $conddd° "
echo ""
echo -e "$green FRI=$z $e \n     $r MAX:$z $conde°$y MIN:$z $condee° "
echo -e $blue" #################################"$z
rm ~/weather.xml 2> /dev/null
echo " Thank You For Using The Script!"
echo " Press ENTER"
read
exit 0
}

function meteo3()
{
echo -e "$green TODAY$z"
echo " $city, $cond $temp°"
echo -e " Wind: $wind$k Humidity: $h%"
echo " $hour" 
echo -e $blue" #################################"$z
echo -e "$green TUE=$z $b \n     $r MAX:$z $condb°$y MIN:$z $condbb° "
echo ""
echo -e "$green WED=$z $c \n     $r MAX:$z $condc°$y MIN:$z $condcc° "
echo ""
echo -e "$green THU=$z $d \n     $r MAX:$z $condd°$y MIN:$z $conddd° "
echo ""
echo -e "$green FRI=$z $e \n     $r MAX:$z $conde°$y MIN:$z $condee° "
echo ""
echo -e "$green SAT=$z $f \n     $r MAX:$z $condf°$y MIN:$z $condff° "
echo -e $blue" #################################"$z
rm ~/weather.xml 2> /dev/null
echo " Thank You For Using The Script!"
echo " Press ENTER"
read
exit 0
}

function meteo4()
{
echo -e "$green TODAY$z"
echo " $city, $cond $temp°"
echo -e " Wind: $wind$k Humidity: $h%"
echo " $hour"
echo -e $blue" #################################"$z
echo -e "$green WED=$z $c \n     $r MAX:$z $condc°$y MIN:$z $condcc° "
echo ""
echo -e "$green THU=$z $d \n     $r MAX:$z $condd°$y MIN:$z $conddd° "
echo ""
echo -e "$green FRI=$z $e \n     $r MAX:$z $conde°$y MIN:$z $condee° "
echo ""
echo -e "$green SAT=$z $f \n     $r MAX:$z $condf°$y MIN:$z $condff° "
echo ""
echo -e "$green SUN=$z $g \n     $r MAX:$z $condg°$y MIN:$z $condgg° "
echo -e $blue" #################################"$z
rm ~/weather.xml 2> /dev/null
echo " Thank You For Using The Script!"
echo " Press ENTER"
read
exit 0
}


function meteo5()
{
echo -e "$green TODAY$z"
echo " $city, $cond $temp°"
echo -e " Wind: $wind$k Humidity: $h%"
echo " $hour"
echo -e $blue" #################################"$z
echo -e "$green THU=$z $d \n     $r MAX:$z $condd°$y MIN:$z $conddd° "
echo ""
echo -e "$green FRI=$z $e \n     $r MAX:$z $conde°$y MIN:$z $condee° "
echo ""
echo -e "$green SAT=$z $f \n     $r MAX:$z $condf°$y MIN:$z $condff° "
echo ""
echo -e "$green SUN=$z $g \n     $r MAX:$z $condg°$y MIN:$z $condgg° "
echo ""
echo -e "$green MON=$z $a \n     $r MAX:$z $conda°$y MIN:$z $condaa° "
echo -e $blue" #################################"$z
rm ~/weather.xml 2> /dev/null
echo " Thank You For Using The Script!"
echo " Press ENTER"
read
exit 0
}

function meteo6()
{
echo -e "$green TODAY$z"
echo " $city, $cond $temp°"
echo -e " Wind: $wind$k Humidity: $h%"
echo " $hour"
echo -e $blue" #################################"$z
echo -e "$green FRI=$z $e \n     $r MAX:$z $conde°$y MIN:$z $condee° "
echo ""
echo -e "$green SAT=$z $f \n     $r MAX:$z $condf°$y MIN:$z $condff° "
echo ""
echo -e "$green SUN=$z $g \n     $r MAX:$z $condg°$y MIN:$z $condgg° "
echo ""
echo -e "$green MON=$z $a \n     $r MAX:$z $conda°$y MIN:$z $condaa° "
echo ""
echo -e "$green TUE=$z $b \n     $r MAX:$z $condb°$y MIN:$z $condbb° "
echo -e $blue" #################################"$z
rm ~/weather.xml 2> /dev/null
echo " Thank You For Using The Script!"
echo " Press ENTER"
read
exit 0
}

function meteo7()
{
echo -e "$green TODAY$z"
echo " $city, $cond $temp°"
echo -e " Wind: $wind$k Humidity: $h%"
echo " $hour"
echo -e $blue" #################################"$z
echo -e "$green SAT=$z $f \n     $r MAX:$z $condf°$y MIN:$z $condff° "
echo ""
echo -e "$green SUN=$z $g \n     $r MAX:$z $condg°$y MIN:$z $condgg° "
echo ""
echo -e "$green MON=$z $a \n     $r MAX:$z $conda°$y MIN:$z $condaa° "
echo ""
echo -e "$green TUE=$z $b \n     $r MAX:$z $condb°$y MIN:$z $condbb° "
echo ""
echo -e "$green WED=$z $c \n     $r MAX:$z $condc°$y MIN:$z $condcc° "
echo -e $blue" #################################"$z
rm ~/weather.xml 2> /dev/null
echo " Thank You For Using The Script!"
echo " Press ENTER"
read
exit 0
}


function begin()
{
  clear
  echo -e $y " *******" $z
  echo -e "$y  Weather$z"
  echo -e $y " *******" $z
  echo "  Ver 0.1 by Marcphemt."
  echo "If is the first time you use the script"
  echo "go to Import/Change The City!"
  echo ""
  declare -a option
  options[${#options[*]}]="Get The Weather!";
  options[${#options[*]}]="Import/Change The City";
  options[${#options[*]}]="Esc";
  select opt in "${options[@]}"; do
  case ${opt} in
  
  ${options[0]}) weather;;
  ${options[1]}) info;;
   
  (Esc) break; ;;
  esac;
  done
}

function returne()
{
 cancel
 begin
 exit
}

function cancel()
{
   clear
   echo ""
}

begin

exit
