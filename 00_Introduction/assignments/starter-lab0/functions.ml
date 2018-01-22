open Printf

(* -------------------------------------------------------------------------- *)
(* Fibonacci substitution style *)
(* -------------------------------------------------------------------------- *)
let max (n : int) (m : int) : int =
    if n > m
    then n
    else m;;

(* -------------------------------------------------------------------------- *)
(* Fibonacci implementation *)
(* -------------------------------------------------------------------------- *)
(* let fibonacci_index = 0 *)
(* let fibonacci_index = 1 *)
(* let fibonacci_index = 2 *)
(* let fibonacci_index = 3 *)
(* let fibonacci_index = 4 *)
(* let fibonacci_index = 5 *)
(* let fibonacci_index = 6 *)
let fibonacci_index = 7

(* Fill in the functions you need to write here *)
let rec calculate_fibonacci (index : int): int =
    if index == 0 then 0
    else if index == 1 then 1
    else (calculate_fibonacci (index - 2)) + (calculate_fibonacci (index - 1));;

(* (printf "Fibonacci of %d is %d\n" fibonacci_index (calculate_fibonacci fibonacci_index)) *)


(* -------------------------------------------------------------------------- *)
(* Fibonacci substitution style *)
(* -------------------------------------------------------------------------- *)
(*
(calculate_fibonacci 3)
(calculate_fibonacci 3 - 2) + (calculate_fibonacci 3 - 1)

(calculate_fibonacci 2)
(calculate_fibonacci 2 - 2) + (calculate_fibonacci 2 - 1)
(calculate_fibonacci 1)
(calculate_fibonacci 1 - 2) + (calculate_fibonacci 1 - 1)
 *)

(* -------------------------------------------------------------------------- *)
(* ------------------------------- Section 03 ------------------------------- *)
(* -------------------------------------------------------------------------- *)
type btnode =
    Leaf
  | Node of string * btnode * btnode;;

let m1 = match Leaf with
  | Leaf -> true
  | Node(s, left, right) -> false;;
(* m1 is true *)

let m2 = match Leaf with
  | Leaf -> 44
  | Node(s, left, right) -> 99;;
(* m2 is 44 *)

let m3 = match Node("a", Leaf, Leaf) with
  | Leaf -> "z"
  | Node(s, left, right) -> s;;
(* m3 is "a" *)

let m4 = match Node("a", Node("b", Leaf, Leaf), Leaf) with
  | Leaf -> "z"
  | Node(s, left, right) ->
    match left with
      | Leaf -> "y"
      | Node(s2, left2, right2) -> s2;;
(* m4 is "b" *)


let rec inorder_str (bt : btnode) : string =
  match bt with
    | Leaf -> ""
    | Node(s, left, right) -> (inorder_str left) ^ s ^ (inorder_str right)
