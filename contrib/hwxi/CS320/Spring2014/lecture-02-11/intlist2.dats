(* ****** ****** *)
//  
// intlist2: lists of intlists
//
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

datatype intlist =
  | intlist_nil of ()
  | intlist_cons of (int, intlist)
  
(* ****** ****** *)
//
extern
fun intlist_append (intlist, intlist): intlist
//
(* ****** ****** *)

datatype intlist2 =
  | intlist2_nil of ()
  | intlist2_cons of (intlist, intlist2)

(* ****** ****** *)

extern
fun intlist2_concat (intlist2): intlist

(* ****** ****** *)

#define nil2 intlist2_nil
#define cons2 intlist2_cons

implement
intlist2_concat (xss) =
(
case+ xss of
| nil2 () => intlist_nil ()
| cons2 (xs, xss) => intlist_append (xs, intlist2_concat (xss))
)

(* ****** ****** *)

(* end of [intlist2.dats] *)
