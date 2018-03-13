#!/usr/bin/env python

from operator import itemgetter
import sys
import math
import operator

words_all={}
temp=[]


current_word=None
word=None
current_doCountDoCount=None
for line in sys.stdin:
    # remove leading and trailing whitespace
    line = line.strip()
    # parse the input we got from mapper.py
    word, doCountDoCount = line.split('\t', 1)
    
    if word in words_all:
    words_all[word].append(doCountDoCount)
    else:
    words_all[word]=[]
    words_all[word].append(doCountDoCount)


word_doc_final={}
for word in words_all:
    presentin=len(words_all[word])
    for doCountDoCount in words_all[word]:
        doc=doCountDoCount.split("$")[0]
        wordcount=doCountDoCount.split("$")[1]
        DocCount=doCountDoCount.split("$")[2]

        wordoc=word+"$"+doc
        word_doc_final[wordoc]=wordcount+"$"+DocCount+"$"+str(presentin)

#compute tfidf
final_dico={}
for word_doc in word_doc_final:
    counts=word_doc_final[word_doc].split("$")
    thistfidf=float(int(counts[0]))/float(int(counts[1]))
    thistfidf=thistfidf*math.log(2.0/float(int(counts[2])))
    final_dico[word_doc]=thistfidf


final_sorted = sorted(final_dico.iteritems(), key=operator.itemgetter(1),reverse=True)
counter=0
for a in final_sorted:
    if counter<20:
        counter=counter+1
        print(a[0]+" "+str(a[1]))
    else:
        break

