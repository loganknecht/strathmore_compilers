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
