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

# Exiting the OCaml REPL
- To end interactive sessions
    - type ^D (Control D)
    - call the exit function of type int -> unit: 
        - `exit 0;;`

# Running the tests
```bash
// From the starter-lab0/ directory

make
./test
```

# How to import ocaml files into the REPL at the top level

```ocaml
(* From the `starter-lab0` directory type in `ocaml` to initiate the REPL *)

#use "functions.ml";;
```

https://stackoverflow.com/questions/14755664/how-can-i-load-a-ml-file-in-toplevel-of-ocaml-just-like-use-mine-sml-in-sml-n

# Syntax
## The `::` operator
This is cons equivalent

```
:: - adding an element at the beginning (list cons) (return the new list (no side-effect))
```

See the `Bags and Lists` section
http://rigaux.org/language-study/syntax-across-languages-per-language/OCaml.html

## The `->` operator
An anonymous function

```
fun a b -> ...
```

See the Functions section
http://rigaux.org/language-study/syntax-across-languages-per-language/OCaml.html

## The `>::` operator
From ounit

Per documentation
http://ounit.forge.ocamlcore.org/api-ounit/OUnit2.html#VAL(>::)

```
val (>::) : string -> test_fun -> test
    Create a TestLabel for a TestCase
```

## The `>:::` operator
From ounit

Per documentation
http://ounit.forge.ocamlcore.org/api-ounit/OUnit2.html#VAL(>:::)

```
val (>:::) : string -> test list -> test
    Create a TestLabel for a TestList
```

## The `~` character 
used as a keyword "label" in ocaml to specify a variable as "named"

https://ocaml.org/learn/tutorials/labels.html#Labelled-and-optional-arguments-to-functions

This is essentially the same as a keyworkd parameter in python that allows the ability to specify default values.
Labeled variables can be supplied in any order.


## The `_` character
This is known as a wildcard character and is used for pattern matching in ocaml

https://caml.inria.fr/pub/docs/oreilly-book/html/book-ora016.html

## The `~printer:string_of_int` argument

OUnit Documentation (See the `assert_equal`)
http://ounit.forge.ocamlcore.org/api-ounit-dev/OUnit2.html

```
val assert_equal : ?ctxt:test_ctxt ->
       ?cmp:('a -> 'a -> bool) ->
       ?printer:('a -> string) ->
       ?pp_diff:(Format.formatter -> 'a * 'a -> unit) ->
       ?msg:string -> 'a -> 'a -> unit
assert_equal expected real Compares two values, when they are not equal a failure is signaled.
Raises Failure signal a failure
ctxt : if provided, always print expected and real value
cmp : customize function to compare, default is =
printer : value printer, don't print value otherwise
pp_diff : if not equal, ask a custom display of the difference using diff fmt exp real where fmt is the formatter to use
msg : custom message to identify the failure
```

See the section "Labeled arguments"
https://caml.inria.fr/pub/docs/u3-ocaml/ocaml051.html

This is an argument for the `assert_equal` method from `o_unit`

## The `string_of_int` function

`string_of_int` is a function to convert an integer to string

See the section `String conversion functions`
https://caml.inria.fr/pub/docs/manual-ocaml/libref/Pervasives.html

```
val string_of_int : int -> string
Return the string representation of an integer, in decimal.
```

## The `match` keyword of Ocaml

See just the whole page
http://caml.inria.fr/pub/docs/oreilly-book/html/book-ora016.html

# The `^` character
The `^` character is for string concatenation

http://rigaux.org/language-study/syntax-across-languages-per-language/OCaml.html

# `records` in OCaml
This is a record/type declaration for OCaml

```
type btnode =
  | Leaf
  | Node of string * btnode * btnode
```

The `type` declaration and `Node of string * btnode * btnode`
This is the type declaration 

- Simple Explanation
    - https://ocaml.org/learn/tutorials/data_types_and_matching.html#Structures
- Complex Explanation
    - https://realworldocaml.org/v1/en/html/records.html

# Why is `Node` and `Leaf` declarable even if no data type was created???
Seriously, what the heck?