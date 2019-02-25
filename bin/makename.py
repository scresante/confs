#!/usr/bin/python
import random
with open('/usr/lib/python3.7/site-packages/electrum/wordlist/english.txt', 'r') as f:
    words = f.readlines()
    f = []
    [f.append(random.choice(words)) for _ in range(3)]
print('-'.join([_.strip() for _ in f]))
