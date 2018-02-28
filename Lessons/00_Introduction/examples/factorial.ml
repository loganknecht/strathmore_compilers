open Printf

let rec factorial (n : int) : int =
    if n <= 1 then 1
    else n * (factorial (n - 1));;


(printf "The factorial of 3 is %d\n" (factorial 3))