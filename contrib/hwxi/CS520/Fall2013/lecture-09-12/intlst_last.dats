(*
**
** Code used during Lecture-09-12
**
*)

(* ****** ****** *)

#include
"share/atspre_staload.hats"  
  
(* ****** ****** *)

datatype intlst =
  | intlst_nil of ()
  | intlst_cons of (int, intlst)
// end of [intlst]

(* ****** ****** *)

#define nil intlst_nil
#define cons intlst_cons
#define :: intlst_cons

(* ****** ****** *)

extern
fun intlst_last (xs: intlst): int

implement
intlst_last (xs) = let
//
fun loop (x: int, xs: intlst): int =
  case+ xs of
  | intlst_nil () => x | intlst_cons (x, xs) => loop (x, xs)
//
in
//
case+ xs of
| intlst_nil () => 0
| intlst_cons (x, xs) => loop (x, xs)
//
end (* end of [intlst_length] *)

(* ****** ****** *)

val xs0 = nil ()
val xs1 = cons (1, nil)
val xs2 = 1 :: 2 :: nil ()
val xs3 = 1 :: 2 :: 3 :: nil ()

(* ****** ****** *)

val () = assertloc (intlst_last (xs0) = 0)
val () = assertloc (intlst_last (xs1) = 1)
val () = assertloc (intlst_last (xs2) = 2)
val () = assertloc (intlst_last (xs3) = 3)

(* ****** ****** *)

implement
main0 () = () where
{
val () = println! ("No news is good news :)")
}

(* ****** ****** *)

(* end of [intlst_last.dats] *)
