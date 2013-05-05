#
# processing.make.extensions - template.make
#
# General information:
# This template can be used to create a new extension a bit faster.
#
# NAME, VERSION:
#    Set the name and version of the extension.
#    This parameter will be used at the help phony.
#
# include:
#    Include the extensions base Makefile. This file create
#    the help, version phony.
#
# TEMPLATE_HELP_RULE:
#    Documentation for the extension. Write a short description with
#    general informations and usage.
#
# PHONY:
#    Extension commands placed here.
#    If you use different kind of extensions it is nessesary to
#    create valid command names. If your extension use an
#    exiting name, you getting trouble with make. Because of this
#    don't create custom command names. use only the NAME parameter
#    to create phonys.
#
#
# This file is part of the processing.make project.
#


NAME=template
VERSION=0.0.2
include $(BASE_DIR)processing.make.extensions/processing.make.extensions

define TEMPLATE_HELP_RULE
	@echo "This is a simple template of a processing.make extension"
	@echo "It can be used to create faster new extensions."
	@echo ""
	@echo "Usage:"
	@echo "  template_script           Custom script space."
	@echo "  template_other_script     Other custom script."
	@echo "  novalid                   No valid command."
endef


#
# template dev specific description here.
#
.PHONY: $(NAME)_script $(NAME)_other_script novalid
$(NAME)_script:
	sh $(BASE_DIR)processing.make.extensions/template.sh

$(NAME)_other_script:
	@echo "An other make script space."

novalid:
	@echo "This command is not valid."
