#!/usr/bin/env python

import sys
import os
import string 

# input comes from STDIN (standard input)
for line in sys.stdin:
    # remove leading and trailing whitespace
    filename = os.environ["map_input_file"].split("/")[-1].split(".")[0]

    line = line.strip()
    line=line.translate(None, string.punctuation)
    # split the line into words
    words = line.split()
    # increase counters
    for word in words:
        # write the results to STDOUT (standard output);
        # what we output here will be the input for the
        # Reduce step, i.e. the input for reducer.py
        #
        # tab-delimited; the trivial word count is 1
        print '%s\t%d' % (word+"$"+filename, 1)