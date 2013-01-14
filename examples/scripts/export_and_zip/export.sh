#!bin/bash

#
# Export Application (Linux, MacOSX, Windows) and zip Package.
#
# This file is part of the processing_makefile project
#

APP_NAME=example4_scripts
APP_VERSION=0.0.3


make exportMac

cd distribution/mac/
zip -r $APP_NAME"_"$APP_VERSION.zip $APP_NAME.app
cd ../../
