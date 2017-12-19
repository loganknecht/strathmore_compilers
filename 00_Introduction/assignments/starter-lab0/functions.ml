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