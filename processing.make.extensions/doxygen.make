#
# processing.make.extensions - doxygen.make
#
# This file is part of the processing.make project
# version 0.1.0
#


NAME=doxygen
VERSION=0.0.1
include $(BASE_DIR)processing.make.extensions/processing.make.extensions

define HELP_RULE
	@echo "This extension use doxygen to generate a documentation"
	@echo "of the sourcecode.""
	@echo ""
	@echo "Usage:"
	@echo "  doxygen                      Generate the docs"
endef


#
# template dev specific description here.
#
.PHONY: $(NAME)
$(NAME):
	@echo "Doxygen Begin"
	
	# Build the app and copy Doxyfile to source dir.
	make build
	cp Doxyfile build/source/Doxyfile

	# Go to Doxyfile
	cd build/source/
	# Run doxyden
	/Applications/Doxygen.app/Contents/Resources/doxygen Doxyfile

	@echo "Doxygen End"
