# Assignment Link
- https://www.cs.swarthmore.edu/~jpolitz/cs75/s16/n_ocaml-intro.html

# Section 3
## 3.3 Exercises
### Question 1
Write a test function t_string that’s like t_int, but tests for equality of strings. Can you write a function that produces a string form of the results like t_int did for integers?
(This is a trick question.)

So here is my understanding of this. The `t_int` function is a wrapper for performing assertions, and leverages the labeled argument `printer` which accepts the `string_to_int` in order to output the contents to the command line.

This doesn't require a change in the function because the `assert_equal` function does not appear to have a type required for the arguments.

### Question 2
Write at least five interesting tests for inorder_str.

Please see `00_Introduction/assignments/starter-lab0/test.ml`

### Question 3
Write out the substitution-based evaluation of inorder_str on a tree with at least 3 nodes.

```ocaml
(* -------------------------------------------------------------------------- *)
(*  In-order traversal = 1,2,3                                                *)
(*               2                                                            *)
(*            /     \                                                         *)
(*           1       3                                                        *)
(* -------------------------------------------------------------------------- *)
```

```
(inorder_str node_two)

(inorder_str ((inorder_str node_two.left) ^ node_two.value ^ (inorder_str node_two.right)))

(inorder_str ((inorder_str node_one) ^ node_two.value ^ (inorder_str node_three)))

(inorder_str 
    (
        (inorder_str 
            ((inorder_str node_one.left) ^ node_one.value ^ (inorder_str node_one.right))
        ) ^ 
        node_two.value ^ 
        (inorder_str 
            ((inorder_str node_three.left) ^ node_three.value ^ (inorder_str node_three.right))
        ) ^ 
    )
)

(inorder_str 
    (
        (inorder_str 
            ((inorder_str "") ^ "one" ^ (inorder_str ""))
        ) ^ 
        "two" ^ 
        (inorder_str 
            ((inorder_str "") ^ "three" ^ (inorder_str ""))
        ) ^ 
    )
)
```

### Question 4
Write a function size that takes a btnode and produces an integer that is the number of Nodes in the tree.

Done

### Question 5
Write a function height that takes a btnode and produces an integer that is the height of the tree.

Done

### Question 6
Make sure to test the above two functions.

Done

# Section 4



