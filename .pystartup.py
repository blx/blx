import re
import itertools as it
import operator as op
from functools import partial
p = partial

def doc(fn):
    """doc(fn)
    
    Prints the docstring for `fn`, if there is one."""

    print(fn.__doc__)
