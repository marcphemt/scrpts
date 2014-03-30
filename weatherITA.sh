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
echo " Per usare lo script vai su"
echo -e "$y http://weather.yahoo.com/ $z,"
echo " poi cerca la tua città e copia il"
echo " codice (es. 718112) dalla barra"
echo " degli indirizzi."
echo -e $green "GRAZIE!" $z
echo -e $green "######################################################" $z
echo ""
echo "Ora incolla qui il [CODICE] della città.."
read VAR1
rm .city.txt 2> /dev/null
touch .city.txt
echo "$VAR1" >> .city.txt
echo "TUTTO FATTO!"
echo "Premi ENTER per ricaricare lo script"
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
echo -e "$green OGGI$z"
echo " $city, $cond $temp°" | sed -e 's/Partly/Parzialmente/g' | sed -e 's/Sunny/Soleggiato/g' | sed -e 's/Cloudy/Nuvoloso/g' | sed -e 's/Showers/Pioggia/g' | sed -e 's/Rain/Piovoso/g' | sed -e 's/Light/Leggermente/g' | sed -e 's/Mostly/Prevalentemente/g' | sed -e 's/Fair/Bello/g' | sed 's/Clear/Sereno/g'
echo -e " Vento: $wind$k Umidità: $h%"
echo " $hour" | sed -e 's/Thu/Gio/g' -e 's/Fri/Ven/g' -e 's/Sat/Sab/g' -e 's/Sun/Dom/g' -e 's/Mon/Lun/g' -e 's/Tue/Mar/g' -e 's/Wed/Mer/g'
echo -e $blue" #################################"$z
echo -e "$green DOM=$z $g \n     $r MAX:$z $condg°$y MIN:$z $condgg° " | sed -e 's/Partly/Parzialmente/g' | sed -e 's/Sunny/Soleggiato/g' | sed -e 's/Cloudy/Nuvoloso/g' | sed -e 's/Showers/Pioggia/g' | sed -e 's/Rain/Piovoso/g' | sed -e 's/Light/Leggermente/g' | sed -e 's/Mostly/Prevalentemente/g' | sed -e 's/Fair/Bello/g' | sed 's/Clear/Sereno/g'
echo ""
echo -e "$green LUN=$z $a \n     $r MAX:$z $conda°$y MIN:$z $condaa° " | sed -e 's/Partly/Parzialmente/g' | sed -e 's/Sunny/Soleggiato/g' | sed -e 's/Cloudy/Nuvoloso/g' | sed -e 's/Showers/Pioggia/g' | sed -e 's/Rain/Piovoso/g' | sed -e 's/Light/Leggermente/g' | sed -e 's/Mostly/Prevalentemente/g' | sed -e 's/Fair/Bello/g' | sed 's/Clear/Sereno/g'
echo ""
echo -e "$green MAR=$z $b \n     $r MAX:$z $condb°$y MIN:$z $condbb° " | sed -e 's/Partly/Parzialmente/g' | sed -e 's/Sunny/Soleggiato/g' | sed -e 's/Cloudy/Nuvoloso/g' | sed -e 's/Showers/Pioggia/g' | sed -e 's/Rain/Piovoso/g' | sed -e 's/Light/Leggermente/g' | sed -e 's/Mostly/Prevalentemente/g'  | sed -e 's/Fair/Bello/g' | sed 's/Clear/Sereno/g'
echo ""
echo -e "$green MER=$z $c \n     $r MAX:$z $condc°$y MIN:$z $condcc° " | sed -e 's/Partly/Parzialmente/g' | sed -e 's/Sunny/Soleggiato/g' | sed -e 's/Cloudy/Nuvoloso/g' | sed -e 's/Showers/Pioggia/g' | sed -e 's/Rain/Piovoso/g' | sed -e 's/Light/Leggermente/g' | sed -e 's/Mostly/Prevalentemente/g' | sed -e 's/Fair/Bello/g' | sed 's/Clear/Sereno/g'
echo ""
echo -e "$green GIO=$z $d \n     $r MAX:$z $condd°$y MIN:$z $conddd° " | sed -e 's/Partly/Parzialmente/g' | sed -e 's/Sunny/Soleggiato/g' | sed -e 's/Cloudy/Nuvoloso/g' | sed -e 's/Showers/Pioggia/g' | sed -e 's/Rain/Piovoso/g' | sed -e 's/Light/Leggermente/g' | sed -e 's/Mostly/Prevalentemente/g' | sed -e 's/Fair/Bello/g' | sed 's/Clear/Sereno/g'
echo -e $blue" #################################"$z
rm ~/weather.xml 2> /dev/null
echo " Grazie Per Aver Usato Lo Script!"
echo " Premi ENTER"
read
exit 0
}

