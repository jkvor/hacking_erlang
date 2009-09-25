all:
	erl -noshell -s init stop -eval 'leex:file("src/example_scanner.xrl")'
	erlc -o src src/example_parser.yrl
	erlc -o ebin src/*.erl
	
clean:
	rm -f src/example_parser.erl src/example_scanner.erl
	rm -f ebin/*