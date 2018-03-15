import os
import operator


df={}
fs=open("/Users/yaguethiam/Essec_DSBA/BigdataAlgorithm/Projects_Hadoop_HannahKarenine/exo52/all_page_rank.txt")
for line in fs:
	lines=line.split('\t')
	df[lines[0]]=float(lines[1])

sorted_x = sorted(df.items(), key=operator.itemgetter(1),reverse=True)
print(sorted_x[:10])