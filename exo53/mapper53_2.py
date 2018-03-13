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


	if linelst[6]!="HAUTEUR":
		if linelst[6]!="" and linelst[6]!=None:
			print(linelst[3]+'\t'+str(linelst[6]))


		