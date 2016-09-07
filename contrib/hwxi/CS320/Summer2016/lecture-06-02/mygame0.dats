(* ****** ****** *)
//
// HX-2016-06:
// For illustrating
// the structure of a simple game
//
(* ****** ****** *)
//
// HX-2016-06:
// This is a sketch
// and it is intended to be a sketch!
// 
(* ****** ****** *)

datatype KS =
  | KSup
  | KSdown
  | KSleft
  | KSright

(* ****** ****** *)

typedef
state = $rec{x=int, y=int}

(* ****** ****** *)
//
extern
fun KS_get(): KS
//
extern
fun
state_update(st: state, ks: KS): state
extern
fun
state_update_up(st: state, ks: KS): state
and
state_update_down(st: state, ks: KS): state
and
state_update_left(st: state, ks: KS): state
and
state_update_right(st: state, ks: KS): state
//
(* ****** ****** *)

extern
fun
loop : (state) -> void

(* ****** ****** *)

fun
loop
(
  st: state
) : void = let
  val ks = KS_get()
  val st2 = state_update(st, ks)
in
  loop(st2)
end // end of [loop]

(* ****** ****** *)
//
implement
state_update(st, ks) =
  case+ ks of
  | KSup() => state_update_up(st, ks)
  | KSdown() => state_update_down(st, ks)
  | KSleft() => state_update_left(st, ks)
  | KSright() => state_update_right(st, ks)
//
(* ****** ****** *)
//
implement
state_update_up
  (st, ks) = $rec{x=st.x, y=st.y-1}
//
implement
state_update_down
  (st, ks) = $rec{x=st.x, y=st.y+1}
//
implement
state_update_left
  (st, ks) = $rec{x=st.x-1, y=st.y}
//
implement
state_update_right
  (st, ks) = $rec{x=st.x+1, y=st.y}
//
(* ****** ****** *)

extern
fun state_rendering(st: state): void

(* ****** ****** *)

(* end of [mygame0.dats] *)
