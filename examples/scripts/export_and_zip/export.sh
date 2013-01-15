#!bin/bash

#
# Export Application (Linux, MacOSX, Windows) and zip Package.
#
# This file is part of the processing_makefile project
#

APP_NAME=export_and_zip
APP_VERSION=0.0.1


make exportMac

cd distribution/mac/
zip -r $APP_NAME"_"$APP_VERSION.zip $APP_NAME.app
cd ../../
