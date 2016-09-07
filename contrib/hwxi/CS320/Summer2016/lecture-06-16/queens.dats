(* ****** ****** *)
//
// Solving the eight-queen puzzle
//
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
#include
"share/HATS/atspre_staload_libats_ML.hats"
//
(* ****** ****** *)

staload "./../mylib/mylist.dats"
staload "./../mylib/mystack.dats"

(* ****** ****** *)

#define N 8

(* ****** ****** *)

typedef node = list0(int)

(* ****** ****** *)

extern
fun
print_node(node): void

(* ****** ****** *)

extern
fun
process_node(node): void

(* ****** ****** *)

implement
process_node(nx) = let
  val n = list0_length(nx)
in
  if n >= N then print_node(nx) else ()
end // end of [process_node]

(* ****** ****** *)

extern
fun
node_get_children(node): list0(node)

(* ****** ****** *)

local

fun
node_test
(
  nx: node, i: int
) : bool = let
//
fun
aux
(
  nx: node, df: int
) : bool =
(
  case+ nx of
  | nil0() => true
  | cons0(x, nx) =>
    if x != i then
    (
      if abs(x-i) != df
        then aux(nx, df+1) else false
      // end of [if]
    ) else false // end of [if]
)
//
in
  aux(nx, 1)
end // end of [node_test]

in (* in-of-local *)

implement
node_get_children(nx) = let
//
fun
aux(i: int): list0(node) =
if
i < N
then let
  val test = node_test(nx, i)
in
  if test then list0_cons(cons0(i, nx), aux(i+1)) else aux(i+1)
end
else list0_nil()
//
in
  if length(nx) < N then aux(0) else nil0()
end // end of [node_get_children]

end // end of [local]

(* ****** ****** *)

implement
print_node(nx) = let
//
fun
aux(n: int): void =
(
//
(n).foreach()(lam _ => print ". "); print "Q ";
(N-1-n).foreach()(lam _ => print ". "); print_newline()
//
) (* end of [aux] *)
//
val _ = mylist_foldright_cloref(nx, lam(n, _) => (aux(n); 0), 0)
//
val () = print_newline()
//
in
  // nothing
end // end of [print_node]

(* ****** ****** *)

implement main0() = ()

(* ****** ****** *)

extern
fun
dfirst_search(node): void

(* ****** ****** *)

implement
dfirst_search(nx) = let
//
val
stk = stack_make_nil()
//
val () = stack_push(stk, nx)
//
fun loop(): void = let
  val opt = stack_pop_opt(stk)
in
  case+ opt of
  | None() => ()
  | Some(nx) => let
      val () = process_node(nx)
      val nxs = node_get_children(nx)
      val () = stack_push_list(stk, nxs)
    in
      loop()
    end // end of [Some]
end
//
in
  loop()
end // end of [dfirst_search]

(* ****** ****** *)

val () = dfirst_search(list0_nil())

(* ****** ****** *)

(* end of [queens.dats] *)
