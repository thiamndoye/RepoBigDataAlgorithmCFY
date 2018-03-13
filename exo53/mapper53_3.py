#!/usr/bin/env python

import string
import os
import sys

for line in sys.stdin:

	linelst=[]
	try:
		linelst=line.split(',')
	except :
		pass
	finally:
		linelst=line.split(';')

	
	if linelst[5]!='' and linelst[5] and linelst[8]!="ADRESSE":
		print(linelst[3]+ '\t'+ linelst[5]+'\t'+linelst[8])
	elif  linelst[8]!="ADRESSE":
		print(linelst[3]+ '\t'+str(2017)+'\t'+linelst[8])

		
