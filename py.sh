#!/bin/bash
echo ##########################
file = `ls -rt /srv/blue/cs115 | head -n 1`
python3 $file
