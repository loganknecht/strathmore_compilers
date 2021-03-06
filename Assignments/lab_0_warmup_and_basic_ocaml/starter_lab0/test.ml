open Functions
open Linked_list
open OUnit2

(* This file contains some example tests.  Feel free to delete and reorganize
the unnecessary parts of this file; it is provided to match up with the given
writeup initially. *)

let check_fun _ = (* a function of one argument containing a successful test *)
    assert_equal (2 + 2) 4;;

let check_fun2 _ = (* a failing test *)
    assert_equal (2 + 2) 5;;

(* a helper for testing integers *)
let t_int name value expected = name>::
    (fun _ -> assert_equal expected value ~printer:string_of_int);;

(* a helper for testing strings *)
let t_string name value expected = name>::
    (fun _ -> assert_equal expected value);;

(* -------------------------------------------------------------------------- *)
(* Labeled functions without abstraction *)
(* -------------------------------------------------------------------------- *)
let my_first_test = "my_first_test">::check_fun;;
let my_second_test = "my_second_test">::check_fun2;;
(* -------------------------------------------------------------------------- *)
(* Labeled functions with t_int abstraction *)
(* -------------------------------------------------------------------------- *)
let my_third_test = t_int "my_third_test" (2 + 2) 7;;
let my_fourth_test = t_int "my_fourth_test" (2 + 2) 4;;

(* -------------------------------------------------------------------------- *)
(* max function tests *)
(* -------------------------------------------------------------------------- *)
let max_test_zero_and_one = t_int "max_test_zero_and_one" (max 0 1) 1;;
let max_test_ten_and_one_thousand = t_int "max_test_ten_and_one_thousand" (max 10 1000) 1000;;
let max_test_negative_one_and_one = t_int "max_test_negative_one_and_one" (max ~-1 1) 1;;
let max_test_negative_ten_and_negative_one = t_int "max_test_negative_ten_and_negative_one" (max ~-10 ~-1) ~-1;;

(* -------------------------------------------------------------------------- *)
(* fibonacci tests *)
(* -------------------------------------------------------------------------- *)
let fibonacci_test_zero = t_int "fibonacci_test_zero" (calculate_fibonacci 0) 0;;
let fibonacci_test_one = t_int "fibonacci_test_one" (calculate_fibonacci 1) 1;;
let fibonacci_test_two = t_int "fibonacci_test_two" (calculate_fibonacci 2) 1;;
let fibonacci_test_three = t_int "fibonacci_test_three" (calculate_fibonacci 3) 2;;
let fibonacci_test_four = t_int "fibonacci_test_four" (calculate_fibonacci 4) 3;;
let fibonacci_test_five = t_int "fibonacci_test_five" (calculate_fibonacci 5) 5;;
let fibonacci_test_six = t_int "fibonacci_test_six" (calculate_fibonacci 6) 8;;
let fibonacci_test_seven = t_int "fibonacci_test_seven" (calculate_fibonacci 7) 13;;
let fibonacci_test_eight = t_string "fibonacci_test_eight" (calculate_fibonacci 8) 21;;


(* -------------------------------------------------------------------------- *)
(* inorder_str tests *)
(* -------------------------------------------------------------------------- *)

(* -------------------------------------------------------------------------- *)
(*  In-order traversal = 1,2,3,4,5                                            *)
(*                   4                                                        *)
(*                /     \                                                     *)
(*               2       5                                                    *)
(*            /     \                                                         *)
(*           1       3                                                        *)
(* -------------------------------------------------------------------------- *)
(* Level 3 *)
let leaf_node_one = Node("one", Leaf, Leaf);;
let leaf_node_three = Node("three", Leaf, Leaf);;

(* Level 2 *)
let leaf_node_two = Node("two", leaf_node_one, leaf_node_three);;
let leaf_node_five = Node("five", Leaf, Leaf);;

(* Level 1 *)
let leaf_node_four = Node("four", leaf_node_two, leaf_node_five);;

let child_node = Node("child", Leaf, Leaf);;
let root_node = Node("root", child_node, child_node);;

let inorder_str_test_well_formed_complete_binary_tree = 
    (t_string 
        "inorder_str_test_well_formed_complete_binary_tree" 
        (inorder_str leaf_node_four) 
        "onetwothreefourfive");;
let inorder_str_test_well_formed_full_binary_tree = 
    (t_string 
        "inorder_str_test_well_formed_full_binary_tree" 
        (inorder_str leaf_node_two) 
        "onetwothree");;
