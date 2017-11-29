open Printf
 
let max (n : int) (m : int) : int =
  if n > m then n else m;;
 
(printf "Between the numbers 5 and 4, the max should be 5: %d\n" (max 5 4));
(printf "Between the numbers 3 and 4, the max should be 4: %d\n" (max 3 4));
(printf "Between the numbers 4 and 4, the max should be 4: %d\n" (max 4 4));