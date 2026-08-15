.PHONY: all

CSS_HASH := $(shell shasum -a 256 static/index.css | cut -c1-12)
JS_HASH := $(shell shasum -a 256 static/index.js | cut -c1-12)

all:
	sed -i '' -E \
		-e 's#index\.[^./]+\.css#index.$(CSS_HASH).css#g' \
		-e 's#index\.[^./]+\.js#index.$(JS_HASH).js#g' \
		static/index.html main.go
	GOEXPERIMENT=jsonv2 go build -o walksf .
