#
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
#


MAKEFILE_NAME = "Processing Makefile"
MAKEFILE_VERSION = "0.0.2b"



# Processing sketch and output default parameter
# -----------------------------------------------------------------------------

ifndef SKETCH_DIRECTORY
SKETCH_DIRECTORY = $(PWD)
endif

ifndef OUTPUT_FOLDERNAME
OUTPUT_FOLDERNAME = build
endif

ifndef OUTPUT_DIRECTORY
OUTPUT_DIRECTORY = $(SKETCH_DIRECTORY)/$(OUTPUT_FOLDERNAME)
endif



# Processing export application default folder names
# -----------------------------------------------------------------------------

ifndef EXPORT_FOLDERNAME
EXPORT_FOLDERNAME = export
endif

ifndef EXPORT_LINUX_FOLDERNAME
EXPORT_LINUX_FOLDERNAME = application.linux
endif
ifndef EXPORT_LINUX32_FOLDERNAME
EXPORT_LINUX32_FOLDERNAME = $(EXPORT_LINUX_FOLDERNAME)32
endif
ifndef EXPORT_LINUX64_FOLDERNAME
EXPORT_LINUX64_FOLDERNAME = $(EXPORT_LINUX_FOLDERNAME)64
endif

ifndef EXPORT_MACOSX_FOLDERNAME
EXPORT_MACOSX_FOLDERNAME = application.macosx
endif

ifndef EXPORT_WINDOWS_FOLDERNAME
EXPORT_WINDOWS_FOLDERNAME = windows
endif
ifndef EXPORT_WINDOWS32_FOLDERNAME
EXPORT_WINDOWS32_FOLDERNAME = $(EXPORT_WINDOWS_FOLDERNAME)32
endif
ifndef EXPORT_WINDOWS64_FOLDERNAME
EXPORT_WINDOWS64_FOLDERNAME = $(EXPORT_WINDOWS_FOLDERNAME)64
endif


# Export sketch as Linux, Mac or Windows application
# -----------------------------------------------------------------------------

applicationLinux32:= \
	processing-java \
	--sketch=$(SKETCH_DIRECTORY) \
	--output=$(SKETCH_DIRECTORY)/$(EXPORT_FOLDERNAME)/$(EXPORT_LINUX32_FOLDERNAME) \
	--export \
	--platform=linux \
	--bits=32 \
	--force

applicationLinux64:= \
	processing-java \
	--sketch=$(SKETCH_DIRECTORY) \
	--output=$(SKETCH_DIRECTORY)/$(EXPORT_FOLDERNAME)/$(EXPORT_LINUX64_FOLDERNAME) \
	--export \
	--platform=linux \
	--bits=64 \
	--force

applicationMac:= \
	processing-java \
	--sketch=$(SKETCH_DIRECTORY) \
	--output=$(SKETCH_DIRECTORY)/$(EXPORT_FOLDERNAME)/$(EXPORT_MACOSX_FOLDERNAME) \
	--export \
	--platform=macosx \
	--force

applicationWin32:= \
	processing-java \
	--sketch=$(SKETCH_DIRECTORY) \
	--output=$(SKETCH_DIRECTORY)/$(EXPORT_FOLDERNAME)/$(EXPORT_WINDOWS32_FOLDERNAME) \
	--export \
	--platform=windows \
	--bits=32 \
	--force

applicationWin64:= \
	processing-java \
	--sketch=$(SKETCH_DIRECTORY) \
	--output=$(SKETCH_DIRECTORY)/$(EXPORT_FOLDERNAME)/$(EXPORT_WINDOWS64_FOLDERNAME) \
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
	@echo "Delete '$(OUTPUT_DIRECTORY)' and '$(EXPORT_FOLDERNAME)' directory"
	$(shell rm -rf $(OUTPUT_DIRECTORY))
	$(shell rm -rf $(SKETCH_DIRECTORY)/$(EXPORT_FOLDERNAME))

cleanOutput:
	@echo "Delete '$(OUTPUT_DIRECTORY)' directory"
	$(shell rm -rf $(OUTPUT_DIRECTORY))

cleanExport:
	@echo "Delete '$(EXPORT_FOLDERNAME)' directory"
	$(shell rm -rf $(SKETCH_DIRECTORY)/$(EXPORT_FOLDERNAME))



# The help and version flags
# -----------------------------------------------------------------------------

.PHONY: help version
help:
	@echo $(MAKEFILE_NAME)" v."$(MAKEFILE_VERSION)
	@echo ""
	@echo "Usage:"
	@echo "    make                   Same as 'make run' command."
	@echo "    make run               Preprocess, compile, and run a sketch."
	@echo "    make present           Preprocess, compile, and run a sketch full screen."
	@echo "    make build             Preprocess and compile a sketch into .class files."
	@echo "    make export            Export as Linux, MacOS and Windows application."
	@echo "    make exportLinux       Export as Linux application."
	@echo "    make exportLinux32     Export as Linux 32-bit application."
	@echo "    make exportLinux32     Export as Linux 64-bit application."
	@echo "    make exportMac         Export as MacOS application."
	@echo "    make exportWin         Export as Windows application."
	@echo "    make exportWin32       Export as Windows 32-bit application."
	@echo "    make exportWin64       Export as Windows 64-bit application."
	@echo "    make clean             Remove the output and export directory."
	@echo "    make cleanOutput       Remove the output directory."
	@echo "    make cleanExport       Remove the export directory."
	@echo "    make help              Show this help text."
	@echo "    make version           Get the Version of the $(MAKEFILE_NAME)."
	@echo ""
	@echo "Current Parameter:"
	@echo "    SKETCH_DIRECTORY              = $(SKETCH_DIRECTORY)"
	@echo "    OUTPUT_FOLDERNAME             = $(OUTPUT_FOLDERNAME)"
	@echo "    OUTPUT_DIRECTORY              = $(OUTPUT_DIRECTORY)"
	@echo "    EXPORT_FOLDERNAME             = $(EXPORT_FOLDERNAME)"
	@echo "    EXPORT_LINUX32_FOLDERNAME     = $(EXPORT_LINUX32_FOLDERNAME)"
	@echo "    EXPORT_LINUX64_FOLDERNAME     = $(EXPORT_LINUX64_FOLDERNAME)"
	@echo "    EXPORT_MACOSX_FOLDERNAME      = $(EXPORT_MACOSX_FOLDERNAME)"
	@echo "    EXPORT_WINDOWS32_FOLDERNAME   = $(EXPORT_WINDOWS32_FOLDERNAME)"
	@echo "    EXPORT_WINDOWS64_FOLDERNAME   = $(EXPORT_WINDOWS64_FOLDERNAME)"

version:
	@echo $(MAKEFILE_VERSION)
