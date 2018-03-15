#!bin/bash

echo "Running exo 5_1"

echo "Downloading files... "

hadoop fs -mkdir input51
wget http://www.textfiles.com/etext/FICTION/defoe-robinson-103.txt
hadoop fs -copyFromLocal /home/cloudera/defoe-robinson-103.txt input51
wget http://www.textfiles.com/etext/FICTION/callwild
hadoop fs -copyFromLocal /home/cloudera/callwild input51


echo "Round 1 : word count ..."
start=$(date +%Y%m%d%H%M%S)
hadoop jar /usr/lib/hadoop-0.20-mapreduce/contrib/streaming/hadoop-streaming-2.6.0-mr1-cdh5.12.0.jar\
	-file /home/cloudera/Desktop/exo51/mapper51_1.py /home/cloudera/Desktop/exo51/reducer51_1.py \
	-mapper /home/cloudera/Desktop/exo51/mapper51_1.py  -reducer /home/cloudera/Desktop/exo51/reducer51_1.py \
	-input input51 \
	-output output51_1

hdfs dfs -get output51_1/part-00000 /home/cloudera/Desktop/exo51/wordcount.txt

echo "Round 2 : word count per doc..."
hadoop jar /usr/lib/hadoop-0.20-mapreduce/contrib/streaming/hadoop-streaming-2.6.0-mr1-cdh5.12.0.jar\
	-file /home/cloudera/Desktop/exo51/mapper51_2.py /home/cloudera/Desktop/exo51/reducer51_2.py  \
	-mapper /home/cloudera/Desktop/exo51/mapper51_2.py  -reducer /home/cloudera/Desktop/exo51/reducer51_2.py \
	-input output51_1/part-00000 \
	-output output51_2

hdfs dfs -get output51_2/part-00000 /home/cloudera/Desktop/exo51/wordcountPerdoc.txt

echo "Round 3 :doc word per count and tf-idf calcultion ... "
hadoop jar /usr/lib/hadoop-0.20-mapreduce/contrib/streaming/hadoop-streaming-2.6.0-mr1-cdh5.12.0.jar \
	-file /home/cloudera/Desktop/exo51/mapper51_3.py /home/cloudera/Desktop/exo51/reducer51_3.py  \
	-mapper /home/cloudera/Desktop/exo51/mapper51_3.py  -reducer /home/cloudera/Desktop/exo51/reducer51_3.py \
	-input output51_2/part-00000 \
	-output output51_3

hdfs dfs -get output51_3/part-00000 /home/cloudera/Desktop/exo51/tfidf_for_20_first.txt


end=$(date +%Y%m%d%H%M%S)
elapse=$(($end-$start))

echo "The program run during $elapse sec."
