#!bin/bash

echo "Running exo 5_3"

echo "Compute the number of trees by type "
hadoop jar /usr/lib/hadoop-0.20-mapreduce/contrib/streaming/hadoop-streaming-2.6.0-mr1-cdh5.12.0.jar \
	-file /home/cloudera/Desktop/exo53/mapper53_1.py /home/cloudera/Desktop/exo53/reducer53_1.py \
	 -mapper /home/cloudera/Desktop/exo53/mapper53_1.py \
	 -reducer /home/cloudera/Desktop/exo53/reducer53_1.py \
	-input arbresCount/arbres.csv  \
	-output output53_1

hdfs dfs -get output53_1/part-00000 /home/cloudera/Desktop/exo53/treePerType.txt


echo "Compute the height of the highest tree of each type"
start=$(date +%Y%m%d%H%M%S)

hadoop jar /usr/lib/hadoop-0.20-mapreduce/contrib/streaming/hadoop-streaming-2.6.0-mr1-cdh5.12.0.jar \
	-file /home/cloudera/Desktop/exo53/mapper53_2.py /home/cloudera/Desktop/exo53/reducer53_2.py \
	 -mapper /home/cloudera/Desktop/exo53/mapper53_2.py \
	 -reducer /home/cloudera/Desktop/exo53/reducer53_2.py \
	-input arbresCount/arbres.csv  \
	-output output53_2

hdfs dfs -get output53_2/part-00000 /home/cloudera/Desktop/exo53/HeightPerType.txt

echo "Computer the borough of the oldest tree in Paris"

hadoop jar /usr/lib/hadoop-0.20-mapreduce/contrib/streaming/hadoop-streaming-2.6.0-mr1-cdh5.12.0.jar \
	-file /home/cloudera/Desktop/exo53/mapper53_3.py /home/cloudera/Desktop/exo53/reducer53_3.py \
	 -mapper /home/cloudera/Desktop/exo53/mapper53_3.py \
	 -reducer /home/cloudera/Desktop/exo53/reducer53_3.py \
	-input arbresCount/arbres.csv  \
	-output output53_3

hdfs dfs -get output53_3/part-00000 /home/cloudera/Desktop/exo53/BoroughOldest.txt

end=$(date +%Y%m%d%H%M%S)
elapse=$(($end-$start))

echo "The program run during $elapse sec."
