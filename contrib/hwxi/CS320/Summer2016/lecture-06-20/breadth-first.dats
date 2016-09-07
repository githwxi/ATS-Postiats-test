(* ****** ****** *)
//
#include
"share/atspre_define.hats"
#include
"{$LIBATSCC2PY3}/staloadall.hats"
//
(* ****** ****** *)

staload "./myqueue.dats"

(* ****** ****** *)

abstype node

(* ****** ****** *)

extern
fun
node_get_children(node): list0(node)

(* ****** ****** *)

extern
fun{}
process_node(node): bool

(* ****** ****** *)

extern
fun{}
bfirst_search(nx: node): void

(* ****** ****** *)

implement
{}(*tmp*)
bfirst_search(nx) = let
//
val
que = queue_make_nil()
//
val () = queue_enqueue(que, nx)
//
fun loop(): void = let
//
val opt = queue_dequeue_opt<node>(que)
//
in
  case+ opt of
  | None() => ()
  | Some(nx) => let
      val cont = process_node(nx)
    in
      if cont
        then let
          val nxs = node_get_children(nx)
          val _(*void*) = queue_enqueue_list(que, nxs)
        in
          loop((*void*))
        end // end of [then]
      // end of [if]
    end // end of [Some]
end
//
in
  loop()
end // end of [bfirst_search]

(* ****** ****** *)

(* end of [breadth-first.dats] *)
