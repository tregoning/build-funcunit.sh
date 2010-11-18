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
#Note: jQuery is also required
cd javascriptmvc
git submodule init
git submodule update
cd funcunit
git checkout master
cd ../steal
git checkout master
cd ../jquery
git checkout master

#Unzip funcunit/java/selenium-server.jar into a folder at funcunit/java/selenium-server/
#Note: selenium-server.jar is now called selenium-server-standalone-2.0a5.jar
cd ../funcunit/java
mkdir selenium-server
cd selenium-server
tar xfv ../selenium-server-standalone-2.0a5.jar

#Make whatever changes you want to syn, funcunit, drivers, or selenium. 
#***Your changes go here***

#From the framework directory, on the command line run js funcunit/build.js.  This will build the JS scripts and copy the relevant files.
cd ../../../
./js funcunit/build.js

#Note: Cleaning up folder so that hte new jar can be created
mv funcunit/java/selenium-server-standalone-2.0a5.jar funcunit/java/selenium-server-standalone-2.0a5.jar_old_bk

#Using a tool like 7-zip (for windows), zip up the java/selenium-server folder.  Copy the selenium-server.jar into the funcunit/java folder.
#Note: current script looks for selenium-server-standalone-2.0a5.jar will fail otherwise
cd funcunit/java
jar -cf selenium-server-standalone-2.0a5.jar selenium-server

#Run js funcunit/build.js again (to copy the jars).
cd ../../
./js funcunit/build.js

#That's it, funcunit/dist contains the same standalone funcunit placed into the standalone download.
