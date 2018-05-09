type ('k, 'v) avlnode =
  | Leaf
  | Node of int * 'k * 'v * ('k, 'v) avlnode * ('k, 'v) avlnode

let rec get (n : ('k, 'v) avlnode) (key : 'k) : 'v option =
  match n with
    | Leaf -> None
    | Node(_, k, v, left, right) ->
      if k = key then Some(v)
      else if key < k then (get left key)
      else (get right key)

(* A useful helper function (you may need to write more) *)
let balance (n : ('k, 'v) avlnode) : ('k, 'v) avlnode =
  Leaf

(* Produce a new avltree that contains the given key.  If the key already
   exists, update the value to the new value *)
let rec set (n : ('k, 'v) avlnode) (key : 'k) (value : 'v) : ('k, 'v) avlnode =
  Leaf

let height (n : ('k, 'v) avlnode) : int =
  0

(* Return a list of tuples containing the elements of the tree *)
let rec inorder (n : ('k, 'v) avlnode) : ('k * 'v) list =
  []



(* Write the functions below (contains, height, add_all, sum) without using
any recursion.  Use the functions above, and map/filter/fold if necessary, to
build up the behavior from existing functions. *)

let contains (n : ('k, 'v) avlnode) (key : 'k) : bool = 
  false

(* given an AVL tree and a list of key/value tuples, set all the given keys
(first pair components) to the corresponding value (second pair components) *)
let add_all (n : ('k, 'v) avlnode) (keys : ('k * 'v) list) : ('k, 'v) avlnode =
  Leaf

(* Return the total value of all the integers in a tree that has int values *)
let sum (n : ('k, int) avlnode) : int =
  0

