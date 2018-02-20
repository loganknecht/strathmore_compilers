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
let rec calculate_fibonacci (index : int) : int =
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
type binary_tree_node =
    Leaf
    | Node of string * binary_tree_node * binary_tree_node
;;

(* m1 is true *)
let m1 = 
    match Leaf with
        | Leaf -> true
        | Node(s, left, right) -> false
;;

(* m2 is 44 *)
let m2 = 
    match Leaf with
        | Leaf -> 44
        | Node(s, left, right) -> 99
;;

(* m3 is "a" *)
let m3 = 
    match Node("a", Leaf, Leaf) with
        | Leaf -> "z"
        | Node(s, left, right) -> s
;;

(* m4 is "b" *)
let m4 = 
    match Node("a", Node("b", Leaf, Leaf), Leaf) with
        | Leaf -> "z"
        | Node(s, left, right) ->
        match left with
            | Leaf -> "y"
            | Node(s2, left2, right2) -> s2
;;


let rec inorder_str (bt : binary_tree_node) : string =
    match bt with
        | Leaf -> ""
        | Node(s, left, right) -> (inorder_str left) ^ s ^ (inorder_str right)
        (* | Node(s, left, right) -> (inorder_str left) ^ s ^ ", " ^ (inorder_str right) *)
;;

(* -------------------------------------------------------------------------- *)
(* ------------------------------- Section 04 ------------------------------- *)
(* -------------------------------------------------------------------------- *)
(* 
Write a function size that takes a binary_tree_node and produces an integer that is the
number of Nodes in the tree.
*)
let rec get_binary_tree_node_count(input_binary_tree_node : binary_tree_node) : int = 
    match input_binary_tree_node with
        | Leaf -> 0
        | Node(value, left_node, right_node) -> 
            (1 + 
                (get_binary_tree_node_count left_node) + 
                (get_binary_tree_node_count right_node))
;;


(* Write a function height that takes a btnode and produces an integer that is
the height of the tree. *)
let rec get_binary_tree_height(input_binary_tree_node : binary_tree_node) : int = 
    match input_binary_tree_node with
        | Leaf -> 0
        | Node(value, left_node, right_node) -> 
            1 + (max 
                (get_binary_tree_height left_node)
                (get_binary_tree_height right_node))
;;

(* -------------------------------------------------------------------------- *)
(* TODO: Move these over to the tests section                                 *)
(* -------------------------------------------------------------------------- *)
let leaf_node_one = Node("one", Leaf, Leaf);;
let leaf_node_three = Node("three", Leaf, Leaf);;

(* Level 2 *)
let leaf_node_two = Node("two", leaf_node_one, leaf_node_three);;
let leaf_node_five = Node("five", Leaf, Leaf);;

(* Level 1 *)
let leaf_node_four = Node("four", leaf_node_two, leaf_node_five);;

let child_node = Node("child", Leaf, Leaf);;
let root_node = Node("root", leaf_node_four, child_node);;
(* -------------------------------------------------------------------------- *)
let example_node = Node("2", 
    Node("1", Leaf, Leaf), 
    Node("3", Leaf, Leaf))
;;