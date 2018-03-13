#!/usr/bin/env python

from operator import itemgetter
import sys


elts=[]
docCount={}

# input comes from STDIN
for line in sys.stdin:
    line = line.strip()
    elts.append(line)

    doc, wordCount = line.split('\t', 1)

    if doc in list(docCount.keys()):
        docCount[doc]+=1
    else:   
        docCount[doc]=1

for line in elts:

    doc, wordCount = line.split('\t', 1)
    word=wordCount.split("$")[0]
    countstr=wordCount.split("$")[1]
    
    worDoc=word+"$"+doc
    countDoCount=countstr+"$"+str(docCount[doc])
    
    print '%s\t%s' % (worDoc, countDoCount)
