(* TODO: I don't understand what the first `int` is for??? *)
type ('key, 'value) avlnode =
    | Leaf
    | Node of int * 
              'key * 
              'value * 
              ('key, 'value) avlnode * 
              ('key, 'value) avlnode

let rec get (node_to_search : ('key, 'value) avlnode) 
            (key_to_search_for : 'key) 
    : 'value option =
        match node_to_search with
        | Leaf -> None
        | Node(_, node_key, node_value, node_left_child, node_right_child) ->
            if node_key = key_to_search_for 
                then Some(node_value)
            else if key_to_search_for < node_key 
                then (get node_left_child key_to_search_for)
            else (get node_right_child key_to_search_for)

(* A useful helper function (you may need to write more) *)
let balance (node : ('key, 'value) avlnode) 
    : ('key, 'value) avlnode =
        Leaf

(* Produce a new avltree that contains the given key.  If the key already
   exists, update the value to the new value *)
let rec set (node : ('key, 'value) avlnode) 
            (key : 'key) 
            (value : 'value) 
    : ('key, 'value) avlnode =
        Leaf

let height (node : ('key, 'value) avlnode) 
    : int =
        0

(* Return a list of tuples containing the elements of the tree *)
let rec inorder (node : ('key, 'value) avlnode) 
    : ('key * 'value) list =
        []



(* Write the functions below (contains, height, add_all, sum) without using
any recursion.  Use the functions above, and map/filter/fold if necessary, to
build up the behavior from existing functions. *)
(* ========================================================================== *)
let contains (node : ('key, 'value) avlnode) 
             (key : 'key) 
    : bool = 
        false

(* given an AVL tree and a list of key/value tuples, set all the given keys
(first pair components) to the corresponding value (second pair components) *)
let add_all (node : ('key, 'value) avlnode) 
            (keys : ('key * 'value) list) 
    : ('key, 'value) avlnode =
        Leaf

(* Return the total value of all the integers in a tree that has int values *)
let sum (node : ('key, int) avlnode)
    : int =
        0
