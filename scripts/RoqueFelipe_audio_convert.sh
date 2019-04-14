for i in *.*;
  do name=`echo $i | cut -d'.' -f1`;
  echo $name;
  ffmpeg -i "$i" -acodec copy -vn -n "${name}.m4a";
done

sleep 1

find . -maxdepth 1 -size 0c -exec rm {} \;

sleep1

for i in *.*;
  do name=`echo $i | cut -d'.' -f1`;
  echo $name;
  ffmpeg -i "$i" -acodec copy -vn -n "${name}.mp3";
done 

sleep 1

find . -maxdepth 1 -size 0c -exec rm {} \;

sleep 1

for i in *.*;
  do name=`echo $i | cut -d'.' -f1`;
  echo $name;
  ffmpeg -i "$i" -acodec copy -vn -n "${name}.oga";
done 

sleep 1

find . -maxdepth 1 -size 0c -exec rm {} \;
