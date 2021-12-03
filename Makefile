build:
	swift build --configuration release --disable-sandbox

install: build
	cp -f .build/release/publicist /usr/local/bin
