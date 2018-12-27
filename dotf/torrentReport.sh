#!/bin/bash
IFS='
'
>mailbuffer.txt
for x in `transmission-remote localhost:9091 -n transmission:werqwe -l`
do
  torrentID=`echo $x|awk '{ printf $1; }'`
  if [[ $torrentID =~ [0-9] ]]
  then
    for y in `transmission-remote localhost:9091 -n transmission:werqwe -t $torrentID -i`
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
    pastInfoFloat=`cat torrentStatus.txt|fgrep -i "$albumName"|awk '{ print $2; }'`


    if [[ "$pastInfoFloat" != "$uploadFloat" ]]
    then
      if [[ "$uploadFloat" != "None" ]]
      then
        #get the line number of the relevant album's line in the text log so we can send it to sed
        pastInfoLineNumber=`cat torrentStatus.txt|grep -in $albumName|cut -d ':' -f1` 
        #sed -ie "$pastInfoLineNumber d" torrentStatus.txt #this is an ugly way to delete this torrent's line in the txt log
        #echo "$torrentID $uploadFloat $albumName" >> torrentStatus.txt #this replaces it with the new one
        echo "$torrentID $uploadFloat $albumName into torrentStatus.txt"
        diffFloat=`python -c "var2=$uploadFloat - $pastInfoFloat;print(var2)"`
        echo "$albumName: $diffFloat MB">>mailbuffer.txt
      else
      fi
    fi
  fi
done
lineCount=`cat mailbuffer.txt|wc -l`
if [[ $lineCount -ne "0" ]]
then
  #mail command
fi
echo "done"
