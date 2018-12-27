#!/bin/bash
IFS='
'
>mailbuffer.txt
>torrentStatus.txt
for x in `transmission-remote localhost:9091 -n transmission:$1 -l`
do
  torrentID=`echo $x|awk '{ printf $1; }'`
  if [[ $torrentID =~ [0-9] ]]
  then
    for y in `transmission-remote localhost:9091 -n transmission:$1 -t $torrentID -i`
    do
      infoKey=`echo $y|awk '{ printf $1; }'`
      if [[ $infoKey = "Name:" ]]
      then
        albumName=`echo $y|awk '{$1=""; print $0}'|xargs -0 echo`
      elif [[ $infoKey = "Uploaded:" ]]
      then
        uploadFloat=`echo $y|awk '{printf $2; }'`
      fi
    done
    echo "$torrentID $uploadFloat $albumName" >> torrentStatus.txt
  fi
done
