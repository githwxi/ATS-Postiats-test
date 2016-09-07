(* ****** ****** *)

(*
** A worm-like game!
*)

(* ****** ****** *)
//
#include
"share/atspre_define.hats"
//
#include
"{$LIBATSCC2PY3}/staloadall.hats"
//
(* ****** ****** *)

#define NROW 32
#define NCOL 32

(* ****** ****** *)

#define NWORM 48

(* ****** ****** *)
//
fun succ_row(x: int): int
fun pred_row(x: int): int
//
fun succ_col(x: int): int
fun pred_col(x: int): int
//
(* ****** ****** *)

abstype worm = ptr

(* ****** ****** *)
//
datatype
wnode =
  | WN of (int(*i*), int(*j*))
//
(* ****** ****** *)
//
datatype
xnode =
  | XN0 of () | XN1 of (int(*kind*))
//
(* ****** ****** *)
//
typedef
gamebd = mtrxszref(xnode)
//
typedef
visitbd = mtrxszref(int)
//
(* ****** ****** *)
//
fun theWorm_get(): worm = "mac#"
//
fun theWorm_length(): int = "mac#"
//
fun theWorm_decby1(): Option(wnode)
fun theWorm_incby1(wnx: wnode): void
//
(* ****** ****** *)
//
fun theWorm_insert(): void = "mac#"
fun theWorm_remove(): void = "mac#"
//
(* ****** ****** *)

fun theWorm_last_opt(): Option(wnode) = "mac#"

(* ****** ****** *)
//
fun theWorm_move_up(): int = "mac#"
fun theWorm_move_down(): int = "mac#"
fun theWorm_move_left(): int = "mac#"
fun theWorm_move_right(): int = "mac#"
//
fun theWorm_move_random(): int = "mac#"
//
(* ****** ****** *)
//
fun theWorm_move_random(): int = "mac#"
//
(* ****** ****** *)
//
fun theGamebd_get(): gamebd = "mac#"
//
fun{} theGamebd_display(): void = "mac#"
//
(* ****** ****** *)
//
fun
theWormlike_scene1((*void*)): void = "mac#"
fun
theWormlike_scene2((*void*)): void = "mac#"
//
fun
theWormlike_bonus_rand(n: int): void = "mac#"
//
(* ****** ****** *)

fun theVisitbd_get(): visitbd = "mac#"
fun theVisitbd_reset((*void*)): void = "mac#"

(* ****** ****** *)
//
macdef K_UP = $extval(int, "pygame.K_UP")
macdef K_DOWN = $extval(int, "pygame.K_DOWN")
macdef K_LEFT = $extval(int, "pygame.K_LEFT")
macdef K_RIGHT = $extval(int, "pygame.K_RIGHT")
macdef K_SPACE = $extval(int, "pygame.K_SPACE")
//
(* ****** ****** *)
//
datatype
kaction =
  | KACTnone
  | KACTquit
  | KACTup | KACTdown
  | KACTleft | KACTright
  | KACTrand
//
typedef kstream = stream(kaction)
//
(* ****** ****** *)

fun kstream_make(ms: intGte(0)): kstream

(* ****** ****** *)

(* end of [Wormlike.sats] *)
