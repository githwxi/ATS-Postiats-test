(* Polymorphic functions *)

#include
"share/atspre_staload.hats"

(* Swapping of boxed tuples. *)
fun swapBoxed {a,b : type} ((x,y) : (a,b)) : (b,a) =
  (y,x)

(*
//
// HX-2015-05-18: it does not compile
//
fun swapUnoxed {a,b : t@ype} ((x,y) : (a,b)) : (b,a) =
  (y,x)
*)

(* List data type. *)
datatype List (a : type) =
  | Nil (a) of ()
  | Cons (a) of (a,List a)

(* Option type. *)
datatype Option (a : type) =
  | None (a) of ()
  | Someome (a) of a

(* Length *)
fun {a : type} listLength (xs : List a) : int =
  case xs of
    | Cons (_,xs) => 1 + listLength xs
    | Nil ()      => 0

(* Sample tuple. *)
val AB = ("A","B")

(* The {string,string} arguments isn't necessary, but sometimes it is. *)
(*
val BA1 = swapBoxed(AB)
val BA2 = swapBoxed{string,string}(AB)
*)

implement main0 () = ()