let inorder_str_test_node_with_only_leaf_nodes = 
    (t_string 
        "inorder_str_test_node_with_only_leaf_nodes" 
        (inorder_str leaf_node_one) 
        "one");;
let inorder_str_test_leaf_node_no_children = 
    (t_string 
        "inorder_str_test_leaf_node_no_children" 
        (inorder_str Leaf) 
        "");;
let inorder_str_test_node_with_children_pointing_to_same_node = 
    (t_string 
        "inorder_str_test_node_with_children_pointing_to_same_node" 
        (inorder_str root_node) 
        "childrootchild");;

(* -------------------------------------------------------------------------- *)
(* get_binary_tree_height tests *)
(* -------------------------------------------------------------------------- *)
let get_binary_tree_height_test_node_with_only_leaf_nodes = 
    (t_int
        "get_binary_tree_height_test_node_with_only_leaf_nodes" 
        (get_binary_tree_height leaf_node_one) 
        1);;

let get_binary_tree_height_test_well_formed_full_binary_tree = 
    (t_int
        "get_binary_tree_height_test_well_formed_full_binary_tree" 
        (get_binary_tree_height leaf_node_two)
        2);;

let get_binary_tree_height_test_well_formed_complete_binary_tree = 
    (t_int
        "get_binary_tree_height_test_well_formed_complete_binary_tree" 
        (get_binary_tree_height leaf_node_four)
        3);;

(* -------------------------------------------------------------------------- *)
(* get_binary_tree_node_count tests *)
(* -------------------------------------------------------------------------- *)
let get_binary_tree_node_count_test_node_with_only_leaf_nodes = 
    (t_int
        "get_binary_tree_node_count_test_node_with_only_leaf_nodes" 
        (get_binary_tree_node_count leaf_node_one) 
        1);;

let get_binary_tree_node_count_test_well_formed_full_binary_tree = 
    (t_int
        "get_binary_tree_node_count_test_well_formed_full_binary_tree" 
        (get_binary_tree_node_count leaf_node_two)
        3);;

let get_binary_tree_node_count_test_well_formed_complete_binary_tree = 
    (t_int
        "get_binary_tree_node_count_test_well_formed_complete_binary_tree" 
        (get_binary_tree_node_count leaf_node_four)
        5);;

(* ========================================================================== *)
(* Linked List tests                                                          *)
(* ========================================================================== *)
(* -------------------------------------------------------------------------- *)
(* increment_all tests                                                        *)
(* -------------------------------------------------------------------------- *)
let increment_all_empty_list =
    (t_string
        "increment_all_empty_list"
        (increment_all [])
        []);;

let increment_all_single_element_list =
    (t_string
        "increment_all_empty_list"
        (increment_all [0])
        [1]);;

let increment_all_many_element_list =
    (t_string
        "increment_all_many_element_list"
        (increment_all [0;1;2])
        [1;2;3]);;

let increment_all_negative_elements =
    (t_string
        "increment_all_many_element_list"
        (increment_all [-1;0;1])
        [0;1;2]);;

(* -------------------------------------------------------------------------- *)
(* long_strings tests                                                         *)
(* -------------------------------------------------------------------------- *)
let long_strings_empty_list =
    (t_string
        "long_strings_empty_list"
        (long_strings [] 0)
        []);;

let long_strings_zero_length_strings =
    (t_string
        "long_strings_zero_length_strings"
        (long_strings ["one";"two";"three"] 0)
        ["one";"two";"three"]);;

let long_strings_three_length_strings =
    (t_string
        "long_strings_zero_length_strings"
        (long_strings ["one";"two";"three"] 3)
        ["three"]);;

let long_strings_five_length_strings =
    (t_string
        "long_strings_zero_length_strings"
        (long_strings ["one";"two";"three"] 5)
        []);;

(* -------------------------------------------------------------------------- *)
(* every_other tests                                                          *)
(* -------------------------------------------------------------------------- *)
let every_other_empty_list =
    (t_string
        "every_other_empty_list"
        (every_other [])
        []);;

let every_other_single_element =
    (t_string
        "every_other_single_element"
        (every_other ["one"])
        ["one"]);;

let every_other_two_elements =
    (t_string
        "every_other_two_elements"
        (every_other ["one";"two"])
        ["one"]);;

let every_other_three_elements =
    (t_string
        "every_other_three_elements"
        (every_other [1;2;3])
        [1;3]);;

