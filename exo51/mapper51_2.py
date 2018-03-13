#!/usr/bin/env python

import sys

for line in sys.stdin:
    # remove leading and trailing whitespace
    line = line.strip()

    # split the line into words
    wordoCount = line.split('\t',1)
    word=wordoCount[0].split("$")[0]
    doc=wordoCount[0].split("$")[1]
    count=int(wordoCount[1])
    wordCount=word+"$"+str(count)
    
    
    print '%s\t%s' % (doc, wordCount)