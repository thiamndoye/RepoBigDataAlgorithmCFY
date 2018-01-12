#!bin/bash
for station in $*
do
	hdfs dfs -mkdir -p fichiersLab2/noaaMeteo/$station
	hdfs dfs -chmod go+rx fichiersLab2/noaaMeteo/$station
	for annee in 2015 2016 2017
	do
	nom=$station-99999-$annee.gz
	fichier=fichiersLab2/noaaMeteo/$station/$nom
	url=https://www1.ncdc.noaa.gov/pub/data/noaa/${annee}/$nom
        	wget -nv -O - $url | gunzip | hdfs dfs -put - $fichier
	hdfs dfs -chmod go+r $fichier
	done
done 
