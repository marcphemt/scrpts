#!/bin/bash
#this script need to work with google-translate-cli and figlet ;)
figlet "Translate"
echo "Do you want to see supported languages? y/n"
read VAR1
 if [ $VAR1 == "y" ]; then
  echo "SUPPORTED LANGUAGES:"
  echo " "
  echo "Afrikaans           |     AF
Albanian            |     SQ
Arabic              |     AR
Azerbaijani         |     AZ
Basque              |     EU
Bengali             |     BN
Belarusian          |     BE
Bulgarian           |     BG
Catalan             |     CA
Chinese Simplified  |  ZH-CN
Chinese Traditional |  ZH-TW
Croatian            |     HR
Czech               |     CS
Danish              |     DA
Dutch               |     NL
English             |     EN
Esperanto           |     EO
Estonian            |     ET
Filipino            |     TL
Finnish             |     FI
French              |     FR
Galician            |     GL
Georgian            |     KA
German              |     DE
Greek               |     EL
Gujarati            |     GU
Haitian Creole      |     HT
Hebrew              |     IW
Hindi               |     HI
Hungarian           |     HU
Icelandic           |     IS
Indonesian          |     ID
Irish               |     GA
Italian             |     IT
Japanese            |     JA
Kannada             |     KN
Korean              |     KO
Latin               |     LA
Latvian             |     LV
Lithuanian          |     LT
Macedonian          |     MK
Malay               |     MS
Maltese             |     MT
Norwegian           |     NO
Persian             |     FA
Polish              |     PL
Portuguese          |     PT
Romanian            |     RO
Russian             |     RU
Serbian             |     SR
Slovak              |     SK
Slovenian           |     SL
Spanish             |     ES
Swahili             |     SW
Swedish             |     SV
Tamil               |     TA
Telugu              |     TE
Thai                |     TH
Turkish             |     TR
Ukrainian           |     UK
Urdu                |     UR
Vietnamese          |     VI
Welsh               |     CY
Yiddish             |     YI"
 fi
echo " " 
echo "ENTER THE CODE OF THE LANGUAGE #1"
read L1
echo " "
echo "ENTER THE CODE OF THE LANGUAGE #2"
read L2
echo " "
echo "WRITE THE PHRASE!"
read PHRASE
echo " "	
trs {$L1=$L2} $PHRASE
while [ 0 ]
do
echo "IF YOU WANT, CONTINUE TO TRANSLATE, OTHERWISE WRITE stop"
read PHRASE2
 if [ $PHRASE2 == stop ]; then
  echo "Thank you for using the translator :-)"
  figlet "BYE BYE"
  sleep 3s
  exit 0
 else trs {$L1=$L2} $PHRASE2
 fi
done
exit
