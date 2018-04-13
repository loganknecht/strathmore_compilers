# Tuples
- Built in convenience functions `fst` and `snd` to retrieve the first and second elements of a tuple

# AVL Tree
## Rotations
- 4 different rotation instances
    - Left-Left
        - The height of the left subtree is greater than the height of the right subtree
        - The left subtree of the root node's left subtree has a left subtree that is greater than the right subtree, so that is where the second "left" comes from
    - Left-Right
        - The height of the left subtree is less the the height of the right subtree, this is where the first left comes from
        - For the left subtree, the height of its left subtree is less than the height of the right subtree, so that's where the right comes from
    - Right-Right
        - Mirror of Left-Left
    - Right-Left
        - Mirror of Left-Right

### When are rotations checked?
- After insertion the height of each tree is checked from bottom to top, starting with the newly inserted node