NOSE ?= nose2-3

.PHONY: usage
usage:
	@echo "Targets:"
	@echo "  usage       show this help"
	@echo "  test        run tests with default Python 3 interpreter"
	@echo "  test3X      run tests with Python 3.X (5<=X<=7)"
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
	$(NOSE) -C --coverage sk6502 --coverage-report term-missing
