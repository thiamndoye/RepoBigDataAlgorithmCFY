#!bin/bash

echo "Running exo 2.8"
start=$(date +%Y%m%d%H%M%S)

#wget https://www1. ncdc.noaa.gov/pub/data/noaa/isd-history.txt

hdfs dfs -mkdir isd-History
hdfs dfs -copyFromLocal /home/cloudera/Desktop/exo28/isd-history.txt isd-History
hadoop jar /home/cloudera/Desktop/exo28/stationInfo.jar cs.bigdata.Tutorial2.Station   isd-History/isd-history.txt

end=$(date +%Y%m%d%H%M%S)
elapse=$(($end-$start))

echo "The program run during $elapse sec."
