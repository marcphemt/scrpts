#!/bin/sh
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
PICTURE_DIR=~/MyDocs/photos
QUIET="n"
NUM_OF_DESKTOPS=4

# ********************************
# *** FUNCTIONS
# ********************************
get_page () {
    echo "Downloading page to find image"
    wget http://photography.nationalgeographic.com/photography/photo-of-the-day/ --quiet -O- 2> /dev/null |
    grep -m 1 images.nationalgeographic.com/.*.jpg -o > ${PICTURE_DIR}/pic_url
}

set_image () {
    DESKTOP=1
    echo "Setting image as wallpaper"
    until `test "$DESKTOP" = "$NUM_OF_DESKTOPS"`
    do
        gconftool -s --type string /apps/osso/hildon-desktop/views/${DESKTOP}/bg-image ${PICTURE_FILE}
        DESKTOP=`expr $DESKTOP + 1`
    done
}

# ********************************
# *** MAIN
# ********************************
echo "===================="
echo "== NGEO Wallpaper =="
echo "===================="

# Set date
TODAY=$(date +'%Y%m%d')
PICTURE_FILE="$PICTURE_DIR/${TODAY}_ngeo.jpg"

echo "*******************************************************"
echo -e "* This script will download and set$yell AUTOMATICALLY$z the *"
echo "* National Geographic daily photo in your machine.    *"
echo -e "* To set the download lacation$green open this script with$z  *"
echo -e "*$green your notepad$z (like leafpad, medit, etc) and go to   *"
echo -e "*$yell OPTIONS$z, then set$red PICTURE_DIR=~/$z of your choice.   *"
echo -e "*$blue This script is set up for N900 ONLY $z                *"
echo "*******************************************************"

if [ "$QUIET" = "n" ]; then
  echo "To continue press ENTER"
  read tmp
fi

get_page

# Got the link to the image
PICTURE_URL=`cat ${PICTURE_DIR}/pic_url`

echo  "Picture URL is: ${PICTURE_URL}"

if [ ! -d "$PICTURE_DIR" ]; then
    mkdir $PICTURE_DIR
fi


# If we don't have the image already today
if [ ! -e $PICTURE_FILE ]; then
    echo "We don't have the picture saved, save it"

    echo  "Downloading image"
    wget --quiet $PICTURE_URL -O $PICTURE_FILE

    dbus-send --print-reply --dest=com.nokia.image_viewer /com/nokia/image_viewer com.nokia.image_viewer.mime_open string:file://${PICTURE_FILE}
    if [ "$QUIET" != "y" ]; then
        echo "If you like the new photo press ENTER otherwise just close x-term or type 'n'!"
        read ANSWER
        [ "$ANSWER" = "n" ] && exit
    fi

   #This string is ONLY for Nokia N900
   set_image

# Else if we have it already, check if it's the most updated copy
else
    # Get the filesize
    SITEFILESIZE=$(wget --spider $PICTURE_URL 2>&1 | grep Length | awk '{gsub("\,",""); print $2}')
    FILEFILESIZE=$(stat $PICTURE_FILE | grep Size | awk '{print $2}')

    # If the picture has been updated
    if [[ $SITEFILESIZE != $FILEFILESIZE ]]; then
        echo "The picture has been updated, getting updated copy"
        rm $PICTURE_FILE

        echo  "Downloading image"
        wget --quiet $PICTURE_URL -O $PICTURE_FILE

        #This string is ONLY for Nokia N900
        set_image

    # If the picture is the same
    else
        echo "Picture is the same, finishing up"
    fi
fi
