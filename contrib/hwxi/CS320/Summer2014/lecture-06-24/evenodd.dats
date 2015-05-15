(* ****** ****** *)
//
// HX: CPS and tail-calls
//
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

(*
fnx isevn (x: int): bool =
  if x > 0 then isodd (x-1) else true
and isodd (x: int): bool =
  if x > 0 then isevn (x-1) else false
*)
    
(* ****** ****** *)

typedef
cont (a:t@ype) = a -<cloref1> bool

(* ****** ****** *)

extern
fun k_isevn (x: int, k: cont(bool)): bool
extern
fun k_isodd (x: int, k: cont(bool)): bool

(* ****** ****** *)

implement
k_isevn (x, k) =
  if x > 0 then k_isodd (x-1, k) else k(true)
      
implement
k_isodd (x, k) =
  if x > 0 then k_isevn (x-1, k) else k(false)

(* ****** ****** *)

implement
main0 () = let
//
val k0 = (lam (res) => res): cont(bool)
//
in
//
println! ("k_isevn(100) = ", k_isevn(100, k0));
println! ("k_isodd(100) = ", k_isodd(100, k0));
//
end // end of [main0]

(* ****** ****** *)

(* end of [evenodd.dats] *)
