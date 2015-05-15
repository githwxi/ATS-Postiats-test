(*
** A verified
** implementation
** of Fibonacci numbers
*)

(* ****** ****** *)
(*
//
Try it on-line:
//
http://www.ats-lang.org/SERVER/MYCODE/Patsoptaas_serve.php?mycode_url=http://www.cs.bu.edu/~hwxi/academic/courses/CS520/Spring15/code/lecture-01-26/fibverify.dats
//
*)
(* ****** ****** *)
//
#include
"share/atspre_define.hats"
#include
"{$LIBATSCC2JS}/staloadall.hats"
//
(* ****** ****** *)
//
staload
"{$LIBATSCC2JS}/SATS/print.sats"
//
(* ****** ****** *)

#define ATS_MAINATSFLAG 1
#define ATS_DYNLOADNAME "my_dynload"

(* ****** ****** *)
//
dataprop
FIB(int, int) =
  | FIBrule0(0,0) of ()
  | FIBrule1(1,1) of ()
  | {n:int|n >= 2}{r0,r1:int}
    FIBrule2(n, r0+r1) of (FIB(n-1,r0), FIB(n-2, r1))
//
(* ****** ****** *)
//
extern
fun fib:{n:nat} int(n)-> [r:int] (FIB(n,r) | int(r))
//
(* ****** ****** *)
//
implement
fib (n) =  (
//
case+ n of
| 0 => (FIBrule0() | 0)
| 1 => (FIBrule1() | 1)
| _ =>> let
    val(pf1 | r0) = fib(n-1)
    val(pf2 | r1) = fib(n-2)
  in
    (FIBrule2(pf1, pf2) | r0+r1)
  end // end of [n >= 2]
//
) (* end of [fib] *)
//
(* ****** ****** *)
//
val () = println! ("fib(20) = ", (fib(20)).1)
//
(* ****** ****** *)

%{$
//
ats2jspre_the_print_store_clear();
my_dynload();
alert(ats2jspre_the_print_store_join());
//
%} // end of [%{$]

(* ****** ****** *)

(* end of [fibverify.dats] *)
