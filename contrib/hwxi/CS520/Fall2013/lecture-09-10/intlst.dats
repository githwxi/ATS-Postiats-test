(*
**
** Code used during Lecture-09-10
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
fun intlst_length (xs: intlst): int

implement
intlst_length (xs) =
(
case+ xs of
| intlst_nil () => 0
| intlst_cons (_, xs) => 1 + intlst_length (xs)
) (* end of [intlst_length] *)

(* ****** ****** *)

val xs0 = nil ()
val xs1 = cons (1, nil)
val xs2 = 1 :: 2 :: nil ()

(* ****** ****** *)

val () = assertloc (intlst_length (xs0) = 0)
val () = assertloc (intlst_length (xs1) = 1)
val () = assertloc (intlst_length (xs2) = 2)

(* ****** ****** *)

implement
main0 () = () where
{
val () = println! ("No news is good news :)")
}

(* ****** ****** *)

(* end of [intlst.dats] *)
