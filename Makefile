jshint_bin     = ./node_modules/jshint/bin/jshint
phantomjs_bin  = ./node_modules/mocha-phantomjs/bin/mocha-phantomjs
bower_bin      = ./node_modules/bower/bin/bower

bower_libs = components/ember/ember.js components/jquery/jquery.js components/handlebars/handlebars.js
npm_libs   = $(jshint_bin) $(phantomjs_bin) $(bower_bin)

all: test

test: jshint $(bower_libs)
	$(phantomjs_bin) spec/suite.html

jshint: $(jshint_bin)
	$(jshint_bin) index.js spec/*Spec.js

$(bower_libs):
	$(bower_bin) install

$(npm_libs):
	npm install

clobber:
	rm -rf ./node_modules/
	rm -rf ./components/

.PHONY: jshint test clobber
