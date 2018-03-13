#!/usr/bin/env python

import os,sys

current_espece=None
espece=None
count=1

for line in sys.stdin:
	linelst=line.split('\t')
	espece=linelst[0]

	if current_espece==espece and current_espece!="ESPECE":
		count+=1

	else:
		if current_espece and current_espece!="ESPECE":
			print(current_espece+'\t'+str(count))
		current_espece=espece
		count=1

if current_espece==espece:
	print(current_espece+'\t'+str(1))
