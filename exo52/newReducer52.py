#!/usr/bin/env python
import sys
import os
elts=[]
for line in sys.stdin:
	elts.append[line]
	lineSplit=line.split('\t')
	if len(lineSplit)>=2:
		key=lineSplit[0]
		pg=float(lineSplit[1])
		numLink=int(lineSplit[1])
		lsted=lineSplit[2].split("$")
		for a in lsted:
			print(a+"\t"+str(pg/numLink))

for line in elts:
	print(line)
