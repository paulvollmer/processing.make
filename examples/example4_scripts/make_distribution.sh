#!bin/bash

#
# Export Application (Linux, MacOSX, Windows) and zip Package.
#
# This file is part of the processing_makefile project
#

echo "Makefile export application"
make exportMac

echo "Zip exported application"
APP_NAME=$PWD
APP_VERSION=0.0.3

cd distribution/mac/
zip -r $APP_NAME"_"$APP_VERSION.zip $APP_NAME.app
cd ../../
