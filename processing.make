#
# processing.make is released under the MIT License.
#
# Copyright (c) 2012-2013, Paul Vollmer http://www.wrong-entertainment.com
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


MAKEFILE_NAME = "processing.make"
MAKEFILE_VERSION = "0.1.1"


# make shell executable
SHELL=/bin/sh



# Processing sketch and output default parameter
# -----------------------------------------------------------------------------

ifndef SKETCH_DIRECTORY
SKETCH_DIRECTORY = ${CURDIR}
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



define CLEAN_RULE
	@echo "Delete '${1}' directory"
	$(shell rm -rf ${1})
endef


define BUILD_RULE
	processing-java --sketch=$(SKETCH_DIRECTORY) --output=$(OUTPUT_DIRECTORY) --${1} --force
endef


define EXPORT_RULE
	processing-java \
	--sketch=$(SKETCH_DIRECTORY) \
	--output=$(SKETCH_DIRECTORY)/$(EXPORT_FOLDERNAME)/${1} \
	--export \
	--platform=${2} ${3} \
	--force
endef


# The build, run and present flags
# -----------------------------------------------------------------------------

.PHONY: build run present
run:
	$(call BUILD_RULE,run)
	
present:
	$(call BUILD_RULE,present)
	
build:
	$(call BUILD_RULE,build)
	

# The export flags
# Export sketch as Linux, Mac or Windows application
# -----------------------------------------------------------------------------

.PHONY: export
export: exportLinux exportMac exportWin

.PHONY: exportLinux exportLinux32 exportLinux64
exportLinux: exportLinux32 exportLinux64
exportLinux32:
	$(call EXPORT_RULE,$(EXPORT_LINUX32_FOLDERNAME),linux,--bits=32)
exportLinux64:
	$(call EXPORT_RULE,$(EXPORT_LINUX64_FOLDERNAME),linux,--bits=64)
	
.PHONY:  exportMac
exportMac:
	$(call EXPORT_RULE,$(EXPORT_MACOSX_FOLDERNAME),macosx)
	
.PHONY: exportWin exportWin32 exportWin64
exportWin: exportWin32 exportWin64
exportWin32:
	$(call EXPORT_RULE,$(EXPORT_WINDOWS32_FOLDERNAME),windows,--bits=32)
exportWin64:
	$(call EXPORT_RULE,$(EXPORT_WINDOWS64_FOLDERNAME),windows,--bits=64)


# The cleaning flags
# -----------------------------------------------------------------------------

.PHONY: clean cleanOutput cleanExport
clean:
	$(call CLEAN_RULE, $(OUTPUT_DIRECTORY))
	$(call CLEAN_RULE, $(SKETCH_DIRECTORY)/$(EXPORT_FOLDERNAME))

cleanOutput:
	$(call CLEAN_RULE, $(OUTPUT_DIRECTORY))

cleanExport:
	$(call CLEAN_RULE, $(SKETCH_DIRECTORY)/$(EXPORT_FOLDERNAME))


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
