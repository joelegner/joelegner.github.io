.PHONY: serve
serve: index.html
	python3 -m http.server --bind 127.0.0.1
	open index.html

index.html: index.md
	pandoc --standalone index.md -o index.html
