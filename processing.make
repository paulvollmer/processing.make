# processing_makefile is released under the MIT License.
#
# Copyright (c) 2012, Paul Vollmer http://www.wrong-entertainment.com
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.


MAKEFILE_NAME = "Processing Makefile"
MAKEFILE_VERSION = "0.0.2b"



# Processing sourche and output default parameter
# -----------------------------------------------------------------------------

#ifndef SKETCH_DIRECTORY
#SKETCH_DIRECTORY = $(shell $(dirname $0))
#echo $(error "You need to set the the Processing sketch directory")
#endif

ifdef SKETCH_DIRECTORY
ifndef OUTPUT_DIRECTORY
OUTPUT_DIRECTORY = $(SKETCH_DIRECTORY)/build
endif
endif



# Processing export application default directory names
# -----------------------------------------------------------------------------

ifndef EXPORT_DIRECTORY
EXPORT_DIRECTORY = export
endif

ifndef EXPORT_LINUX32_DIRECTORY
EXPORT_LINUX32_DIRECTORY = application.linux32
endif

ifndef EXPORT_LINUX64_DIRECTORY
EXPORT_LINUX64_DIRECTORY = application.linux64
endif

ifndef EXPORT_MACOSX_DIRECTORY
EXPORT_MACOSX_DIRECTORY = application.macosx
endif

ifndef EXPORT_WINDOWS32_DIRECTORY
EXPORT_WINDOWS32_DIRECTORY = application.windows32
endif

ifndef EXPORT_WINDOWS64_DIRECTROY
EXPORT_WINDOWS64_DIRECTROY = application.windows64
endif


# Export sketch as Linux, Mac or Windows application
# -----------------------------------------------------------------------------

applicationLinux32:= \
	processing-java \
	--sketch=$(SKETCH_DIRECTORY) \
	--output=$(SKETCH_DIRECTORY)/$(EXPORT_DIRECTORY)/$(EXPORT_LINUX32_DIRECTORY) \
	--export \
	--platform=linux \
	--bits=32 \
	--force

applicationLinux64:= \
	processing-java \
	--sketch=$(SKETCH_DIRECTORY) \
	--output=$(SKETCH_DIRECTORY)/$(EXPORT_DIRECTORY)/$(EXPORT_LINUX64_DIRECTORY) \
	--export \
	--platform=linux \
	--bits=64 \
	--force

applicationMac:= \
	processing-java \
	--sketch=$(SKETCH_DIRECTORY) \
	--output=$(SKETCH_DIRECTORY)/$(EXPORT_DIRECTORY)/$(EXPORT_MACOSX_DIRECTORY) \
	--export \
	--platform=macosx \
	--force

applicationWin32:= \
	processing-java \
	--sketch=$(SKETCH_DIRECTORY) \
	--output=$(SKETCH_DIRECTORY)/$(EXPORT_DIRECTORY)/$(EXPORT_WINDOWS32_DIRECTORY) \
	--export \
	--platform=windows \
	--bits=32 \
	--force

applicationWin64:= \
	processing-java \
	--sketch=$(SKETCH_DIRECTORY) \
	--output=$(SKETCH_DIRECTORY)/$(EXPORT_DIRECTORY)/$(EXPORT_WINDOWS64_DIRECTROY) \
	--export \
	--platform=windows \
	--bits=64 \
	--force




# The build, run and present flags
# -----------------------------------------------------------------------------

.PHONY: build run present
run:
	processing-java --sketch=$(SKETCH_DIRECTORY) --output=$(OUTPUT_DIRECTORY) --run --force

present:
	processing-java --sketch=$(SKETCH_DIRECTORY) --output=$(OUTPUT_DIRECTORY) --present --force

build:
	processing-java --sketch=$(SKETCH_DIRECTORY) --output=$(OUTPUT_DIRECTORY) --build --force


# The export flags
# -----------------------------------------------------------------------------

.PHONY: export
export:
	$(applicationLinux32)
	$(applicationLinux64)
	$(applicationMac)
	$(applicationWin32)
	$(applicationWin64)

.PHONY: exportLinux exportLinux32 exportLinux64
exportLinux:
	$(applicationLinux32)
	$(applicationLinux64)
exportLinux32:
	$(applicationLinux32)
exportLinux64:
	$(applicationLinux64)

.PHONY:  exportMac
exportMac:
	$(applicationMac)

.PHONY: exportWin exportWin32 exportWin64
exportWin:
	$(applicationWin32)
	$(applicationWin64)
exportWin32:
	$(applicationWin32)
exportWin64:
	$(applicationWin64)


# The cleaning flags
# -----------------------------------------------------------------------------

.PHONY: clean cleanOutput cleanExport
clean:
	@echo "Delete '$(OUTPUT_DIRECTORY)' and '$(EXPORT_DIRECTORY)' directory"
	$(shell rm -rf $(OUTPUT_DIRECTORY))
	$(shell rm -rf $(EXPORT_DIRECTORY))

cleanOutput:
	@echo "Delete '$(OUTPUT_DIRECTORY)' directory"
	$(shell rm -rf $(OUTPUT_DIRECTORY))

cleanExport:
	@echo "Delete '$(EXPORT_DIRECTORY)' directory"
	$(shell rm -rf $(EXPORT_DIRECTORY))



# The help and version flags
# -----------------------------------------------------------------------------

.PHONY: help version
help:
	@echo $(MAKEFILE_NAME)" v."$(MAKEFILE_VERSION)
	@echo ""
	@echo "Usage:"
	@echo "    make                   Same as 'make run' command."
	@echo ""
	@echo "    make run               Preprocess, compile, and run a sketch."
	@echo "    make present           Preprocess, compile, and run a sketch full screen."
	@echo ""
	@echo "    make build             Preprocess and compile a sketch into .class files."
	@echo ""
	@echo "    make export            Export as Linux, MacOS and Windows application."
	@echo "    make exportLinux       Export as Linux application."
	@echo "    make exportLinux32     Export as Linux 32-bit application."
	@echo "    make exportLinux32     Export as Linux 64-bit application."
	@echo "    make exportMac         Export as MacOS application."
	@echo "    make exportWin         Export as Windows application."
	@echo "    make exportWin32       Export as Windows 32-bit application."
	@echo "    make exportWin64       Export as Windows 64-bit application."
	@echo ""
	@echo "    make clean             Remove the output and export directory."
	@echo "    make cleanOutput       Remove the output directory."
	@echo "    make cleanExport       Remove the export directory."
	@echo ""
	@echo "    make help              Show this help text."
	@echo "    make version           Get the Version of the $(MAKEFILE_NAME)."

version:
	@echo $(MAKEFILE_VERSION)
