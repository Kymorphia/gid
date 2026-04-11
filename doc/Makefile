# Older versions of API packages and dependencies (gtk3, gtksource4, and vte2)
OLD_PACKAGES = \
  atk1 \
	cairo1 \
	freetype2 \
	gdk3 \
	gdkpixbuf2 \
	gio2 \
	glib2 \
	gmodule2 \
	gtk3 \
	gtksource4 \
	harfbuzz0 \
	pango1 \
	vte2 \
	xlib2

# adrdox does not work correctly with ldc2, force gdc

.PHONY: all
all: docs-new docs-old

# Old and new versions of applications cannot coexist in same adrdox output (gtk4 vs gtk3 for example)
.PHONY: docs-new
docs-new:
	rm -rf api doc_packages
	mkdir doc_packages
	find ../packages/ -maxdepth 1 -type d \
		\! -name packages \! -name gtk3 \! -name gdk3 \! -name gtksource4 \! -name vte2 \
		| xargs -i cp -r {} doc_packages/

	dub run adrdox --compiler=gdc -- doc_packages -o api --genSearchIndex
	cp style.css search-docs.js api

.PHONY: docs-old
docs-old:
	rm -rf api-old doc_packages-old
	mkdir doc_packages-old
	cd ../packages/ && cp -r $(OLD_PACKAGES) ../doc/doc_packages-old/

	dub run adrdox --compiler=gdc -- doc_packages-old -o api-old --genSearchIndex
	cp style.css search-docs.js api-old