(* -------------------------------------------------------------------------- *)
(* sum_all tests                                                              *)
(* -------------------------------------------------------------------------- *)
let sum_all_empty_list =
    (t_string
        "sum_all_empty_list"
        (sum_all [])
        []);;

let sum_all_one_list_of_one_empty_list =
    (t_string
        "sum_all_one_list_of_one_empty_list"
        (sum_all [[]])
        [0]);;

let sum_all_three_lists_of_empty_list_each =
    (t_string
        "sum_all_three_lists_of_empty_list_each"
        (sum_all [[];[];[]])
        [0;0;0]);;

let sum_all_one_list_of_one_element_each =
    (t_string
        "sum_all_one_list_of_one_element_each"
        (sum_all [[1]])
        [1]);;

let sum_all_one_list_of_two_elements =
    (t_string
        "sum_all_one_list_of_two_elements"
        (sum_all [[1;2]])
        [3]);;

let sum_all_one_list_of_three_elements =
    (t_string
        "sum_all_one_list_of_three_elements"
        (sum_all [[1;2;3]])
        [6]);;

let sum_all_two_lists_of_one_element_each =
    (t_string
        "sum_all_two_lists_of_one_element_each"
        (sum_all [[1];[1]])
        [1;1]);;

let sum_all_two_lists_of_two_elements_each =
    (t_string
        "sum_all_two_lists_of_two_elements_each"
        (sum_all [[1;2];[3;4]])
        [3;7]);;

let sum_all_three_lists_of_three_elements_each =
    (t_string
        "sum_all_three_lists_of_three_elements_each"
        (sum_all [[1;2;3];[4;5;6];[7;8;9]])
        [6;15;24]);;

(* -------------------------------------------------------------------------- *)
(* Test suite creation *)
(* -------------------------------------------------------------------------- *)
let full_suite = "suite">:::[
    my_first_test;
    (* my_second_test; *) (* This is supposed to intentionally fail *)
    (* my_third_test; *)  (* This is supposed to intentionally fail *)
    my_fourth_test;
    (* ---------- max testing ---------- *)
    max_test_zero_and_one;
    max_test_ten_and_one_thousand;
    max_test_negative_one_and_one;
    max_test_negative_ten_and_negative_one;
    (* ---------- fibonacci testing ---------- *)
    fibonacci_test_zero;
    fibonacci_test_one;
    fibonacci_test_two;
    fibonacci_test_three;
    fibonacci_test_four;
    fibonacci_test_five;
    fibonacci_test_six;
    fibonacci_test_seven;
    fibonacci_test_eight;
    (* ---------- inorder_str testing ---------- *)
    inorder_str_test_well_formed_complete_binary_tree;
    inorder_str_test_well_formed_full_binary_tree;
    inorder_str_test_node_with_only_leaf_nodes;
    inorder_str_test_leaf_node_no_children;
    inorder_str_test_node_with_children_pointing_to_same_node;
    (* ---------- get_binary_tree_height testing ---------- *)
    get_binary_tree_height_test_node_with_only_leaf_nodes;
    get_binary_tree_height_test_well_formed_complete_binary_tree;
    get_binary_tree_height_test_well_formed_full_binary_tree;
    (* ---------- get_binary_tree_count testing ---------- *)
    get_binary_tree_node_count_test_node_with_only_leaf_nodes;
    get_binary_tree_node_count_test_well_formed_full_binary_tree;
    get_binary_tree_node_count_test_well_formed_complete_binary_tree;
    (* ---------- increment_all ---------- *)
    increment_all_empty_list;
    increment_all_single_element_list;
    increment_all_many_element_list;
    increment_all_negative_elements;
    (* ---------- long_strings ---------- *)
    long_strings_empty_list;
    long_strings_zero_length_strings;
    long_strings_three_length_strings;
    long_strings_five_length_strings;
    (* ---------- every_other ---------- *)
    every_other_empty_list;
    every_other_single_element;
    every_other_two_elements;
    every_other_three_elements;
    (* ---------- sum_all ---------- *)
    sum_all_empty_list;
    sum_all_one_list_of_one_empty_list;
    sum_all_three_lists_of_empty_list_each;
    sum_all_one_list_of_one_element_each;
    sum_all_one_list_of_two_elements;
    sum_all_one_list_of_three_elements;
    sum_all_two_lists_of_one_element_each;
    sum_all_two_lists_of_two_elements_each;
    sum_all_three_lists_of_three_elements_each;
];;


(* -------------------------------------------------------------------------- *)
(* Test execution *)
(* -------------------------------------------------------------------------- *)
run_test_tt_main full_suite