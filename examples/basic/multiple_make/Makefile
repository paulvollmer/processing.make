#
# multiple_make example
#
#
# This file is part of the processing.make project.
#

build:
	@echo "-- BUILD BEGIN ------------------------"
	$(MAKE) -C sketch1 build
	$(MAKE) -C sketch2 build
	$(MAKE) -C sketch3 build
	$(MAKE) -C sketch4 build
	@echo "-- BUILD END --------------------------"

clean:
	@echo "-- CLEAN BEGIN ------------------------"
	$(MAKE) -C sketch1 clean
	$(MAKE) -C sketch2 clean
	$(MAKE) -C sketch3 clean
	$(MAKE) -C sketch4 clean
	@echo "-- CLEAN END --------------------------"

export:
	@echo "-- EXPORT BEGIN -----------------------"
	$(MAKE) -C sketch1 export
	$(MAKE) -C sketch2 export
	$(MAKE) -C sketch3 export
	$(MAKE) -C sketch4 export
	@echo "-- EXPORT END -------------------------"

help:
	@echo "Create a custom help message and usage text."
	@echo "Usage:"
	@echo "  build        Build all 4 sketches."
	@echo "  clean        Clean all."
	@echo "  export       Export all 4 sketches."
