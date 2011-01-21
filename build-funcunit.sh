#!/bin/bash -
###############################################################################
# File:		build-funcunit.sh
#
# Description:  Script to build FuncUnit from source, translated from the instructions 
#		found here: https://github.com/jupiterjs/funcunit/raw/master/README into a script 
#		Some modifications have been added as required in order to build the project.
#		Changes/Additions from original instructions are marked under "Note:"
#
# Author: 	John Tregoning
#
###############################################################################

#Clone the repository at http://github.com/jupiterjs/javascriptmvc
git clone git://github.com/jupiterjs/javascriptmvc.git

#Use git submodule init and git submodule update to get the submodules.  The only ones we'll need are steal and funcunit
#Note: jQuery & Syn are also required
cd javascriptmvc
git submodule init
git submodule update
cd funcunit
git checkout master
cd ../steal
git checkout master
cd ../jquery
git checkout master

cd ../funcunit
git submodule init
git submodule update
cd syn
git checkout master


#Make whatever changes you want to syn, funcunit, drivers, or selenium. 
#***Your changes go here***

#From the framework directory, on the command line run js funcunit/build.js.  This will build the JS scripts and copy the relevant files.
cd ../../
./js funcunit/build.js

#That's it, funcunit/dist contains the same standalone funcunit placed into the standalone download.