function meteo2()
{
echo -e "$green OGGI$z"
echo " $city, $cond $temp°" | sed -e 's/Partly/Parzialmente/g' | sed -e 's/Sunny/Soleggiato/g' | sed -e 's/Cloudy/Nuvoloso/g' | sed -e 's/Showers/Pioggia/g' | sed -e 's/Rain/Piovoso/g' | sed -e 's/Light/Leggermente/g' | sed -e 's/Mostly/Prevalentemente/g' | sed -e 's/Fair/Bello/g' | sed 's/Clear/Sereno/g'
echo -e " Vento: $wind$k Umidità: $h%"
echo " $hour" | sed -e 's/Thu/Gio/g' -e 's/Fri/Ven/g' -e 's/Sat/Sab/g' -e 's/Sun/Dom/g' -e 's/Mon/Lun/g' -e 's/Tue/Mar/g' -e 's/Wed/Mer/g'
echo -e $blue" #################################"$z
echo -e "$green LUN=$z $a \n     $r MAX:$z $conda°$y MIN:$z $condaa° " | sed -e 's/Partly/Parzialmente/g' | sed -e 's/Sunny/Soleggiato/g' | sed -e 's/Cloudy/Nuvoloso/g' | sed -e 's/Showers/Pioggia/g' | sed -e 's/Rain/Piovoso/g' | sed -e 's/Light/Leggermente/g' | sed -e 's/Mostly/Prevalentemente/g' | sed -e 's/Fair/Bello/g' | sed 's/Clear/Sereno/g'
echo ""
echo -e "$green MAR=$z $b \n     $r MAX:$z $condb°$y MIN:$z $condbb° " | sed -e 's/Partly/Parzialmente/g' | sed -e 's/Sunny/Soleggiato/g' | sed -e 's/Cloudy/Nuvoloso/g' | sed -e 's/Showers/Pioggia/g' | sed -e 's/Rain/Piovoso/g' | sed -e 's/Light/Leggermente/g' | sed -e 's/Mostly/Prevalentemente/g'  | sed -e 's/Fair/Bello/g' | sed 's/Clear/Sereno/g'
echo ""
echo -e "$green MER=$z $c \n     $r MAX:$z $condc°$y MIN:$z $condcc° " | sed -e 's/Partly/Parzialmente/g' | sed -e 's/Sunny/Soleggiato/g' | sed -e 's/Cloudy/Nuvoloso/g' | sed -e 's/Showers/Pioggia/g' | sed -e 's/Rain/Piovoso/g' | sed -e 's/Light/Leggermente/g' | sed -e 's/Mostly/Prevalentemente/g' | sed -e 's/Fair/Bello/g' | sed 's/Clear/Sereno/g'
echo ""
echo -e "$green GIO=$z $d \n     $r MAX:$z $condd°$y MIN:$z $conddd° " | sed -e 's/Partly/Parzialmente/g' | sed -e 's/Sunny/Soleggiato/g' | sed -e 's/Cloudy/Nuvoloso/g' | sed -e 's/Showers/Pioggia/g' | sed -e 's/Rain/Piovoso/g' | sed -e 's/Light/Leggermente/g' | sed -e 's/Mostly/Prevalentemente/g' | sed -e 's/Fair/Bello/g' | sed 's/Clear/Sereno/g'
echo ""
echo -e "$green VEN=$z $e \n     $r MAX:$z $conde°$y MIN:$z $condee° " | sed -e 's/Partly/Parzialmente/g' | sed -e 's/Sunny/Soleggiato/g' | sed -e 's/Cloudy/Nuvoloso/g' | sed -e 's/Showers/Pioggia/g' | sed -e 's/Rain/Piovoso/g' | sed -e 's/Light/Leggermente/g' | sed -e 's/Mostly/Prevalentemente/g' | sed -e 's/Fair/Bello/g' | sed 's/Clear/Sereno/g'
echo -e $blue" #################################"$z
rm ~/weather.xml 2> /dev/null
echo " Grazie Per Aver Usato Lo Script!"
echo " Premi ENTER"
read
exit 0
}

