//
#include
"share/atspre_define.hats"
#include
"share/atspre_staload.hats"
#include
"share/HATS/atspre_staload_libats_ML.hats"
//
(* ****** ****** *)
//
datatype card =
  | CARDval of (double)
  | CARDadd of (card, card)
  | CARDsub of (card, card)
  | CARDmul of (card, card)
  | CARDdiv of (card, card)
//
(* ****** ****** *)
//
extern
fun
print_card(c: card): void
extern
fun
fprint_card(out: FILEref, c: card): void
//
overload print with print_card
overload fprint with fprint_card
//
(* ****** ****** *)

implement
print_card(c) = fprint_card(stdout_ref, c)

(* ****** ****** *)

implement
fprint_card(out, c0) =
(
case+ c0 of
| CARDval(v) => fprint_int (out, g0f2i(v))
| CARDadd(c1, c2) => fprint! (out, "(", c1, "+", c2, ")")
| CARDsub(c1, c2) => fprint! (out, "(", c1, "-", c2, ")")
| CARDmul(c1, c2) => fprint! (out, "(", c1, "*", c2, ")")
| CARDdiv(c1, c2) => fprint! (out, "(", c1, "/", c2, ")")
)

(* ****** ****** *)

fun
card_eval(c0: card): double =
(
case+ c0 of
| CARDval(v) => v
| CARDadd(c1, c2) => card_eval(c1) + card_eval(c2)
| CARDsub(c1, c2) => card_eval(c1) - card_eval(c2)
| CARDmul(c1, c2) => card_eval(c1) * card_eval(c2)
| CARDdiv(c1, c2) => card_eval(c1) / card_eval(c2)
)

(* ****** ****** *)

#define EPSILON 0.00000001

(* ****** ****** *)

fun
card_isneqz (c0: card): bool = abs(card_eval(c0)) >= EPSILON
overload isneqz with card_isneqz

(* ****** ****** *)

typedef node = list0(card)

(* ****** ****** *)

extern
fun node_get_children(node): list0(node)

(* ****** ****** *)

implement
node_get_children
  (cs) = let
//
val n = list0_length(cs)
//
fun
aux
(
  c1: card, c2: card, cs: list0(card)
) : list0(node) = let
  val res = nil0()
  val res = cons0(cons0(CARDadd(c1, c2), cs), res)
  val res = cons0(cons0(CARDsub(c1, c2), cs), res)
  val res = cons0(cons0(CARDsub(c2, c1), cs), res)
  val res = cons0(cons0(CARDmul(c1, c2), cs), res)
  val res =
  (
    if isneqz(c2) then cons0(cons0(CARDdiv(c1, c2), cs), res) else res
  ) : list0(node)
  val res =
  (
    if isneqz(c1) then cons0(cons0(CARDdiv(c2, c1), cs), res) else res
  ) : list0(node)
in
  res
end // end of [aux]
//
fun
aux2
(
  cs: list0(card), i: int, j: int
) : list0(node) = let
//
  val () = assertloc(i < j)
//
  val c1 = cs[i]
  val c2 = cs[j]
  val cs = list0_remove_at_exn(cs, j)
  val cs = list0_remove_at_exn(cs, i)
in
  aux(c1, c2, cs)
end // end of [aux2]
//
fun
loop1
(
  i: int, res: list0(node)
) : list0(node) =
  if i < n-1 then loop2(i, i+1, res) else res
//
and
loop2
(
  i: int, j: int, res: list0(node)
) : list0(node) =
  if j < n then let
    val res = list0_append(aux2 (cs, i, j), res)
  in
    loop2 (i, j+1, res)
  end else loop1 (i+1, res)
//
in
//
if
(n >= 2)
then loop1 (0, list0_nil())
else list0_nil()
//
end // end of [node_get_children]

(* ****** ****** *)
//
staload
"libats/libc/SATS/stdlib.sats"
//
(* ****** ****** *)

implement
main0(argc, argv) = let
//
val c1 =
CARDval(if argc >= 2 then atof(argv[1]) else 0.0)
val () = println! ("c1 = ", c1)
//
val c2 =
CARDval(if argc >= 3 then atof(argv[2]) else 0.0)
val () = println! ("c2 = ", c2)
//
val c3 =
CARDval(if argc >= 4 then atof(argv[3]) else 0.0)
val () = println! ("c3 = ", c3)
//
val c4 =
CARDval(if argc >= 5 then atof(argv[4]) else 0.0)
val () = println! ("c4 = ", c4)
//
val node0 =
  g0ofg1($list{card}(c1, c2, c3, c4))
//
val node0_children = node_get_children(node0)
(*
val ((*void*)) = assertloc(length(node0_children) = 3*4*(4-1))
*)
val ((*void*)) = println! ("length(node0_children) = ", length(node0_children))
//
in
  // nothing
end // end of [main0]

(* ****** ****** *)

(* end of [game-of-24.dats] *)
