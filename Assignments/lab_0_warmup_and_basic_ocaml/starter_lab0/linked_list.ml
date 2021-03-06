open Printf

(* -------------------------------------------------------------------------- *)
(* Linked List                                                                *)
(* -------------------------------------------------------------------------- *)
let rec increment_all (list_of_integers : int list) : int list =
    match list_of_integers with
        | [] -> []
        | first::rest_of_list -> (first + 1) :: (increment_all rest_of_list)

let rec long_strings (list_of_strings : string list) (allowed_length_of_string : int) : string list =
    match list_of_strings with
        | [] -> []
        | head::rest_of_list -> if (String.length head) > allowed_length_of_string
                        then head::(long_strings rest_of_list allowed_length_of_string)
                        else (long_strings rest_of_list allowed_length_of_string)

let rec every_other (list_to_work_on : 'a list) : 'a list =
    match list_to_work_on with
    | [] -> []
    | head::[] -> [head]
    | head::second_element::rest_of_list -> head::(every_other rest_of_list)

let rec sum (list_of_integers : int list) : int =
    match list_of_integers with
    | [] -> 0
    | head::rest_of_list -> head + (sum rest_of_list)

(* Assumes that an empty list should return empty *)
(* Assumes that an empty list in an empty list should return 0 *)
let rec sum_all (list_of_list_of_integers : int list list) : int list =
    match list_of_list_of_integers with
    | [] -> []
    | [[]] -> [0]
    | head::rest_of_list -> (sum head)::(sum_all rest_of_list)