function meteo3()
{
echo -e "$green OGGI$z"
echo " $city, $cond $temp°" | sed -e 's/Partly/Parzialmente/g' | sed -e 's/Sunny/Soleggiato/g' | sed -e 's/Cloudy/Nuvoloso/g' | sed -e 's/Showers/Pioggia/g' | sed -e 's/Rain/Piovoso/g' | sed -e 's/Light/Leggermente/g' | sed -e 's/Mostly/Prevalentemente/g' | sed -e 's/Fair/Bello/g' | sed 's/Clear/Sereno/g'
echo -e " Vento: $wind$k Umidità: $h%"
echo " $hour" | sed -e 's/Thu/Gio/g' -e 's/Fri/Ven/g' -e 's/Sat/Sab/g' -e 's/Sun/Dom/g' -e 's/Mon/Lun/g' -e 's/Tue/Mar/g' -e 's/Wed/Mer/g'
echo -e $blue" #################################"$z
echo -e "$green MAR=$z $b \n     $r MAX:$z $condb°$y MIN:$z $condbb° " | sed -e 's/Partly/Parzialmente/g' | sed -e 's/Sunny/Soleggiato/g' | sed -e 's/Cloudy/Nuvoloso/g' | sed -e 's/Showers/Pioggia/g' | sed -e 's/Rain/Piovoso/g' | sed -e 's/Light/Leggermente/g' | sed -e 's/Mostly/Prevalentemente/g'  | sed -e 's/Fair/Bello/g' | sed 's/Clear/Sereno/g'
echo ""
echo -e "$green MER=$z $c \n     $r MAX:$z $condc°$y MIN:$z $condcc° " | sed -e 's/Partly/Parzialmente/g' | sed -e 's/Sunny/Soleggiato/g' | sed -e 's/Cloudy/Nuvoloso/g' | sed -e 's/Showers/Pioggia/g' | sed -e 's/Rain/Piovoso/g' | sed -e 's/Light/Leggermente/g' | sed -e 's/Mostly/Prevalentemente/g' | sed -e 's/Fair/Bello/g' | sed 's/Clear/Sereno/g'
echo ""
echo -e "$green GIO=$z $d \n     $r MAX:$z $condd°$y MIN:$z $conddd° " | sed -e 's/Partly/Parzialmente/g' | sed -e 's/Sunny/Soleggiato/g' | sed -e 's/Cloudy/Nuvoloso/g' | sed -e 's/Showers/Pioggia/g' | sed -e 's/Rain/Piovoso/g' | sed -e 's/Light/Leggermente/g' | sed -e 's/Mostly/Prevalentemente/g' | sed -e 's/Fair/Bello/g' | sed 's/Clear/Sereno/g'
echo ""
echo -e "$green VEN=$z $e \n     $r MAX:$z $conde°$y MIN:$z $condee° " | sed -e 's/Partly/Parzialmente/g' | sed -e 's/Sunny/Soleggiato/g' | sed -e 's/Cloudy/Nuvoloso/g' | sed -e 's/Showers/Pioggia/g' | sed -e 's/Rain/Piovoso/g' | sed -e 's/Light/Leggermente/g' | sed -e 's/Mostly/Prevalentemente/g' | sed -e 's/Fair/Bello/g' | sed 's/Clear/Sereno/g'
echo ""
echo -e "$green SAB=$z $f \n     $r MAX:$z $condf°$y MIN:$z $condff° " | sed -e 's/Partly/Parzialmente/g' | sed -e 's/Sunny/Soleggiato/g' | sed -e 's/Cloudy/Nuvoloso/g' | sed -e 's/Showers/Pioggia/g' | sed -e 's/Rain/Piovoso/g' | sed -e 's/Light/Leggermente/g' | sed -e 's/Mostly/Prevalentemente/g' | sed -e 's/Fair/Bello/g' | sed 's/Clear/Sereno/g'
echo -e $blue" #################################"$z
rm ~/weather.xml 2> /dev/null
echo " Grazie Per Aver Usato Lo Script!"
echo " Premi ENTER"
read
exit 0
}

