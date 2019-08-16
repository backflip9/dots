#!/bin/bash
IFS='
'
#temporarily not emptying mailbuffer so that we can see what accumulates over time
#>mailbuffer.txt
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
        printf "\n$albumName\n"
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
        echo "`date +%F-%H%M%S`: $albumName: $diffFloat MB">>mailbuffer.txt
      fi
    fi
  fi
done
lineCount=`cat mailbuffer.txt|wc -l`
if [[ $lineCount -ne "0" ]]
then
  #mail command
  cat mailbuffer.txt
  printf "\n"
  #cat mailbuffer.txt|mail -s "buffer report" wilburpig112@gmail.com
else
  echo "No new buffer">>mailbuffer.txt
fi
echo "done"
