all: binding packages

.PHONY: binding
binding:
	dub run gidgen --root=gidgen --compiler=ldc2 -- --defs defs --gir-path gir --pkg-path . --subpkg-path packages --report --report-file report.txt

.PHONY: packages
packages:
	dub build --parallel --compiler=ldc2 --debug debug

.PHONY: clean
clean:
	dub clean
	find packages -name "*.d" -exec rm {} \;
	find . -name "*.so" -o -name "*.a" -exec rm {} \;