function meteo4()
{
echo -e "$green OGGI$z"
echo " $city, $cond $temp°" | sed -e 's/Partly/Parzialmente/g' | sed -e 's/Sunny/Soleggiato/g' | sed -e 's/Cloudy/Nuvoloso/g' | sed -e 's/Showers/Pioggia/g' | sed -e 's/Rain/Piovoso/g' | sed -e 's/Light/Leggermente/g' | sed -e 's/Mostly/Prevalentemente/g' | sed -e 's/Fair/Bello/g' | sed 's/Clear/Sereno/g'
echo -e " Vento: $wind$k Umidità: $h%"
echo " $hour" | sed -e 's/Thu/Gio/g' -e 's/Fri/Ven/g' -e 's/Sat/Sab/g' -e 's/Sun/Dom/g' -e 's/Mon/Lun/g' -e 's/Tue/Mar/g' -e 's/Wed/Mer/g'
echo -e $blue" #################################"$z
echo -e "$green MER=$z $c \n     $r MAX:$z $condc°$y MIN:$z $condcc° " | sed -e 's/Partly/Parzialmente/g' | sed -e 's/Sunny/Soleggiato/g' | sed -e 's/Cloudy/Nuvoloso/g' | sed -e 's/Showers/Pioggia/g' | sed -e 's/Rain/Piovoso/g' | sed -e 's/Light/Leggermente/g' | sed -e 's/Mostly/Prevalentemente/g' | sed -e 's/Fair/Bello/g' | sed 's/Clear/Sereno/g'
echo ""
echo -e "$green GIO=$z $d \n     $r MAX:$z $condd°$y MIN:$z $conddd° " | sed -e 's/Partly/Parzialmente/g' | sed -e 's/Sunny/Soleggiato/g' | sed -e 's/Cloudy/Nuvoloso/g' | sed -e 's/Showers/Pioggia/g' | sed -e 's/Rain/Piovoso/g' | sed -e 's/Light/Leggermente/g' | sed -e 's/Mostly/Prevalentemente/g' | sed -e 's/Fair/Bello/g' | sed 's/Clear/Sereno/g'
echo ""
echo -e "$green VEN=$z $e \n     $r MAX:$z $conde°$y MIN:$z $condee° " | sed -e 's/Partly/Parzialmente/g' | sed -e 's/Sunny/Soleggiato/g' | sed -e 's/Cloudy/Nuvoloso/g' | sed -e 's/Showers/Pioggia/g' | sed -e 's/Rain/Piovoso/g' | sed -e 's/Light/Leggermente/g' | sed -e 's/Mostly/Prevalentemente/g' | sed -e 's/Fair/Bello/g' | sed 's/Clear/Sereno/g'
echo ""
echo -e "$green SAB=$z $f \n     $r MAX:$z $condf°$y MIN:$z $condff° " | sed -e 's/Partly/Parzialmente/g' | sed -e 's/Sunny/Soleggiato/g' | sed -e 's/Cloudy/Nuvoloso/g' | sed -e 's/Showers/Pioggia/g' | sed -e 's/Rain/Piovoso/g' | sed -e 's/Light/Leggermente/g' | sed -e 's/Mostly/Prevalentemente/g' | sed -e 's/Fair/Bello/g' | sed 's/Clear/Sereno/g'
echo ""
echo -e "$green DOM=$z $g \n     $r MAX:$z $condg°$y MIN:$z $condgg° " | sed -e 's/Partly/Parzialmente/g' | sed -e 's/Sunny/Soleggiato/g' | sed -e 's/Cloudy/Nuvoloso/g' | sed -e 's/Showers/Pioggia/g' | sed -e 's/Rain/Piovoso/g' | sed -e 's/Light/Leggermente/g' | sed -e 's/Mostly/Prevalentemente/g' | sed -e 's/Fair/Bello/g' | sed 's/Clear/Sereno/g'
echo -e $blue" #################################"$z
rm ~/weather.xml 2> /dev/null
echo " Grazie Per Aver Usato Lo Script!"
echo " Premi ENTER"
read
exit 0
}


