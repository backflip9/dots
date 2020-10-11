#!/usr/bin/python3
import sys, itertools, re

print(re.sub('_+', '_', str().join(list(itertools.starmap(lambda index, char: ('_' if char.isupper() and index > 0 else '') + ('_' if char.isspace() else char.lower()), enumerate(list(str(' ').join(sys.argv[1:]))))))))
