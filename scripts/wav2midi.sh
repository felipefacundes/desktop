#!/bin/bash
#
#for file in *.WAV ; 
#  do mv "$file" "${file#}.wav" ; 
#done

for i in *.WAV;
  do name=`echo $i | cut -d'.' -f1`;
  echo $name;
  mv "$i" "${name}.wav";
done

sleep 1

rm *.WAV

sleep 1

for i in *.wav;
  do name=`echo $i | cut -d'.' -f1`;
  echo $name;
  waon -i "$i" -o "${name}.oga";
done 
