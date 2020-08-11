#!/usr/bin/python3
import sys
import itertools

print(str().join(list(itertools.starmap(lambda index, char: ('_' if char.isupper() and index != 0 else '') + char.lower(), enumerate(list(sys.argv[1]))))))