function meteo5()
{
echo -e "$green OGGI$z"
echo " $city, $cond $temp°" | sed -e 's/Partly/Parzialmente/g' | sed -e 's/Sunny/Soleggiato/g' | sed -e 's/Cloudy/Nuvoloso/g' | sed -e 's/Showers/Pioggia/g' | sed -e 's/Rain/Piovoso/g' | sed -e 's/Light/Leggermente/g' | sed -e 's/Mostly/Prevalentemente/g' | sed -e 's/Fair/Bello/g' | sed 's/Clear/Sereno/g'
echo -e " Vento: $wind$k Umidità: $h%"
echo " $hour" | sed -e 's/Thu/Gio/g' -e 's/Fri/Ven/g' -e 's/Sat/Sab/g' -e 's/Sun/Dom/g' -e 's/Mon/Lun/g' -e 's/Tue/Mar/g' -e 's/Wed/Mer/g'
echo -e $blue" #################################"$z
echo -e "$green GIO=$z $d \n     $r MAX:$z $condd°$y MIN:$z $conddd° " | sed -e 's/Partly/Parzialmente/g' | sed -e 's/Sunny/Soleggiato/g' | sed -e 's/Cloudy/Nuvoloso/g' | sed -e 's/Showers/Pioggia/g' | sed -e 's/Rain/Piovoso/g' | sed -e 's/Light/Leggermente/g' | sed -e 's/Mostly/Prevalentemente/g' | sed -e 's/Fair/Bello/g' | sed 's/Clear/Sereno/g'
echo ""
echo -e "$green VEN=$z $e \n     $r MAX:$z $conde°$y MIN:$z $condee° " | sed -e 's/Partly/Parzialmente/g' | sed -e 's/Sunny/Soleggiato/g' | sed -e 's/Cloudy/Nuvoloso/g' | sed -e 's/Showers/Pioggia/g' | sed -e 's/Rain/Piovoso/g' | sed -e 's/Light/Leggermente/g' | sed -e 's/Mostly/Prevalentemente/g' | sed -e 's/Fair/Bello/g' | sed 's/Clear/Sereno/g'
echo ""
echo -e "$green SAB=$z $f \n     $r MAX:$z $condf°$y MIN:$z $condff° " | sed -e 's/Partly/Parzialmente/g' | sed -e 's/Sunny/Soleggiato/g' | sed -e 's/Cloudy/Nuvoloso/g' | sed -e 's/Showers/Pioggia/g' | sed -e 's/Rain/Piovoso/g' | sed -e 's/Light/Leggermente/g' | sed -e 's/Mostly/Prevalentemente/g' | sed -e 's/Fair/Bello/g' | sed 's/Clear/Sereno/g'
echo ""
echo -e "$green DOM=$z $g \n     $r MAX:$z $condg°$y MIN:$z $condgg° " | sed -e 's/Partly/Parzialmente/g' | sed -e 's/Sunny/Soleggiato/g' | sed -e 's/Cloudy/Nuvoloso/g' | sed -e 's/Showers/Pioggia/g' | sed -e 's/Rain/Piovoso/g' | sed -e 's/Light/Leggermente/g' | sed -e 's/Mostly/Prevalentemente/g' | sed -e 's/Fair/Bello/g' | sed 's/Clear/Sereno/g'
echo ""
echo -e "$green LUN=$z $a \n     $r MAX:$z $conda°$y MIN:$z $condaa° " | sed -e 's/Partly/Parzialmente/g' | sed -e 's/Sunny/Soleggiato/g' | sed -e 's/Cloudy/Nuvoloso/g' | sed -e 's/Showers/Pioggia/g' | sed -e 's/Rain/Piovoso/g' | sed -e 's/Light/Leggermente/g' | sed -e 's/Mostly/Prevalentemente/g' | sed -e 's/Fair/Bello/g' | sed 's/Clear/Sereno/g'
echo -e $blue" #################################"$z
rm ~/weather.xml 2> /dev/null
echo " Grazie Per Aver Usato Lo Script!"
echo " Premi ENTER"
read
exit 0
}

