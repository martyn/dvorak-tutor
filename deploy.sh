#!/bin/sh
s3cmd sync --recursive --delete-removed --acl-public public/ s3://dvorak.255bits.com/
