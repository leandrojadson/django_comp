#!/bin/bash


#tail -f /dev/null


#cd src/__core
pdm install
eval "$(pdm --pep582)"
#cd ../..

python manage.py runserver 0.0.0.0:8007

# make runserver

#tail -f /dev/null

