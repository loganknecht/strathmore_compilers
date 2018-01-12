# Ocaml Idiosyncrasies
ocaml uses the `rec` keyword to indicate that a function is recursive

```ocaml
let rec factorial (n : int) : int =
  if n <= 1 then 1
  else n * (factorial (n - 1));;
```


# OUnit Documentation
- http://ounit.forge.ocamlcore.org/api-ounit/OUnit2.html#VAL(>::)
- http://ounit.forge.ocamlcore.org/api-ounit/OUnit2.html#VAL(>:::)


# Running the tests
```bash
// From the starter-lab0/ directory

make
./test
```


# Syntax
## The `>::` operator
From ounit

Per documentation
http://ounit.forge.ocamlcore.org/api-ounit/OUnit2.html#VAL(>::)

val (>::) : string -> test_fun -> test
    Create a TestLabel for a TestCase

## The `~` character 
used as a keyword "label" in ocaml to specify a variable as "named"

https://ocaml.org/learn/tutorials/labels.html#Labelled-and-optional-arguments-to-functions

This is essentially the same as a keyworkd parameter in python that allows the ability to specify default values.
Labeled variables can be supplied in any order.


# The `_` character
This is known as a wildcard character and is used for pattern matching in ocaml

https://caml.inria.fr/pub/docs/oreilly-book/html/book-ora016.html