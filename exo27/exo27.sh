#!bin/bash

echo "Running exo 2.7"
start=$(date +%Y%m%d%H%M%S)

hdfs dfs -mkdir arbresCount
hdfs dfs -copyFromLocal /home/cloudera/Desktop/exo27/arbres.csv arbresCount
hadoop jar /home/cloudera/Desktop/exo27/arbreHeightYear.jar cs.bigdata.Tutorial2.Tree  arbresCount/arbres.csv

end=$(date +%Y%m%d%H%M%S)
elapse=$(($end-$start))

echo "The program run during $elapse sec."
