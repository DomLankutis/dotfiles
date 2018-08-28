#! /bin/bash

lynx http://redditplay.ml/getplaylist.php?subreddit=listentothis -accept_all_cookies -cmd_script=keystrokes.txt

list=$(cat http.txt | grep URL -i | head -1 | grep -o "list=.*")

youtube-dl --ignore-errors --geo-bypass --add-metadata --embed-thumbnail --xattrs --extract-audio --audio-quality 0 --audio-format best -o "/home/dom/Music/%(title)s.%(ext)s" " https://www.youtube.com/playlist?=&$list"

rm http.txt
