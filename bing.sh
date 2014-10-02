#!/bin/bash
# Copyright (c) 2014 MarcPhemt
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
#COLORS
red="\e[0;31m"
green="\e[0;32m"
yell="\e[1;33m"
blue="\e[0;34m"
z="\e[0m"

function download()
{
echo -e "$red Downloading $z"
# $bing is needed to form the fully qualified URL for
# the Bing pic of the day
bing="www.bing.com"
# $xmlURL is needed to get the xml data from which
# the relative URL for the Bing pic of the day is extracted
#
# The mkt parameter determines which Bing market you would like to
# obtain your images from.
# Valid values are: en-US, zh-CN, ja-JP, en-AU, en-UK, de-DE, en-NZ, en-CA.
#
# The idx parameter determines where to start from. 0 is the current day,
# 1 the previous day, etc.
#xmlURL="http://www.bing.com/HPImageArchive.aspx?format=xml&idx=0&n=1&mkt=ja-JP"
xmlURL="http://www.bing.com/HPImageArchive.aspx?format=xml&idx=0&n=1&mkt=$LOC"

# $saveDir is used to set the location where Bing pics of the day
# are stored. $HOME holds the path of the current user's home directory
saveDir="/home/$USER/bing/"
# Create saveDir if it does not already exist
#mkdir -p $saveDir
# Set picture options
# Valid options are: none,wallpaper,centered,scaled,stretched,zoom,spanned
picOpts="zoom"
# The desired Bing picture resolution to download
# Valid options: "_1024x768" "_1280x720" "_1366x768" "_1920x1200"
desiredPicRes="_1920x1200"
# The file extension for the Bing pic
picExt=".jpg"
# Extract the relative URL of the Bing pic of the day from
# the XML data retrieved from xmlURL, form the fully qualified
# URL for the pic of the day, and store it in $picURL
# Form the URL for the desired pic resolution
desiredPicURL=$bing$(echo $(curl -s $xmlURL) | grep -oP "<urlBase>(.*)</urlBase>" | cut -d ">" -f 2 | cut -d "<" -f 1)$desiredPicRes$picExt
# Form the URL for the default pic resolution
defaultPicURL=$bing$(echo $(curl -s $xmlURL) | grep -oP "<url>(.*)</url>" | cut -d ">" -f 2 | cut -d "<" -f 1)
# $picName contains the filename of the Bing pic of the day
# Attempt to download the desired image resolution. If it doesn't
# exist then download the default image resolution
if wget --quiet --spider "$desiredPicURL"
then
# Set picName to the desired picName
picName=${desiredPicURL##*/}
# Download the Bing pic of the day at desired resolution
curl -s -o $saveDir$picName $desiredPicURL
#mv ~/MyDocs/bing/$picName ~/MyDocs/bing/$TODAY_bing.jpg
else
# Set picName to the default picName
picName=${defaultPicURL##*/}
# Download the Bing pic of the day at default resolution
curl -s -o $saveDir$picName $defaultPicURL
fi;

wa
}

function location()
{

echo "Choose location:"
echo "Japan (1), USA (2), England (3), German (4), New Zeland (5), China (6)"
read A
 if [ $A == 1 ]; then
 LOC='ja-JP'
 elif [ $A == 2 ]; then
 LOC='en-US'
 elif [ $A == 3 ]; then
 LOC='en-UK'
 elif [ $A == 4 ]; then
 LOC='de-DE'
 elif [ $A == 5 ]; then
 LOC='en-NZ'
 elif [ $A == 6 ]; then
 LOC='zh-CN'
 fi
 
 download
 
 }
 
function begin()
{
 

echo "===================="
echo "== BING Wallpaper =="
echo "===================="
echo "*******************************************************"
echo -e "* This script will download and set$yell AUTOMATICALLY$z the *"
echo "* BING daily photo in your machine. *"
echo -e "* To set the download lacation$green open this script with$z *"
echo -e "*$green your notepad$z (like leafpad, medit, etc) and go to *"
echo -e "*$yell OPTIONS$z, then set$red PICTURES_DIR=~/$z of your choise. *"
echo -e "*$blue This script is set up for N900 ONLY $z *"
echo "*******************************************************"
echo "To continue press ENTER"
read

location
}

#while [ 0 ]
#do
function wa()
{

gpicview /home/$USER/bing/$picName
echo "If you like the image just press enter."
echo "if you want to see other images type r."
echo "if you don't like the image just close the terminal!"
read VAR
if [ $VAR == r ]; then
rm /home/$USER/bing/$picName
location
else
echo "Setting image as wallpaper"
nitrogen --set-scaled --save /home/$USER/bing/$picName
 #echo "Setting image as wallpaper"
 #gconftool-2 -t string -s /desktop/gnome/background/picture_filename /home/$USER/bing/$picName
exit 
#done
fi;
}

begin
