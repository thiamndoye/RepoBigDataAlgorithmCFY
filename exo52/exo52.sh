#!bin/bash

echo "Running exo 5_2"

hdfs dfs -mkdir pageRank
hdfs dfs -copyFromLocal /home/cloudera/Desktop/exo52/soc-Epinions1.txt pageRank

start=$(date +%Y%m%d%H%M%S)

hadoop jar /home/cloudera/Desktop/exo52/pageR.jar cs.bigdata.Tutorial2.Main52 java52/soc-Epinions1.txt out52
hdfs dfs -get out52/15/part-r-00000 /home/cloudera/Desktop/exo52/all_page_rank.txt

#hdfs dfs -rm -R out52

end=$(date +%Y%m%d%H%M%S)
elapse=$(($end-$start))

echo "The program run during $elapse sec."
