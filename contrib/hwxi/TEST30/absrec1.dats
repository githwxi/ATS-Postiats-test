(*
** HX:
** For testing absrec
*)

(* ****** ****** *)

#include
"share\
/atspre_staload.hats"

(* ****** ****** *)
//
#staload
"prelude/codegen2.sats"
//
(* ****** ****** *)

abstype myrec_t = ptr

(* ****** ****** *)
//
extern
fun{}
myrec$make
  (a: int, b: int, c: string): myrec_t
//
(* ****** ****** *)
//
#ifdef
CODEGEN
#then
typedef
myrec_t = $rec{
  a= getset(int), b= getset(int), c=get(string)
} (* end of [myrec] *)
//
#codegen2
(
absrec, myrec_t, myrec$
) (* #codegen2 *)
#endif // ifdef(CODEGEN)
//
(* ****** ****** *)

#if
defined(COMPILE)
#then
//
#include
"./absrec1_codegen.hats"
//
local
//
typedef
abc_rec_ =
@{a=int, b=int, c=string}
assume myrec_t = ref(abc_rec_)
//
in (* in-of-local *)
//
implement
{}(*tmp*)
myrec$make
(
  a, b, c
) = ref(@{a=a, b=b, c=c})
  //
implement{} myrec$get_a(x) = x->a
implement{} myrec$set_a(x, a) = x->a := a
//
implement{} myrec$get_b(x) = x->b
implement{} myrec$set_b(x, b) = x->b := b
//
implement{} myrec$get_c(x) = x->c
(*
//
// there is no update for the c-field:
//
implement{} myrec$set_a(x, c) = x->c := c
*)
//
end // end of [local]

(* ****** ****** *)

implement
main0() = () where
{
//
val x_abc = myrec$make(0, 1, "2")
//
val ((*void*)) = assertloc(x_abc.a() = 0)
val ((*void*)) = assertloc(x_abc.b() = 1)
val ((*void*)) = assertloc(x_abc.c() = "2")
//
val ((*void*)) = x_abc.a(100)
val ((*void*)) = assertloc(x_abc.a() = 100)
//
val ((*void*)) = x_abc.b(101)
val ((*void*)) = assertloc(x_abc.b() = 101)
//
(*
val ((*void*)) = x_abc.c("102") // *ERROR*: unsupported
*)
//
} (* end of [main0] *)

(* ****** ****** *)

#endif // end of [if(COMPILE)]

(* end of [absrec1.sats] *)
