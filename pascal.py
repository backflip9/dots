#!/usr/bin/python3
import sys
import itertools

underscore = False
def next(index, char):
    global underscore
    if(char == '_'):
        underscore = True
        ret = ''
    else:
        ret = char.upper() if underscore or index == 0 else char.lower()
        underscore = False
    return ret

print(str().join(list(itertools.starmap(next, enumerate(list(sys.argv[1]))))))
