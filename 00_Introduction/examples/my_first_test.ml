open OUnit2

let check_fun _ = (* a function of one argument *)
    assert_equal (2 + 2) 4;;

let my_first_test = "my_first_test">::check_fun;;
let suite = "suite">:::[my_first_test];;

run_test_tt_main suite