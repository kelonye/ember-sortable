all: node_modules components build example/index.html

node_modules:
	@npm install

components:
	@component install --dev

lib:
	@mkdir -p lib

lib/index.js: src/index.coffee
	coffee -bcj $@ $<

lib/style.css: src/style.styl
	stylus --compress < $< > $@

build: lib lib/index.js lib/style.css
	@component build --dev

example/index.html: example/index.jade
	jade < $< > $@

clean:
	@rm -rf lib example/index.html build

.PHONY: clean