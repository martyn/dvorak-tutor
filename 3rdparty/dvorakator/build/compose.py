#!/usr/bin/env python
import os
import argparse
from urllib2 import urlopen

desc = '''Combine text from many files together and output the result.'''

parser = argparse.ArgumentParser(description=desc)
parser.add_argument(
        'urlfile',
        help='file containing URLs of input files, separated by whitespace'
        )

args = parser.parse_args()

urls = open(args.urlfile).read().split()

print '(function () {%s}());' \
        % ''.join(urlopen(f).read() if '://' in f else open(f).read() for f in urls)
