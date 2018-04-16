all: run_tests

run_tests: test
	./test

test: linked_list.ml functions.ml test.ml
	ocamlfind ocamlc -o test \
					-package oUnit \
					-linkpkg -g functions.ml \
								linked_list.ml \
								test.ml