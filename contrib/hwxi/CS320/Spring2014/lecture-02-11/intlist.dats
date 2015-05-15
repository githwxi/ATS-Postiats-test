(* ****** ****** *)
//  
// intlist: lists of integers
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

#define nil intlist_nil
#define :: intlist_cons
#define cons intlist_cons

(* ****** ****** *)

extern
fun fromto (m: int, n: int): intlist

implement
fromto (m, n) =
  if m < n then m :: fromto (m+1, n) else nil ()
  
(* ****** ****** *)

val digits = fromto (0, 10)

(* ****** ****** *)

implement main0 () = ((*void*))

(* ****** ****** *)

(* end of [intlist.dats] *)
