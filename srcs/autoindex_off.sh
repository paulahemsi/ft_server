#!/bin/bash

sed --in-place "s/autoindex on;/autoindex off;/g" /etc/nginx/sites-available/demo_site
service nginx restart