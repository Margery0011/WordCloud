#!/usr/bin/bash

echo "Successfully run for $USER"

cd ~/trgn_wordcloud2/

counter=1

while read line

    do

       wget -O ~/trgn_wordcloud2/current_pages/file$counter.html $line

        ((counter++))

    done < my_webpages.txt

html2text.py ~/trgn_wordcloud2/current_pages/file1.html > my_currents.txt
html2text.py ~/trgn_wordcloud2/current_pages/file2.html >> my_currents.txt

wordcloud_cli --text my_currents.txt --imagefile ~/public_html/wordclouds.png --mask ~/public_html/dj.png --height 300 --margin 1 --contour_width 4 --min_word_length 6 --background "white" 
cp  ~/public_html/wordclouds.png ~/trgn_wordcloud2/currentpages

echo "Successfully picture it for $USER"