function meteo6()
{
echo -e "$green OGGI$z"
echo " $city, $cond $temp°" | sed -e 's/Partly/Parzialmente/g' | sed -e 's/Sunny/Soleggiato/g' | sed -e 's/Cloudy/Nuvoloso/g' | sed -e 's/Showers/Pioggia/g' | sed -e 's/Rain/Piovoso/g' | sed -e 's/Light/Leggermente/g' | sed -e 's/Mostly/Prevalentemente/g' | sed -e 's/Fair/Bello/g' | sed 's/Clear/Sereno/g'
echo -e " Vento: $wind$k Umidità: $h%"
echo " $hour" | sed -e 's/Thu/Gio/g' -e 's/Fri/Ven/g' -e 's/Sat/Sab/g' -e 's/Sun/Dom/g' -e 's/Mon/Lun/g' -e 's/Tue/Mar/g' -e 's/Wed/Mer/g'
echo -e $blue" #################################"$z
echo -e "$green VEN=$z $e \n     $r MAX:$z $conde°$y MIN:$z $condee° " | sed -e 's/Partly/Parzialmente/g' | sed -e 's/Sunny/Soleggiato/g' | sed -e 's/Cloudy/Nuvoloso/g' | sed -e 's/Showers/Pioggia/g' | sed -e 's/Rain/Piovoso/g' | sed -e 's/Light/Leggermente/g' | sed -e 's/Mostly/Prevalentemente/g' | sed -e 's/Fair/Bello/g' | sed 's/Clear/Sereno/g'
echo ""
echo -e "$green SAB=$z $f \n     $r MAX:$z $condf°$y MIN:$z $condff° " | sed -e 's/Partly/Parzialmente/g' | sed -e 's/Sunny/Soleggiato/g' | sed -e 's/Cloudy/Nuvoloso/g' | sed -e 's/Showers/Pioggia/g' | sed -e 's/Rain/Piovoso/g' | sed -e 's/Light/Leggermente/g' | sed -e 's/Mostly/Prevalentemente/g' | sed -e 's/Fair/Bello/g' | sed 's/Clear/Sereno/g'
echo ""
echo -e "$green DOM=$z $g \n     $r MAX:$z $condg°$y MIN:$z $condgg° " | sed -e 's/Partly/Parzialmente/g' | sed -e 's/Sunny/Soleggiato/g' | sed -e 's/Cloudy/Nuvoloso/g' | sed -e 's/Showers/Pioggia/g' | sed -e 's/Rain/Piovoso/g' | sed -e 's/Light/Leggermente/g' | sed -e 's/Mostly/Prevalentemente/g' | sed -e 's/Fair/Bello/g' | sed 's/Clear/Sereno/g'
echo ""
echo -e "$green LUN=$z $a \n     $r MAX:$z $conda°$y MIN:$z $condaa° " | sed -e 's/Partly/Parzialmente/g' | sed -e 's/Sunny/Soleggiato/g' | sed -e 's/Cloudy/Nuvoloso/g' | sed -e 's/Showers/Pioggia/g' | sed -e 's/Rain/Piovoso/g' | sed -e 's/Light/Leggermente/g' | sed -e 's/Mostly/Prevalentemente/g' | sed -e 's/Fair/Bello/g' | sed 's/Clear/Sereno/g'
echo ""
echo -e "$green MAR=$z $b \n     $r MAX:$z $condb°$y MIN:$z $condbb° " | sed -e 's/Partly/Parzialmente/g' | sed -e 's/Sunny/Soleggiato/g' | sed -e 's/Cloudy/Nuvoloso/g' | sed -e 's/Showers/Pioggia/g' | sed -e 's/Rain/Piovoso/g' | sed -e 's/Light/Leggermente/g' | sed -e 's/Mostly/Prevalentemente/g'  | sed -e 's/Fair/Bello/g' | sed 's/Clear/Sereno/g'
echo -e $blue" #################################"$z
rm ~/weather.xml 2> /dev/null
echo " Grazie Per Aver Usato Lo Script!"
echo " Premi ENTER"
read
exit 0
}

