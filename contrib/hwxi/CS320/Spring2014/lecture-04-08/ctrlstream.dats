(* ****** ****** *)

#include
"share/atspre_staload.hats"
#include
"share/HATS/atspre_staload_libats_ML.hats"

(* ****** ****** *)

staload UN = $UNSAFE

(* ****** ****** *)

staload "libats/libc/SATS/signal.sats"
staload "libats/libc/SATS/unistd.sats"

(* ****** ****** *)

fun fibgen
(
  r0: int, r1: int
) : stream (int) =
  $delay (stream_cons (r0, fibgen (r1, r0 + r1)))

(* ****** ****** *)

(*
fun fctrl
(
  nwait: int(*seconds*)
, ncont: int(*seconds*)
, prolog: string, epilog: string
) : int =
(
if nwait > 0 then let
//
val bsz = i2sz(128)
val inp = stdin_ref
var nlen: int // uninitilized
val nwait = g1ofg0 (nwait)
//
val () = print! (prolog)
//
val nwait = g0i2u (nwait)
val nwait = g1ofg0 (nwait)
val (pf | _) = alarm_set (nwait)
val [l:addr,n:int] line = $extfcall
(
Strnptr0, "atspre_fileref_get_line_string_main2", bsz, inp, addr@(nlen)
)
val isnot = strnptr_isnot_null (line)
val ((*freed*)) = strnptr_free (line)
val leftover = alarm_cancel (pf | (*void*))
//
val () = print! (epilog)
//
in
//  
if isnot then 0 else ncont
//
end else 0
) (* end of [fctrl] *)
*)

(* ****** ****** *)

fun ctrlstream
(
  nwait: uint
) : stream(int) = $delay
(
let
//
val bsz = i2sz(128)
val inp = stdin_ref
var nlen: int // uninitilized
val nwait = g1ofg0 (nwait)
val (pf | _) = alarm_set (nwait)
val [l:addr,n:int] line = $extfcall
(
Strnptr0, "atspre_fileref_get_line_string_main2", bsz, inp, addr@(nlen)
)
val isnot = strnptr_isnot_null (line)
val ((*freed*)) = strnptr_free (line)
val leftover = alarm_cancel (pf | (*void*))
//
in
//  
if isnot
  then stream_cons(0, ctrlstream (nwait))
  else let
    val () = println! ("Time is up!") in stream_nil(*void*)
  end // end of [else]
// end of [if]
//
end
) (* end of [ctrlstream] *)

(* ****** ****** *)

implement
main0 () = () where
{
//
var sigact: sigaction
val () =
ptr_nullize<sigaction>
  (__assert () | sigact) where
{
  extern prfun __assert (): is_nullable (sigaction)
} (* end of [val] *)
val mysighandler = lam (sgn: signum_t): void => ()
val () = sigact.sa_handler := sighandler(mysighandler)
//
val () = assertloc (sigaction_null (SIGALRM, sigact) = 0)
//
val xs = fibgen (0, 1)
val ys = ctrlstream (3u)
val zs = stream_map2_fun<int,int><int> (xs, ys, lam (x, y) => x)
//
local
typedef tenv = int
implement
stream_foreach$fwork<int><tenv>
  (x, env) = let
  val n = env
  val () = env := n + 1
in
  println! ("fib(", n, ") = ", x)
end // end of [stream_foreach$fwork]
in(*in-of-local*)
var env: tenv = 0
val () = stream_foreach_env<int><tenv> (zs, env)
end // end of [local]
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [ctrlstream.dats] *)
