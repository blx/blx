"""PYSTARTUP
Everything in this module will be executed/made available whenever a REPL is
launched."""

import re
import os
import itertools as it
import operator as op
from pprint import pprint
from functools import partial
p = partial

try:
    import requests as rq
except ImportError:
    pass

def doc(fn):
    """doc(fn)
    
    Prints the docstring for `fn`, if there is one."""

    print(fn.__doc__)

identity = lambda x: x
inc = lambda x: x + 1
dec = lambda x: x - 1

juxt = lambda *fns: lambda *a, **kw: [f(*a, **kw) for f in fns]

def iterate(f, x):
    while True:
        yield x
        x = f(x)

def slurp(f):
    with open(f):
        return f.read()

def spit(f, txt):
    with open(f, 'w'):
        f.write(txt)
