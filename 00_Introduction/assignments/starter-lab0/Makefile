all: run_tests


run_tests: test
	./test

test: functions.ml test.ml
	ocamlfind ocamlc -o test -package oUnit -linkpkg -g functions.ml test.ml