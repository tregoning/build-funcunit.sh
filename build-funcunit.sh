#!/bin/bash -
###############################################################################
# File:		build-funcunit.sh
#
# Description:  Script to build a standalone version of FuncUnit from source
#
# Author: 	John Tregoning
#
###############################################################################


git clone https://github.com/bitovi/funcunit.git

cd funcunit
git submodule init
git submodule update
npm install promised-io
npm install node-phantom

cd ..

#bespoke stealconfig file
curl -O https://gist.github.com/tregoning/6128825/raw/e17a8b2b6c81aaefcf0b6593c649241c1e70eedf/stealconfig.js
curl -O http://code.jquery.com/jquery-1.10.2.min.js

curl -O https://raw.github.com/bitovi/javascriptmvc/master/js
chmod +x ./js

git clone https://github.com/bitovi/steal.git