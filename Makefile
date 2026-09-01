NOSE ?= nose2-3
COVERAGE ?= /usr/bin/python3-coverage

.PHONY: usage
usage:
	@echo "Targets:"
	@echo "  usage       show this help"
	@echo "  test        run tests with default Python 3 interpreter"
	@echo "  test3X      run tests with Python 3.X"
	@echo "  test-cover  run tests with coverage info"

.PHONY: test
test:
	$(NOSE)

.PHONY: nose3%
nose3%:
	$(HOME)/Python/Python3.$*/bin/nose2

.PHONY: test%
test%:
	$(MAKE) nose$*

.PHONY: test-cover
test-cover:
	$(COVERAGE) run -m nose2 -s tests
	$(COVERAGE) report -m
