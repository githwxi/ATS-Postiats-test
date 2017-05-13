(* ****** ****** *)

#include
"share/atspre_staload.hats"
#include
"share/HATS\
/atspre_staload_libats_ML.hats"

(* ****** ****** *)
//
#define N 8
//
(* ****** ****** *)
//
#define GRAPHSEARCH_BFS 1
//
#include
"$PATSHOMELOCS\
/atscntrb-bucs320-graphsearch/mylibies.hats"
//
#staload GS = $GraphSearch
#staload GS_bfs = $GraphSearch_bfs
//
(* ****** ****** *)

typedef node = $GS.node
vtypedef nodelst = $GS.nodelst

(* ****** ****** *)

implement
$GS_bfs.node_mark<>(nx) = ()
implement
$GS_bfs.node_unmark<>(nx) = ()
implement
$GS_bfs.node_is_marked<>(nx) = false

(* ****** ****** *)

assume $GS.node = list0(int)
assume $GS.nodelst = list0(node)

(* ****** ****** *)
//
implement
{}(*tmp*)
$GS.theSearchStore_insert_lst(nxs) =
(
nxs
).foreach()(lam nx => $GS.theSearchStore_insert(nx))
//
(* ****** ****** *)

implement
$GS.process_node<>
  (nx) = let
  val len = length(nx)
in
//
if
(len < N)
then true
else false where
{
//
val () = println!()
//
val () =
nx.rforeach()
(
lam x =>
(
(x).repeat()(lam() => print ". ");
print "Q ";
(N-1-x).repeat()(lam() => print ". "); println!()
)
)
val () = println!()
//
}
//
end // end of [process_node]

(* ****** ****** *)

implement
$GS.node_get_neighbors<>
  (xs) =
  aux(0) where
{
//
fun
aux
(
  i: int
) : nodelst = let
//
fun
test
(
xs: list0(int), d: int
) : bool =
(
case+ xs of
| list0_nil() => true
| list0_cons(x, xs) =>
    if (x != i && abs(x-i) != d) then test(xs, d+1) else false
  // end of [list0_cons]
)
//
in
//
if
(i < N)
then
(
if
test(xs, 1)
then list0_cons(list0_cons(i, xs), aux(i+1))
else aux(i+1)
)
else list0_nil(*void*)
//
end // end of [aux]
//
} (* end of [node_get_neighbors] *)
//
(* ****** ****** *)
//
extern
fun
QueenPuzzle_solve(): void
//
implement
QueenPuzzle_solve() =
{
val
store =
qlistref_make_nil{node}()
//
val () =
qlistref_insert(store, nil0)
//
val () = $GS_bfs.GraphSearch_bfs(store)
//
} (* end of [QueenPuzzle_solve] *)
//
(* ****** ****** *)

implement
main0() = () where
{
//
val () = QueenPuzzle_solve()
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [QueenPuzzle.dats] *)
