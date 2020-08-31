#!/usr/bin/python3
import sys, re
codes = {
    'abc': 2,
    'def': 3,
    'ghi': 4,
    'jkl': 5,
    'mno': 6,
    'pqrs': 7,
    'tuv': 8,
    'wxyz': 9,
}

print(str().join(list(map(lambda char: str(next(filter(lambda x: char.lower() in x[0], codes.items()))[1]) if re.match(r'^[\d\-\(\)]$', char) is None else char, list(filter(lambda x: x.isspace() == False, list(str().join(sys.argv[1:]))))))))
