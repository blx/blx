# PYSTARTUP
#
# Everything in this module will be executed/made available whenever a REPL is
# launched.

import re
import os
import itertools as it
import operator as op
from pprint import pprint
from collections import namedtuple, Counter
from functools import reduce
from functools import partial
p = partial


### REPL stuff

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


### Core prelude

def identity(x): return x
def inc(x):      return x + 1
def dec(x):      return x - 1

def is_pos(x):   return x > 0
def is_neg(x):   return x < 0
def is_zero(x):  return x == 0

first  = op.itemgetter(0)
second = op.itemgetter(1)

try:
    items = dict.iteritems
except AttributeError:
    items = dict.items

def merge(*dicts):
    """Returns the dict obtained by shallowing merging the `dicts` left-to-right.
    merge *dicts :: *{} -> {}"""
    return dict(it.chain.from_iterable(items(d) for d in dicts if d))

def comp(*fns):
    if not fns:
        return identity

    # :o
    def _comped(*a, **kw):
        x = fns[-1](*a, **kw)
        for f in fns[-2::-1]:
            x = f(x)
        return x
    _comped.__name__ = 'comp(%s)' % ', '.join(map(op.attrgetter('__name__'), fns))
    return _comped

def juxt(*fns):
    def _juxted(*a, **kw):
        return [f(*a, **kw) for f in fns]
    _juxted.__name__ = 'juxt(%s)' % ', '.join(map(op.attrgetter('__name__'), fns))
    return _juxted

def iterate(f, x):
    while True:
        yield x
        x = f(x)

def take(n, coll):
    return list(it.islice(coll, n))

def slurp(f):
    with open(f) as fp:
        return fp.read()

def spit(f, txt):
    """spit(f, txt): Writes `txt` to file at `f`"""
    with open(f, 'w') as fp:
        fp.write(txt)
