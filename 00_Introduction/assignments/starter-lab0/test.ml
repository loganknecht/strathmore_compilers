open OUnit2
open Functions

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
    (fun _ -> assert_equal expected value ~printer:string_of_int);;

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
(* Max function tests *)
(* -------------------------------------------------------------------------- *)
let max_test_zero_and_one = t_int "max_test_zero_and_one" (max 0 1) 1;;
let max_test_ten_and_one_thousand = t_int "max_test_ten_and_one_thousand" (max 10 1000) 1000;;
let max_test_negative_one_and_one = t_int "max_test_negative_one_and_one" (max ~-1 1) 1;;
let max_test_negative_ten_and_negative_one = t_int "max_test_negative_ten_and_negative_one" (max ~-10 ~-1) ~-1;;

(* -------------------------------------------------------------------------- *)
(* Fibonacci tests *)
(* -------------------------------------------------------------------------- *)
let fibonacci_test_zero = t_int "fibonacci_test_zero" (calculate_fibonacci 0) 0;;
let fibonacci_test_one = t_int "fibonacci_test_one" (calculate_fibonacci 1) 1;;
let fibonacci_test_two = t_int "fibonacci_test_two" (calculate_fibonacci 2) 1;;
let fibonacci_test_three = t_int "fibonacci_test_three" (calculate_fibonacci 3) 2;;
let fibonacci_test_four = t_int "fibonacci_test_four" (calculate_fibonacci 4) 3;;
let fibonacci_test_five = t_int "fibonacci_test_five" (calculate_fibonacci 5) 5;;
let fibonacci_test_six = t_int "fibonacci_test_six" (calculate_fibonacci 6) 8;;
let fibonacci_test_seven = t_int "fibonacci_test_seven" (calculate_fibonacci 7) 13;;


let suite = "suite">:::[
    my_first_test;
    (* my_second_test; *) (* This is supposed to intentionally fail *)
    (* my_third_test; *)  (* This is supposed to intentionally fail *)
    my_fourth_test;
    (* ---------- Max function testing ---------- *)
    max_test_zero_and_one;
    max_test_ten_and_one_thousand;
    max_test_negative_one_and_one;
    max_test_negative_ten_and_negative_one;
    (* ---------- Fibonacci function testing ---------- *)
    fibonacci_test_zero;
    fibonacci_test_one;
    fibonacci_test_two;
    fibonacci_test_three;
    fibonacci_test_four;
    fibonacci_test_five;
    fibonacci_test_six;
    fibonacci_test_seven;
];;

run_test_tt_main suite
