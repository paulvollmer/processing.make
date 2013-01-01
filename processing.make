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
MAKEFILE_VERSION = "0.1.0"


.PHONY: build
build:
	processing-java --sketch=$(SKETCH_DIR) --output=$(OUTPUT_DIR) --run --force


.PHONY: clean
clean:
	rm -rf p5test/dist


.PHONY: help
help:
	@echo $(MAKEFILE_NAME)" v."$(MAKEFILE_VERSION)
	@echo "Usage:"
	@echo "    make                Same as 'make build'"
	@echo "    make build          Build the Processing application"
	@echo "    make clean          Delete the output directory"
	@echo "    make help           Show this help text"
	@echo "    make version        Get the Version of the "$(MAKEFILE_NAME)


.PHONY: version
version:
	@echo $(MAKEFILE_VERSION)
