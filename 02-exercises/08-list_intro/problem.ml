open! Base

(* OCaml natively supports linked lists as part of the language.  Lists are
   commonly referred to as having heads and tails.  The head is the first
   element of the linked list The tail is everything else.

   To construct a list we use the cons infix operator [( :: )] to prepend elements to
   the front of a list:

   {| val (::) : 'a -> 'a list -> 'a list |}

   [] means "the empty list". hd :: tl means "the element hd added to the front
   of the list tl". 

   The following assertion shows that we can construct lists in two ways.
*)
let () = assert ([%compare.equal: int list] [ 5; 1; 8; 4 ]  (5 :: 1 :: 8 :: 4  :: []))

(* When matching on a list, it's either empty or non-empty. To say it another
   way, it's either equal to [] or equal to (hd :: tl) where hd is the first
   element of the list and tl is all the rest of the elements of the list (which
   may itself be empty).

   For example, this function computes the length of a list. *)
let rec length lst =
  match lst with
  | [] -> 0
  | _ :: tl -> 1 + length tl
;;

(* Write a function to add up the elements of a list by matching on it. *)
let rec sum lst = failwith "For you to implement"

(* The signature for the append infix operator is:

   {| val (@) : 'a list -> 'a list -> 'a list |} *)
let list_append first second = first @ second

(* By the way, you might've noticed that the list type in the function
   definition of [list_append] looks a bit different from every other type we've
   used thusfar. This is because a list is a parameterized data type. You can't
   just have a list; you have to have a list of somethings, like a list of
   integers.

   The ['a list] in the signature means that this function can be used on lists
   containing any type of data (as long as the contained data is the same in the
   two argument lists).

   Here, the ['a] is called a type parameter, and [list_append] is described as
   a polymorphic function. We'll revisit parametrized types in later
   exercises. *)
let%test "Testing sum..." = Int.( = ) 0 (sum [])
let%test "Testing sum..." = Int.( = ) 55 (sum [ 55 ])
let%test "Testing sum..." = Int.( = ) 0 (sum [ 5; -5; 1; -1 ])
let%test "Testing sum..." = Int.( = ) 12 (sum [ 5; 5; 1; 1 ])
