#!/usr/bin/python
import random, bz2, os, sys

os.chdir(os.path.dirname(os.path.realpath(__file__)))

def un(s):
    return s.decode('utf-8').strip()

def acronym(acro):
    with bz2.BZ2File('words.bz2', 'r') as f:
        words = [un(_) for _ in f.readlines()]
    ret = [] 
    acro = acro.lower()
    for letter in acro:
        ret.append(random.choice([w for w in words if w[0] == letter]))
    print(f'{acro}: {" ".join(ret)}')

def make_random(num=3):
    with bz2.BZ2File('words.bz2', 'r') as f:
        words = [un(_) for _ in f.readlines()]
        f = []
        [f.append(random.choice(words)) for _ in range(num)]
    print('-'.join([_.strip() for _ in f]))

if __name__ == "__main__":
    if len(sys.argv) == 3:
        cyc = int(sys.argv[2])
        for _ in range(cyc):
            acronym(sys.argv[1])
    elif len(sys.argv) == 2:
        if sys.argv[1].isalpha():
            acronym(sys.argv[1])
        if sys.argv[1].isnumeric():
            make_random(int(sys.argv[1]))
    else:
        make_random()
