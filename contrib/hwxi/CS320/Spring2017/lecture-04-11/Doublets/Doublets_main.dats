(*
** Doublets is a word game ...
*)

(* ****** ****** *)

#include
"share/atspre_staload.hats"
#include
"share/HATS/atspre_staload_libats_ML.hats"

(* ****** ****** *)

staload "./Doublets.sats"

(* ****** ****** *)

local
//
#include "./Doublets_dict.dats"
//
in
  // nothing
end // end of [local]

(* ****** ****** *)

local
//
#include "./Doublets_word.dats"
//
in
  // nothing
end // end of [local]

(* ****** ****** *)

implement
fprint_val<word> = fprint_word

(* ****** ****** *)
//
#define GRAPHSEARCH_BFS 1
//
#include
"$PATSHOMELOCS\
/atscntrb-bucs320-graphsearch/mylibies.hats"
//
(* ****** ****** *)

staload GS = $GraphSearch
staload GS_bfs = $GraphSearch_bfs

(* ****** ****** *)

typedef node = list0(word)
typedef nodelst = list0(node)

(* ****** ****** *)
//
assume
$GS.node_type = node
assume
$GS.nodelst_vtype = nodelst
//
(* ****** ****** *)

implement
$GS_bfs.node_mark<>(nx) = ()
implement
$GS_bfs.node_unmark<>(nx) = ()
implement
$GS_bfs.node_is_marked<>(nx) = false

(* ****** ****** *)
//
implement
$GS.theSearchStore_insert_lst<>
  (nxs) =
  list0_foreach
  ( nxs
  , lam nx => $GS.theSearchStore_insert(nx)
  ) (* list0_foreach *)
//
(* ****** ****** *)

implement
$GS.node_get_neighbors<>
  (nx) =
  aux(ws) where
{
//
val w0 = list0_head_exn(nx)
//
val ws = word_get_neighbors(w0)
//
fun
aux(ws: wordlst): nodelst =
(
case+ ws of
| list0_nil() =>
  list0_nil(*void*)
| list0_cons(w, ws) => let
    val
    test = 
    list0_exists(nx, lam(w2) => w = w2)
  in
    if test
      then aux(ws)
      else list0_cons(list0_cons(w, nx), aux(ws))
  end // end of [list0_cons]
)
} (* end of [$GS.node_get_neighbors] *)

(* ****** ****** *)

//
extern
fun
Doublets_play
(
  w1: word, w2: word
) : Option(list0(word))
//
(* ****** ****** *)

implement
Doublets_play
  (w1, w2) = res[] where
{
//
val
res =
ref<Option(list0(word))>(None)
//
implement
$GS.process_node<>
  (nx) = let
  val-cons0(w, _) = nx
in
  if w = w2 then (res[] := Some(nx); false) else true
end // end of [process_node]
//
val nx = list0_sing(w1)
//
val store = qlistref_make_nil()
val ((*void*)) = qlistref_insert(store, nx)
//
val ((*void*)) = $GS_bfs.GraphSearch_bfs(store)
//
} (* end of [Doublets_play] *)

(* ****** ****** *)

implement
main0
(
  argc, argv
) = let
//
val () =
assertloc(argc >= 3)
//
val w1 = argv[1]
and w2 = argv[2]
//
val w1 = string2word(w1)
and w2 = string2word(w2)
//
val
opt = Doublets_play(w1, w2)
//
in
//
case+ opt of
| None() =>
    println!
    (
      "[", w1, "] and [", w2, "] are not a doublet!"
    )
| Some(ws) =>
    println!
    (
      "[", w1, "] and [", w2, "] form a doublet: ", list0_reverse(ws)
    )
//
end // end of [main0]

(* ****** ****** *)

(* end of [Doublets_main.dats] *)
