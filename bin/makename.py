#!/usr/bin/python
import random, bz2, os

os.chdir(os.path.dirname(os.path.realpath(__file__)))

def un(s):
    return s.decode('utf-8').strip()
with bz2.BZ2File('words.bz2','r') as f:
    words = [un(_) for _ in f.readlines()]
    f = []
    [f.append(random.choice(words)) for _ in range(3)]
print('-'.join([_.strip() for _ in f]))
