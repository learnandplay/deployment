#!/bin/bash

python /home/website/lp_website/manage.py migrate
python /home/website/lp_website/manage.py migrate static_precompiler
python /home/website/lp_website/manage.py runserver 0.0.0.0:8000
