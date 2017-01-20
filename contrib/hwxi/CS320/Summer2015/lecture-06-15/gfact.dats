//
#include
"share/atspre_define.hats"
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)
//
staload "{$HX_INTINF}/DATS/gintinf_t.dats"
//
staload _ = "{$HX_INTINF}/DATS/intinf_t.dats"
staload _ = "{$HX_INTINF}/DATS/intinf_vt.dats"
//
(* ****** ****** *)

extern
fun{a:t@ype} gfact(int): a

(* ****** ****** *)

implement
{a}(*tmp*)
gfact(n) =
  if n = 0
    then gnumber_int<a>(1)
    else gmul_val_val<a> (gnumber_int<a>(n), gfact(n-1))
  // end of [if]

(* ****** ****** *)

val n = 100
val () = println! ("gfact<int>(", n, ") = ", gfact<int> (n))
val () = println! ("gfact<double>(", n, ") = ", gfact<double> (n))
val () = println! ("gfact<intinf>(", n, ") = ", gfact<intinf> (n))

(* ****** ****** *)

implement main0 () = ()

(* ****** ****** *)

(* end of [gfact.dats] *)
