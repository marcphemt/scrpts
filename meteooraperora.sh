# Copyright (c) 2014 Marcphemt
# mrc.mng.mm@gmail.com
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.
#!/bin/bash

figlet "3B METEO"
while [ "$e" != r ]
do
echo "Inserisci località:" #'LOC'
echo "(gli accenti devono essere sostituiti con ')"
read LOC
 if [[ $LOC == *[[:space:]]* ]]; 
  then
  export LOC=`echo $LOC | tr ' ' '+'`
  e=r
 fi; 
 if [[ $LOC == *à ]];
  then
  echo "ricorda che i caratteri accentati vanno sostituiti con '"
  elif [[ $LOC == *ò ]];
  then
  echo "ricorda che i caratteri accentati vanno sostituiti con '"
  elif [[ $LOC == *ù ]];
  then
  echo "ricorda che i caratteri accentati vanno sostituiti con '"
  elif [[ $LOC == *è ]];
  then
  echo "ricorda che i caratteri accentati vanno sostituiti con '"
  elif [[ $LOC == *é ]];
  then
  echo "ricorda che i caratteri accentati vanno sostituiti con '"
  elif [[ $LOC == *ì ]];
  then
  echo "ricorda che i caratteri accentati vanno sostituiti con '"
 else
  e=r 
 fi;
done    
while [ 0 ]
do
 echo "Previsioni per oggi o domani?" #'VAR'
 read VAR
  if [ $VAR == "oggi" ]; then
######################
#    wget http://www.3bmeteo.com/meteo/$LOC/dettagli_orari --quiet -O- 2> /dev/null -O -| tr '< > " /' ' ' | awk '/img_desc/ {print $13, $14, $15, $24, $25, $26, $33, $34, $35, $36, $37, $38 }' | sed -e 's/img_desc//g' -e 's/\div//g' -e 's/images//g' -e 's/icone//g' -e 's/regione_big//g' -e 's/celsius//g' -e 's/&deg;C//g' -e 's/span//g' -e 's/class=//g' -e 's/temperature//g' -e 's/^[ \t]*//'

######################

wget http://www.3bmeteo.com/meteo/$LOC/dettagli_orari --quiet -O- 2> /dev/null -O -| tr '< > " /' ' ' | awk '/img_desc/ {print $13, $14, $15, $24, $25, $26, $33, $34, $35, $36, $37, $38 }' | sed -e 's/class=\ //g' -e 's/images\ //g' -e 's/icone\ //g' -e s/div\ //g -e 's/img_desc\ //g' -e 's/\&deg\;\C//g' -e 's/div//g' -e 's/img_desc//g' -e 's/\div//g' -e 's/images//g' -e 's/icone//g' -e 's/regione_big//g' -e 's/celsius//g' -e 's/&deg;C//g' -e 's/span//g' -e 's/class=//g' -e 's/temperature//g' -e 's/^[ \t]*//' -e 's/[-0-9]\.[0-9]$//g' -e 's/\ \ /\ /g' -e 's/piovaschi\ e\ .*$/piovaschi\ e\ schiarite\ /g' -e 's/poche\ nubi\ .*$/poche\ nubi\ sparse\ /g'
	echo " "
	echo "PER TERMINARE PREMI INVIO"
	read
	figlet "BYE BYE"
	sleep 5s
	exit 0
  elif [ $VAR == "domani" ]; then

######################
#    wget http://www.3bmeteo.com/meteo/$LOC/dettagli_orari/1 --quiet -O- 2> /dev/null -O -| tr '< >' ' ' | tr '"' ' ' | tr '/' ' ' | awk '/img_desc/ {print $13, $14, $15, $24, $25, $26, $33, $34, $35, $36, $37, $38, $39}' | sed -e 's/img_desc//g' -e 's/\div//g' -e 's/images//g' -e 's/icone//g' -e 's/regione_big//g' -e 's/celsius//g' -e 's/&deg;C//g' -e 's/span//g' -e 's/class=//g' -e 's/temperature//g' -e 's/^[ \t]*//'

######################

wget http://www.3bmeteo.com/meteo/$LOC/dettagli_orari/1 --quiet -O- 2> /dev/null -O -| tr '< > " /' ' ' | awk '/img_desc/ {print $13, $14, $15, $24, $25, $26, $33, $34, $35, $36, $37, $38 }' | sed -e 's/class=\ //g' -e 's/images\ //g' -e 's/icone\ //g' -e s/div\ //g -e 's/img_desc\ //g' -e 's/\&deg\;\C//g' -e 's/div//g' -e 's/img_desc//g' -e 's/\div//g' -e 's/images//g' -e 's/icone//g' -e 's/regione_big//g' -e 's/celsius//g' -e 's/&deg;C//g' -e 's/span//g' -e 's/class=//g' -e 's/temperature//g' -e 's/^[ \t]*//' -e 's/[-0-9]\.[0-9]$//g' -e 's/\ \ /\ /g' -e 's/piovaschi\ e\ .*$/piovaschi\ e\ schiarite\ /g' -e 's/poche\ nubi\ .*$/poche\ nubi\ sparse\ /g'

	echo "PER TERMINARE PREMI INVIO"
	read
	figlet "BYE BYE"
    sleep 5s
    exit 0
  else
    echo "Selezione sbagliata: scrivi 'oggi' o 'domani'!!"
  fi
done
exit
