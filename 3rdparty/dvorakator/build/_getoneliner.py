import os
import argparse

template = '''var s=document.createElement('script');s.type='text/javascript';s.src='URL';document.body.appendChild(s);'''

desc = '''
Output Javascript one-liner to execute remote code, given a file containing
URLs, suitable for pasting into a URL bar.'''

parser = argparse.ArgumentParser(description=desc)
parser.add_argument('urlfile', help='file containing URLs separated by whitespace')

args = parser.parse_args()

urls = open(args.urlfile).read().split()

print 'javascript:%svoid(0);' \
        % ''.join([template.replace('URL', url) for url in urls])
