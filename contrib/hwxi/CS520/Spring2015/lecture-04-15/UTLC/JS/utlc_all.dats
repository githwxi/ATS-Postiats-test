(*
** Implementing UTLC
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
//
val () =
println! ("Hello from UTLC!")
//
(* ****** ****** *)

staload "./utlc.sats"

(* ****** ****** *)
//
local
#include "./utlc_var.dats"
in (*nothing*) end
//
(* ****** ****** *)

local
#include "./utlc_term.dats"
in (*nothing*) end

(* ****** ****** *)

local
#include "./utlc_eval.dats"
in (*nothing*) end

(* ****** ****** *)

val x = var_make("x")
val f = var_make("f")

(* ****** ****** *)
//
macdef
listpair(x0, x1) =
  list_cons(,(x0), list_cons(,(x1), list_nil()))
//
(* ****** ****** *)

macdef TMadd(a, b) = TMopr("+", listpair(,(a), ,(b)))
macdef TMsub(a, b) = TMopr("-", listpair(,(a), ,(b)))
macdef TMmul(a, b) = TMopr("*", listpair(,(a), ,(b)))

(* ****** ****** *)

macdef TMilt(a, b) = TMopr("<", listpair(,(a), ,(b)))
macdef TMilte(a, b) = TMopr("<=", listpair(,(a), ,(b)))
macdef TMigt(a, b) = TMopr(">", listpair(,(a), ,(b)))
macdef TMigte(a, b) = TMopr(">=", listpair(,(a), ,(b)))
macdef TMieq(a, b) = TMopr("=", listpair(,(a), ,(b)))
macdef TMineq(a, b) = TMopr("!=", listpair(,(a), ,(b)))

(* ****** ****** *)

val
tm_fib =
TMfix
(
f,
TMlam
(
x,
TMcond
(
  TMigte(TMvar(x), TMint(2)),
  TMadd(TMapp(TMvar(f), TMsub(TMvar(x), TMint(1))), TMapp(TMvar(f), TMsub(TMvar(x), TMint(2)))), TMvar(x)
)
)
)

(* ****** ****** *)

extern
fun
showfibnum(n: int): void = "mac#"

implement
showfibnum (x) =
{
  val-TMint(ans) =
    eval_cbval(TMapp(tm_fib, TMint(x)))
  // end of [val]
  val ((*void*)) = println! ("fib(", x, ") = ", ans)
}  

(* ****** ****** *)

(*
implement main0 () = ()
*)

(* ****** ****** *)

#define ATS_MAINATSFLAG 1
#define ATS_DYNLOADNAME "my_dynload"

(* ****** ****** *)

%{$
//
function
utlc_all_initize()
{
  my_dynload();
  ats2jspre_the_print_store_clear();
  showfibnum(20);
  alert(ats2jspre_the_print_store_join());
}
//
%} // end of [%{$]

(* ****** ****** *)

(* end of [utlc_all.dats] *)
