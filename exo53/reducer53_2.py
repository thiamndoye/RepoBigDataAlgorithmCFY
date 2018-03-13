#!/usr/bin/env python

import os
import sys
from os.path import join

dico={}

for line in sys.stdin:
	linelst=line.split('\t',1)
	espece=linelst[0]
	
	if espece in list(dico.keys()):
		if float(linelst[1])>dico[espece]:
			dico[espece]=float(linelst[1])
		#dico[espece]=linelst[1]+' '+dico[espece]
	else:
		dico[espece]=float(linelst[1])


for dic in list(dico.keys()):
	print(dic+'\t'+str(dico[dic]))
		