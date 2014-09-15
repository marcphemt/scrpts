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
 
# ********************************
# *** OPTIONS
# ********************************
# Set this to 'yes' to save a description (to ~/description.txt) from ngeo page (not yet active)
#GET_DESCRIPTION="yes"
# Set this to the directory you want pictures saved
PICTURES_DIR=~/MyDocs/photos
 
# ********************************
# *** FUNCTIONS
# ********************************
function get_page {
    echo "Downloading page to find image"
    wget http://photography.nationalgeographic.com/photography/photo-of-the-day/ --quiet -O- 2> /dev/null |
    grep -m 1 images.nationalgeographic.com/.*.jpg -o > ~/MyDocs/pic_url
}
 
function clean_up {
    # Clean up
    echo "Cleaning up temporary files"
    #if [ -e "~/MyDocs/pic_url" ]; then
        rm ~/MyDocs/pic_url
    #fi
}
 
# ********************************
# *** MAIN
# ********************************
echo "===================="
echo "== NGEO Wallpaper =="
echo "===================="
# Set date
TODAY=$(date +'%Y%m%d')
echo "*******************************************************"
echo -e "* This script will download and set$yell AUTOMATICALLY$z the *"
echo "* National Geographic daily photo in your machine.    *"
echo -e "* To set the download lacation$green open this script with$z  *"
echo -e "*$green your notepad$z (like leafpad, medit, etc) and go to   *"
echo -e "*$yell OPTIONS$z, then set$red PICTURES_DIR=~/$z of your choise.   *"
echo -e "*$blue This script is set up for Nitrogen and Ubuntu (and$z  *"
echo -e "*$blue other *buntu system).$z                               *"
echo "*******************************************************"
echo "To continue press ENTER"
read
# If we don't have the image already today
if [ ! -e ~/Immagini/${TODAY}_ngeo.jpg ]; then
    echo "We don't have the picture saved, save it"
 
    get_page
 
    # Got the link to the image
    PICURL=`/bin/cat ~/MyDocs/pic_url`
 
    echo  "Picture URL is: ${PICURL}"
 
    echo  "Downloading image"
    wget --quiet $PICURL -O $PICTURES_DIR/${TODAY}_ngeo.jpg
    
    /usr/bin/dbus-send --print-reply --dest=com.nokia.image_viewer /com/nokia/image_viewer com.nokia.image_viewer.mime_open string:file:///home/user/MyDocs/photos/${TODAY}_ngeo.jpg
   echo "If you like the new photo press ENTER otherwise just close x-term!"
   read
	
	#This string is ONLY for Nokia N900
	echo "Setting image as wallpaper"
	gconftool -s --type string /apps/osso/hildon-desktop/views/1/bg-image ~/MyDocs/photos/${TODAY}_ngeo.jpg
	gconftool -s --type string /apps/osso/hildon-desktop/views/2/bg-image ~/MyDocs/photos/${TODAY}_ngeo.jpg
	gconftool -s --type string /apps/osso/hildon-desktop/views/3/bg-image ~/MyDocs/photos/${TODAY}_ngeo.jpg
	gconftool -s --type string /apps/osso/hildon-desktop/views/4/bg-image ~/MyDocs/photos/${TODAY}_ngeo.jpg

# Else if we have it already, check if it's the most updated copy
else
    get_page
 
    # Got the link to the image
    PICURL=`/bin/cat /tmp/pic_url`
 
    echo  "Picture URL is: ${PICURL}"
 
    # Get the filesize
    SITEFILESIZE=$(wget --spider $PICURL 2>&1 | grep Length | awk '{print $2}')
    FILEFILESIZE=$(stat -c %s $PICTURES_DIR/${TODAY}_ngeo.jpg)
 
    # If the picture has been updated
    if [[ $SITEFILESIZE != $FILEFILESIZE ]]; then
        echo "The picture has been updated, getting updated copy"
        rm $PICTURES_DIR/${TODAY}_ngeo.jpg
 
        # Got the link to the image
        PICURL=`/bin/cat /tmp/pic_url`
 
        echo  "Downloading image"
        wget --quiet $PICURL -O $PICTURES_DIR/${TODAY}_ngeo.jpg
 
		
		#This string is ONLY for Nokia N900
	echo "Setting image as wallpaper"
	gconftool -s --type string /apps/osso/hildon-desktop/views/1/bg-image ~/MyDocs/photos/${TODAY}_ngeo.jpg
	gconftool -s --type string /apps/osso/hildon-desktop/views/2/bg-image ~/MyDocs/photos/${TODAY}_ngeo.jpg
	gconftool -s --type string /apps/osso/hildon-desktop/views/3/bg-image ~/MyDocs/photos/${TODAY}_ngeo.jpg
	gconftool -s --type string /apps/osso/hildon-desktop/views/4/bg-image ~/MyDocs/photos/${TODAY}_ngeo.jpg
 
    # If the picture is the same
    else
        echo "Picture is the same, finishing up"
    fi
	
fi
 
clean_up
