(*
For testing GraphSearh_bfs
*)

(* ****** ****** *)
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
#define
GRAPHSTREAMIZE_BFS 1
//
#include "./../mylibies.hats"
//
#staload $GraphStreamize
#staload $GraphStreamize_bfs
//
(* ****** ****** *)

#define N 8

(* ****** ****** *)

assume node_type = list0(int)
assume nodelst_type = list0(node)

(* ****** ****** *)

implement node_mark<>(nx) = ()
implement node_unmark<>(nx) = ()
implement node_is_marked<>(nx) = false

(* ****** ****** *)
//
implement
{}(*tmp*)
theStreamizeStore_insert_lst(nxs) =
(
nxs
).foreach()(lam nx => theStreamizeStore_insert(nx))
//
(* ****** ****** *)
//
implement
node_get_neighbors<>
  (nx0) = 
(
(N).list0_map(TYPE{node})(lam x => cons0(x, nx0))
).filter()
  (
    lam nx =>
    let
      val-cons0(x0, nx) = nx
    in
      (nx).iforall()(lam(i, x) => x0 != x && abs(x0 - x) != i+1)
    end // end of [let] // end of [lam]
  )
//
(* ****** ****** *)
//
extern
fun
QueenPuzzle_solve
(
  // argless
) : stream(node)
//
implement
QueenPuzzle_solve
  () = nxs where
{
//
val
root = list0_nil()
//
val
store =
qlistref_make_nil{node}()
//
val () =
qlistref_insert(store, root)
//
val nxs = GraphStreamize_bfs(store)
//
} (* end of [QueenPuzzle_solve] *)
//
(* ****** ****** *)

implement
main0() = () where
{
//
val
nxs = QueenPuzzle_solve()
val
nxs =
(nxs).filter()(lam(nx) => length(nx) >= N)
//
val () =
nxs.foreach()
(
  lam(nx) => println!(list0_reverse(nx))
)
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [QueenPuzzle_bfs.dats] *)
