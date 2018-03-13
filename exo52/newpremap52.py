#!/usr/bin/env python
from os.path import join
import sys

def createGraphList(path):
	outputList=[]
	with open(path) as f:
		outputList=f.readlines()
	

	dico={}
	alledges=[]
	for i in range(len(outputList)):
		if i>3:
			tup=outputList[i].strip()
			print(tup)
			nodeor=tup.split('\t',1)[0]
			nodeto=tup.split('\t',1)[1]
			alledges.append(int(nodeor))
			if int(nodeto) in dico:
				dico[int(nodeto)].append(int(nodeor))
			else:
				dico[int(nodeto)]=[]
				dico[int(nodeto)].append(int(nodeor))
	n=len(dico.keys())
	prob_in=1.0/n
	dico_with_prob_len={}
	for a in dico:
		dico_with_prob_len[a]=(prob_in,len(dico[a]),dico[a])
	for b in set(alledges):
		if b not in dico_with_prob_len:
			dico_with_prob_len[b]=(prob_in,0,[])

	return dico_with_prob_len

if __name__=="__main__":
	dico_with_prob=createGraphList(sys.argv[1])
	n=len(dico_with_prob.keys())
	proba=1.0/n

	file = open("/home/cloudera/Desktop/exo52/nodeandata.txt","w") 

	file.write('countEdge'+'$'+str(n))
	
	for a in dico_with_prob:
		liststr=[str(b) for b in dico_with_prob[a][2]]
		file.write(str(a)+'\t'+str(dico_with_prob[a][0])+'\t'+str(dico_with_prob[a][1])+'$'.join(liststr))

	file.close()