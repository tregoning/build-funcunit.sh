#!/bin/bash -
###############################################################################
# File:		build-funcunit.sh
#
# Description:  Script to build a standalone version of FuncUnit from source
#
# Author: 	John Tregoning
#
###############################################################################

# Verifying pre-requisites:
EXIT_CODE=0
which npm &> /dev/null
EXIT_CODE=`expr ${EXIT_CODE} + $?`
if [[ ${EXIT_CODE} -ne 0 ]]; then
	echo ""
    echo " ----------------------------------------------- "
    echo "|                                               |"
    echo "| Please install NPM, as it is required:        |"
    echo "|                                               |"
    echo "| http://nodejs.org/download                    |"
    echo "|                                               |"
    echo " ----------------------------------------------- "	
    echo ""
    exit $((${EXIT_CODE}))
fi

which curl &> /dev/null
EXIT_CODE=`expr ${EXIT_CODE} + $?`
if [[ ${EXIT_CODE} -ne 0 ]]; then
	echo ""
    echo " ----------------------------------------------- "
    echo "|    * * * CANNOT INSTALL SGT DONOWITZ * * *    |"
    echo "|                                               |"
    echo "| Please install curl, as it is required:       |"
    echo "|                                               |"
    echo "| http://curl.haxx.se/docs/install.html         |"
    echo "|                                               |"
    echo " ----------------------------------------------- "	
    echo ""
    exit $((${EXIT_CODE}))
fi

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