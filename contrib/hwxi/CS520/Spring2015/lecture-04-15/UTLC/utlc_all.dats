(*
** Implementing UTLC
*)

(* ****** ****** *)

#define UTLC_ALL

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
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

macdef TMadd(a, b) = TMopr("+", $list{term}(,(a), ,(b)))
macdef TMsub(a, b) = TMopr("-", $list{term}(,(a), ,(b)))
macdef TMmul(a, b) = TMopr("*", $list{term}(,(a), ,(b)))

(* ****** ****** *)

macdef TMilt(a, b) = TMopr("<", $list{term}(,(a), ,(b)))
macdef TMilte(a, b) = TMopr("<=", $list{term}(,(a), ,(b)))
macdef TMigt(a, b) = TMopr(">", $list{term}(,(a), ,(b)))
macdef TMigte(a, b) = TMopr(">=", $list{term}(,(a), ,(b)))
macdef TMieq(a, b) = TMopr("=", $list{term}(,(a), ,(b)))
macdef TMineq(a, b) = TMopr("!=", $list{term}(,(a), ,(b)))

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

val fib10 = TMapp(tm_fib, TMint(10))
val ((*void*)) = println! ("fib(10) = ", eval_cbval(fib10))

(* ****** ****** *)

implement main0 () = ()

(* ****** ****** *)

(* end of [utlc_all.dats] *)
