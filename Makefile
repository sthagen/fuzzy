SHELL = /bin/bash

.DEFAULT_GOAL := all
isort = isort fuzzy test
black = black -S -l 120 --target-version py310 fuzzy test

.PHONY: install
install:
	pip install -U pip wheel
	pip install -r test/requirements.txt
	pip install -U .

.PHONY: install-all
install-all: install
	pip install -r test/requirements-dev.txt

.PHONY: format
format:
	$(isort)
	$(black)

.PHONY: init
init:
	pip install -r test/requirements.txt
	pip install -r test/requirements-dev.txt

.PHONY: lint
lint:
	python setup.py check -ms
	flake8 fuzzy/ test/
	$(isort) --check-only --df
	$(black) --check --diff

.PHONY: mypy
mypy:
	mypy fuzzy

.PHONY: test
test: clean
	pytest --asyncio-mode=strict --cov=fuzzy --cov-report term-missing:skip-covered --cov-branch --log-format="%(levelname)s %(message)s"

.PHONY: testcov
testcov: test
	@echo "building coverage html"
	@coverage html

.PHONY: all
all: lint mypy testcov

.PHONY: clean
clean:
	@rm -rf `find . -name __pycache__`
	@rm -f `find . -type f -name '*.py[co]' `
	@rm -f `find . -type f -name '*~' `
	@rm -f `find . -type f -name '.*~' `
	@rm -rf .cache build htmlcov *.egg-info
	@rm -f .coverage .coverage.* *.log .DS_Store
	python setup.py clean

.PHONY: name
name:
	@printf "Release '%s'\n\n" "$$(git-release-name "$$(git rev-parse HEAD)")"
	@printf "%s revision.is(): sha1:%s\n" "-" "$$(git rev-parse HEAD)"
	@printf "%s name.derive(): '%s'\n" "-" "$$(git-release-name "$$(git rev-parse HEAD)")"

.PHONY: dlstats
dlstats:
	pypistats python_minor --json --monthly $(package) > etc/monthly-downloads.json
	rq '$$.data..*.downloads' etc/monthly-downloads.json | paste -sd+ - | bc
	jq . etc/monthly-downloads.json > etc/tempaway && mv etc/tempaway etc/monthly-downloads.json

.PHONY: covstats
covstats:
	bin/gen_coverage.sh
