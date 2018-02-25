#! /bin/sh

date
echo 'start'
python pyAPI.py 2 1 50 & python pyAPI.py 3 1 50 & python pyAPI.py 8 1 50 & python pyAPI.py 9 1 50 & 
echo 'end'
date