#!/bin/bash
IFS='
'
>mailbuffer.txt
>torrentStatus.txt
for x in `transmission-remote localhost:9091 -n transmission:werqwe -l`
do
  torrentID=`echo $x|awk '{ printf $1; }'`
  if [[ $torrentID =~ [0-9] ]]
  then
    for y in `transmission-remote localhost:9091 -n transmission:werqwe -t $torrentID -i`
    do
      infoKey=`echo $y|awk '{ printf $1; }'`
      #infoKey=`echo $y|cut -d ' ' -f1`
      #printf "\ninfokey: $infoKey\n"
      if [[ $infoKey = "Name:" ]]
      then
        #albumName=`echo $y|sed -r 's/\S+//1'`
        albumName=`echo $y|awk '{$1=""; print $0}'|xargs -0 echo`
        #echo "Found albumName for ID: $torrentID: $albumName"
      elif [[ $infoKey = "Uploaded:" ]]
      then
        #echo "Found uploadFloat for ID: $torrentID"
        uploadFloat=`echo $y|awk '{printf $2; }'`
      fi
    done
    echo "$torrentID $uploadFloat $albumName" >> torrentStatus.txt #this replaces it with the new one
    echo "$torrentID $uploadFloat $albumName into torrentStatus.txt"
  fi
done
