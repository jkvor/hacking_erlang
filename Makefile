all:
	erl -noshell -s init stop -eval 'leex:file("src/example_scanner.xrl")'
	erlc -o src src/example_parser.yrl
	erlc -o ebin src/*.erl