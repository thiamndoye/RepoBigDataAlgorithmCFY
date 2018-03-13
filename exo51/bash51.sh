#!bin/bash


hadoop fs -mkdir input51
wget http://www.textfiles.com/etext/FICTION/defoe-robinson-103.txt
hadoop fs -copyFromLocal /home/cloudera/Downloads/defoe-robinson-103.txt input51
wget http://www.textfiles.com/etext/FICTION/callwild
hadoop fs -copyFromLocal /home/cloudera/Downloads/callwild input51


hadoop jar /usr/lib/hadoop-0.20-mapreduce/contrib/streaming/hadoop-streaming-2.6.0-mr1-cdh5.12.0.jar\
	-file /home/cloudera/Desktop/mapper51_1.py /home/cloudera/Desktop/reducer51_1.py \
	-mapper /home/cloudera/Desktop/mapper51_1.py  -reducer /home/cloudera/Desktop/reducer51_1.py \
	-input input51 \
	-output output51_1

hadoop jar /usr/lib/hadoop-0.20-mapreduce/contrib/streaming/hadoop-streaming-2.6.0-mr1-cdh5.12.0.jar\
	-file /home/cloudera/Desktop/mapper51_2.py /home/cloudera/Desktop/reducer51_2.py  \
	-mapper /home/cloudera/Desktop/mapper51_2.py  -reducer /home/cloudera/Desktop/reducer51_2.py \
	-input output51_1/part-00000 \
	-output output51_2

hadoop jar /usr/lib/hadoop-0.20-mapreduce/contrib/streaming/hadoop-streaming-2.6.0-mr1-cdh5.12.0.jar \
	-file /home/cloudera/Desktop/mapper51_3.py /home/cloudera/Desktop/reducer51_3.py  \
	-mapper /home/cloudera/Desktop/mapper51_3.py  -reducer /home/cloudera/Desktop/reducer51_3.py \
	-input output51_2/part-00000 \
	-output output51_3