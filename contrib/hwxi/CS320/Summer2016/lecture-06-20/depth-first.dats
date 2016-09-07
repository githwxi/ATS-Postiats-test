(* ****** ****** *)
//
#include
"share/atspre_define.hats"
#include
"{$LIBATSCC2PY3}/staloadall.hats"
//
(* ****** ****** *)

staload "./mystack.dats"

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
dfirst_search(nx: node): void

(* ****** ****** *)

implement
{}(*tmp*)
dfirst_search(nx) = let
//
val
stk = stack_make_nil()
//
val () = stack_push(stk, nx)
//
fun loop(): void = let
//
val opt = stack_pop_opt<node>(stk)
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
          val _(*void*) = stack_push_list(stk, nxs)
        in
          loop((*void*))
        end // end of [then]
      // end of [if]
    end // end of [Some]
end
//
in
  loop()
end // end of [dfirst_search]

(* ****** ****** *)

(* end of [depth-first.dats] *)
