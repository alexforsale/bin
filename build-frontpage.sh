#!/bin/bash 
# 
# Christian Alexander <alexforsale@yahoo.com>
# executable script untuk service systemd 
# https://alexforsale.github.io/2017-01-23-membuat-file-unit-systemd/
# 

frontpagepath=/home/$USER/repo/linux/alexforsale.github.io
GEM_HOME=$(/usr/bin/ls -t -U | /usr/bin/ruby -e 'puts Gem.user_dir')

cd $frontpagepath
$GEM_HOME/bin/jekyll build --watch -s $frontpagepath -d /home/$USER/public_html
