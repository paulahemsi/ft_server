#!/bin/bash

sed --in-place "s/autoindex off;/autoindex on;/g" /etc/nginx/sites-available/demo_site
service nginx restart