all: binding packages

.PHONY: binding
binding:
	gidgen --defs defs --gir-path gir --pkg-path . --subpkg-path packages

.PHONY: packages
packages:
	dub build --parallel --compiler=ldc2 --debug debug

.PHONY: clean
clean:
	dub clean
	find packages -name "*.d" -exec rm {} \;
	find . -name "*.so" -exec rm {} \;
