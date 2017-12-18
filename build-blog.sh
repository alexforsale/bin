#!/bin/bash 
# 
# Christian Alexander <alexforsale@yahoo.com>
# executable script untuk service systemd 
# https://alexforsale.github.io/2017-01-23-membuat-file-unit-systemd/
# 

blogpath=/home/$USER/repo/linux/blog
cd $blogpath
bundle exec jekyll build --drafts --watch --source $blogpath --destination /home/alexforsale/public_html/blog
