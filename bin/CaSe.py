#!/usr/bin/python
import random
import subprocess
from itertools import zip_longest
def oof(s):
    s0 = [_.upper() for _ in q[0::2]]
    s1 = [_.lower() for _ in q[1::2]]
    return "".join(i for j in zip_longest(s0,s1, fillvalue='') for i in j)

def getclip():
    return subprocess.run(['xsel','-b'], stdout=subprocess.PIPE, encoding='UTF-8').stdout

def random_shuffle_case(string, percent=0.1):
    string = list(string)
    le = len(string)
    num_to_shuf = le*percent
    idx_to_shuf = [random.randint(0,le-1) for _ in range(int(num_to_shuf))]
    for i in idx_to_shuf:
      string[i] = string[i].upper()
    return ''.join(string)

def setclip(s):
    echo_process = subprocess.Popen(['echo', q], stdout=subprocess.PIPE) 
    copy_process = subprocess.Popen(['xsel','-ib'], stdin=echo_process.stdout, stdout=subprocess.PIPE)
    echo_process.stdout.close()
    # cmd = f"echo '''{s}''' | xsel -ib"
    # subprocess.run(cmd, shell=True)
    # subprocess.run(['xsel','-ib',s])

if __name__ == "__main__":
    q = getclip()
    # print(f'clip is {q}')
    q = oof(q)
    q = random_shuffle_case(q, 0.24)
    setclip(q)
