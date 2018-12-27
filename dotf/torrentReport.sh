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
        #albumName=`echo $y|sed -r 's/\S+//1'`
        #albumName=`echo $y|cut -d ' ' -f2`
        albumName=`echo $y|awk '{$1=""; print $0}'|xargs -0 echo`
        #echo "Found albumName for ID: $torrentID: $albumName"
      elif [[ $infoKey = "Uploaded:" ]]
      then
        #echo "Found uploadFloat for ID: $torrentID"
        uploadFloat=`echo $y|awk '{printf $2; }'`
      fi
    done
    #pastInfoFloat=`cat torrentStatus.txt|grep -i "$albumName"|awk '{ printf \$2; }'`
    printf "\nalbumName:$albumName\n"
    #pastInfoFloat=`cat torrentStatus.txt|grep -i \"${albumName}\"|cut -f2`
    printf "\nline:\n"
    cat torrentStatus.txt|fgrep -i "$albumName"
    printf "\n"
    pastInfoFloat=`cat torrentStatus.txt|fgrep -i "$albumName"|awk '{ print $2; }'`


    #printf "entering if:\npastInfoFloat: $pastInfoFloat\nuploadFloat: $uploadFloat\n"
    printf "\npastInfoFloat: $pastInfoFloat\n"
    printf "\nuploadFloat: $uploadFloat\n"
    if [[ "$pastInfoFloat" != "$uploadFloat" ]]
    then
      if [[ "$uploadFloat" != "None" ]]
      then
        printf "\ncompared $pastInfoFloat and $uploadFloat\n"
        pastInfoLineNumber=`cat torrentStatus.txt|grep -in $albumName|cut -d ':' -f1` #get the line number of the relevant album's line in the text log so we can send it to sed
        #sed -ie "$pastInfoLineNumber d" torrentStatus.txt #this is an ugly way to delete this torrent's line in the txt log
        #echo "$torrentID $uploadFloat $albumName" >> torrentStatus.txt #this replaces it with the new one
        echo "$torrentID $uploadFloat $albumName into torrentStatus.txt"
        diffFloat=`python -c "var2=$uploadFloat - $pastInfoFloat;print(var2)"`
        printf "\ndiffFloat: $diffFloat\n"
        echo "$albumName: $diffFloat MB">>mailbuffer.txt
      else
        echo "floats $pastInfoFloat and $uploadFloat matched"
        sleep 0
      fi
    fi
  fi
done
lineCount=`cat mailbuffer.txt|wc -l`
if [[ $lineCount -ne "0" ]]
then
  echo "linecount wasn't zero"
  #mail command
fi
echo "done"
