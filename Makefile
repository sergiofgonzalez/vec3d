
clean:
	rm -rf build/ dist/ *.egg-info/
.PHONY: clean

install-tooling:
	. .venv/bin/activate && \
	python -m pip install --upgrade setuptools wheel twine
.PHONY: install-tooling

package-lib: install-tooling clean
	. .venv/bin/activate && \
	python setup.py sdist bdist_wheel
.PHONY: package-lib

publish-testpypi: install-tooling clean package-lib
	. .venv/bin/activate && \
	python -m twine upload --repository testpypi dist/*
.PHONY: publish-testpypi

publish-pypi: install-tooling clean package-lib
	. .venv/bin/activate && \
	python -m twine upload dist/*
.PHONY: publish-pypi