function meteo7()
{
echo -e "$green OGGI$z"
echo " $city, $cond $temp°" | sed -e 's/Partly/Parzialmente/g' | sed -e 's/Sunny/Soleggiato/g' | sed -e 's/Cloudy/Nuvoloso/g' | sed -e 's/Showers/Pioggia/g' | sed -e 's/Rain/Piovoso/g' | sed -e 's/Light/Leggermente/g' | sed -e 's/Mostly/Prevalentemente/g' | sed -e 's/Fair/Bello/g' | sed 's/Clear/Sereno/g'
echo -e " Vento: $wind$k Umidità: $h%"
echo " $hour" | sed -e 's/Thu/Gio/g' -e 's/Fri/Ven/g' -e 's/Sat/Sab/g' -e 's/Sun/Dom/g' -e 's/Mon/Lun/g' -e 's/Tue/Mar/g' -e 's/Wed/Mer/g'
echo -e $blue" #################################"$z
echo -e "$green SAB=$z $f \n     $r MAX:$z $condf°$y MIN:$z $condff° " | sed -e 's/Partly/Parzialmente/g' | sed -e 's/Sunny/Soleggiato/g' | sed -e 's/Cloudy/Nuvoloso/g' | sed -e 's/Showers/Pioggia/g' | sed -e 's/Rain/Piovoso/g' | sed -e 's/Light/Leggermente/g' | sed -e 's/Mostly/Prevalentemente/g' | sed -e 's/Fair/Bello/g' | sed 's/Clear/Sereno/g'
echo ""
echo -e "$green DOM=$z $g \n     $r MAX:$z $condg°$y MIN:$z $condgg° " | sed -e 's/Partly/Parzialmente/g' | sed -e 's/Sunny/Soleggiato/g' | sed -e 's/Cloudy/Nuvoloso/g' | sed -e 's/Showers/Pioggia/g' | sed -e 's/Rain/Piovoso/g' | sed -e 's/Light/Leggermente/g' | sed -e 's/Mostly/Prevalentemente/g' | sed -e 's/Fair/Bello/g' | sed 's/Clear/Sereno/g'
echo ""
echo -e "$green LUN=$z $a \n     $r MAX:$z $conda°$y MIN:$z $condaa° " | sed -e 's/Partly/Parzialmente/g' | sed -e 's/Sunny/Soleggiato/g' | sed -e 's/Cloudy/Nuvoloso/g' | sed -e 's/Showers/Pioggia/g' | sed -e 's/Rain/Piovoso/g' | sed -e 's/Light/Leggermente/g' | sed -e 's/Mostly/Prevalentemente/g' | sed -e 's/Fair/Bello/g' | sed 's/Clear/Sereno/g'
echo ""
echo -e "$green MAR=$z $b \n     $r MAX:$z $condb°$y MIN:$z $condbb° " | sed -e 's/Partly/Parzialmente/g' | sed -e 's/Sunny/Soleggiato/g' | sed -e 's/Cloudy/Nuvoloso/g' | sed -e 's/Showers/Pioggia/g' | sed -e 's/Rain/Piovoso/g' | sed -e 's/Light/Leggermente/g' | sed -e 's/Mostly/Prevalentemente/g'  | sed -e 's/Fair/Bello/g' | sed 's/Clear/Sereno/g'
echo ""
echo -e "$green MER=$z $c \n     $r MAX:$z $condc°$y MIN:$z $condcc° " | sed -e 's/Partly/Parzialmente/g' | sed -e 's/Sunny/Soleggiato/g' | sed -e 's/Cloudy/Nuvoloso/g' | sed -e 's/Showers/Pioggia/g' | sed -e 's/Rain/Piovoso/g' | sed -e 's/Light/Leggermente/g' | sed -e 's/Mostly/Prevalentemente/g' | sed -e 's/Fair/Bello/g' | sed 's/Clear/Sereno/g'
echo -e $blue" #################################"$z
rm ~/weather.xml 2> /dev/null
echo " Grazie Per Aver Usato Lo Script!"
echo " Premi ENTER"
read
exit 0
}


function begin()
{
  clear
  #echo -e $y " *******" $z
  #echo -e "$y  Weather$z"
  #echo -e $y " *******" $z
  figlet "Weather"
  echo "  Ver 0.2 by Marcphemt."
  echo "NOTA:Se è la prima volta che usi lo script"
  echo "     vai su Importa/Cambia Città!"
  echo ""
  declare -a option
  options[${#options[*]}]="Meteo!";
  options[${#options[*]}]="Importa/Cambia Città";
  options[${#options[*]}]="Esci";
  select opt in "${options[@]}"; do
  case ${opt} in
  
  ${options[0]}) weather;;
  ${options[1]}) info;;
   
  (Esci) break; ;;
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
