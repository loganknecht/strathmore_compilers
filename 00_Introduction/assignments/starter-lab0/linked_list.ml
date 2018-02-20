open Printf

(* -------------------------------------------------------------------------- *)
(* Linked List                                                                *)
(* -------------------------------------------------------------------------- *)
let rec increment_all (list_of_integers : int list) : int list =
    match list_of_integers with
        | [] -> []
        | first::rest -> (first + 1) :: (increment_all rest)

