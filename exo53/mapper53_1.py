#!/usr/bin/env python

import string
import os
import sys

for line in sys.stdin:
	#line=line.strip()
	linelst=[]
	try:
		linelst=line.split(',')
	except :
		pass
	finally:
		linelst=line.split(';')

	
	print(linelst[3]+ '\t'+ str(1))

		
