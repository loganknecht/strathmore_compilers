# Assignment Link
https://www.cs.swarthmore.edu/~jpolitz/cs75/s16/n_ocaml-intermediate.html

# Assignment
## OCaml Programming
This assignment reinforces your OCaml programming skills, and introduces a few new OCaml features. Much of it you can do without any new OCaml knowledge, but there are a few useful details that remain. Once complete, you’ll be proficient with the features of OCaml you need for this course, and have significant practice with them.

### 1 Tuples and option
### 2 Tuples
There are many times in programs where we wish to return more than one value. For example, when returning a pair of key and value from a hash-table data structure, when returning an average and its standard deviation, or when representing a two (or three)-dimensional point, to name a few.

OCaml has a built-in way of handling these cases called tuples. To create a tuple, we enclose two or more values in parentheses:

```ocaml
let tup = (1, "a", []);;
```

To access the values in a tuple, we can use a special kind of let binding, where we give names to the positions of a tuple value:

```ocaml
let tup = (1, "a", []);;

let (one, a, empty_list) = tup;

(*

  one is 1

  a is "a"

  empty_list is []

*)
```

Since pairs—tuples of exactly two elements—are quite common, there are also two built-in functions, fst and snd, that get the first and second component of a two-element tuple, respectively.

The type of a tuple is written with * characters separating the components’ types, and surrounded by parentheses.

```ocaml
let increment_snd (t : (string * int)) : (string * int) =
  (fst t, 1 + (snd t));;

(increment_snd ("a", 5)) (* returns the pair ("a", 6) *)
```

In this assigment, you will use tuples to represent key/value pairs from a dictionary datatype (AVL trees), when returning the results of e.g. a traversal over the tree.

### 3 The option Type
A common way of handling failure that we’ve already seen is raising exceptions with failwith. This works well when an operation is truly nonsensical. However, it forces programs to use a different class of features— exceptions and exception handlers—to handle failing behaviors. Sometimes, the failure of an operation is a reasonable outcome, and having a way to report a failure, or the absence of an answer, with a normal value rather than an exception is quite useful.

Consider the problem of finding and returning the first element in a list that matches a particular predicate:

```ocaml
let rec find (l : 'a list) (pred : 'a -> bool) : 'a =
  match l with
    | [] -> failwith "Not found"
    | x::xs -> if pred x then x else find xs pred;;

(find [1;2;3] (fun n -> n > 4);; (* raises an error *)
(find [1;2;3] (fun n -> n > 2);; (* returns 3 *)
```

When the element isn’t found, we cannot return a value of type ’a, because the algorithm hasn’t found one. It seems we have to throw an error, as there is nothing left for us to do. This certainly limits the utility of find, which now needs a companion contains if is to be useful on lists that aren’t already known to have a matching element.

It would be convenient if we had a value that represented that there is no appropriate value to return in the empty case. Similarly, it would be useful to have the counterpart, a representation of being able to provide some appropriate value. OCaml provides just such a datatype, called option, which is built-in. If we wrote the definition ourselves, it would look like:

```ocaml
type 'a option =
  | None
  | Some of 'a
```

That is, an option is either None, which we can use to indicate failure or the lack of an appropriate value, or Some, which contains a single field that is a value of the option’s type. To write find using option, we would write:

```ocaml
let rec find2 (l : 'a list) (pred : 'a -> bool) : 'a option =
  match l with
    | [] -> None
    | x::xs -> if pred x then Some(x) else find xs pred;;

(find [1;2;3] (fun n -> n > 4);; (* returns None *)
(find [1;2;3] (fun n -> n > 2);; (* returns Some(3) *)
```

Now a program that calls find, rather than using an exception handler to manage the not found case, can simply match on the option that is returned to decide what to do.

Note that options aren’t always better than exceptions, as sometimes it’s difficult for the caller to know what to do when None is returned. But in many cases, when "failure" is something that the caller can reasonably react to, returning an option is a much more natural choice.

In this assignment, get on avlnode is provided, and returns an option of the value type. You may need to use matching on the option values returned from get in other places within the assignment.

### 4 The Assignment
You’ve been provided a lab1 skeleton in your Github repository to start from. It contains three OCaml files:

avl.ml – This file contains the skeleton of an implementation of AVL trees, which you should know well. You will fill in all the missing implementations to produce an AVL tree in the persistent style we’ve seen so far. By persistent style, I mean that set should produce a new avlnode that shares as much as possible with the input node.

There are several functions at the bottom of this file that have specific restrictions; these are included to give you practice with functions like filter and fold that you learned about in class.

One note on syntax: the avlnode type has two type variables, one for the key and one for the value. The syntax (’k, ’v) avlnode is how OCaml writes parametric types with multiple type variables: with the types in parentheses, separated by commas. So something like (string, int) avlnode is analogous to BSTNode<string, int> in C++, where you’ve likely seen a similar structure.

expr.ml – This file contains a datatype that represents algebra expressions, and two functions that you should write dealing with evaluating and printing them. One of these uses avlnodes as input, and the other can be done on its own.

test.ml – This file contains the tests for both expr.ml and avl.ml. You should test all of the functions you write well enough that you’re convinced they are correct.

This lab is to be done solo (no partners yet), and is due at 11:59pm on February 1.