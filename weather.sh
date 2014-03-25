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
echo " and paste it in the line of the script:"
echo -e "$y http://weather.yahooapis.com/forecastrss?w=CODE&u=c $z"
echo -e $green "THANK YOU!" $z
echo -e $green "######################################################" $z
echo ""
echo "Press ENTER"
read
exit
}

function weather()
{
curl -s "http://weather.yahooapis.com/forecastrss?w=718112&u=c" > ~/weather.xml
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
g=`grep "day=" ~/weather.xml | grep "Sun" | grep -o "text=\"[^\"]*\"" | grep -o "\"[^\"]*\"" | grep -o "[^\"]*" | tr '/' ' '`
condg=`grep "Sun" ~/weather.xml | grep -o "high=\"[^\"]*\"" | grep -o "\"[^\"]*\"" | grep -o "[^\"]*"`
condgg=`grep "Sun" ~/weather.xml | grep -o "low=\"[^\"]*\"" | grep -o "\"[^\"]*\"" | grep -o "[^\"]*"`

echo -e "$green TODAY$z"
echo " $city, $cond $temp°" 
echo -e " Wind: $wind$k Humidity: $h%"
echo " $hour"
echo " #####################################################"
echo -e "$green MON=$z $a $r HIGH:$z $conda° $y LOW:$z $condaa° "
echo -e "$green TUE=$z $b $r HIGH:$z $condb° $y LOW:$z $condbb° "
echo -e "$green WED=$z $c $r HIGH:$z $condc° $y LOW:$z $condcc° "
echo -e "$green THU=$z $d $r HIGH:$z $condd° $y LOW:$z $conddd° "
echo -e "$green FRI=$z $e $r HIGH:$z $conde° $y LOW:$z $condee° "
echo -e "$green SAT=$z $f $r HIGH:$z $condf° $y LOW:$z $condff° "
echo -e "$green SUN=$z $g $r HIGH:$z $condg° $y LOW:$z $condgg° "
echo " #####################################################"
rm ~/weather.xml
echo " Thank You For Using The Script!"
echo " Press ENTER"
read
exit
}

function begin()
{
  clear
  echo -e $y " *******" $z
  echo -e "$y  Weather$z"
  echo -e $y " *******" $z
  echo "  Ver 0.1 by Marcphemt."
  echo ""
  declare -a option
  options[${#options[*]}]="Get The Weather!";
  options[${#options[*]}]="Info About The Use Of The Script";
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

begin

exit
