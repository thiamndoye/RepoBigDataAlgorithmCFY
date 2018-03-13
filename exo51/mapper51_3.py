#!/usr/bin/env python

import sys

# input comes from STDIN (standard input)
for line in sys.stdin:
    # remove leading and trailing whitespace
    line = line.strip()
    # split the line into words
    worDoc,countDoCount = line.split('\t',1)
    word=worDoc.split("$")[0]
    doc=worDoc.split("$")[1]

    count=int(countDoCount.split("$")[0])
    doCount=int(countDoCount.split("$")[1])
    
    doCountDoCount=doc+"$"+str(count)+"$"+str(doCount)
    print '%s\t%s' % (word, doCountDoCount)