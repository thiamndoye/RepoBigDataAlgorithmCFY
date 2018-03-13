#!/usr/bin/env python


import os
import sys

current_espece=None
espece=None
count=0
minborn_all=3000
borough=''
for line in sys.stdin:
	linelst=line.split('\t')
	minborn=linelst[1]

	if int(minborn)<minborn_all:
		borough=linelst[2]
		minborn_all=minborn

print("the oldest tree in Paris , born in "+str(minborn_all)+" is located at "+borough)