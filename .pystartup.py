"""PYSTARTUP
Everything in this module will be executed/made available whenever a REPL is
launched."""

import re
import os
import itertools as it
import operator as op
from pprint import pprint
from collections import namedtuple, Counter
from functools import partial
p = partial

# Autocompletion
try:
    import readline
except ImportError:
    print('Warning: module `readline` not available. Tab autocomplete disabled.')
else:
    import rlcompleter
    readline.parse_and_bind('tab: complete')
    del readline, rlcompleter

try:
    import requests as rq
except ImportError:
    pass

def doc(fn):
    """doc(fn)
    
    Prints the docstring for `fn`, if there is one."""
    print(fn.__doc__)

def identity(x): return x
def inc(x):      return x + 1
def dec(x):      return x - 1

def juxt(*fns):
    def _juxted(*a, **kw):
        return [f(*a, **kw) for f in fns]
    return _juxted

def iterate(f, x):
    while True:
        yield x
        x = f(x)

def take(n, coll):
    return list(it.islice(coll, n))

def slurp(f):
    with open(f):
        return f.read()

def spit(f, txt):
    """spit(f, txt): Writes `txt` to file at `f`"""
    with open(f, 'w') as f:
        f.write(txt)
