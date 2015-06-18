//
#include
"share/atspre_define.hats"
#include
"share/atspre_staload.hats"
#include
"share/HATS/atspre_staload_libats_ML.hats"
//
(* ****** ****** *)

datatype
tree0 (a:t@ype) =
| tree0_nil of ()
| tree0_cons of (tree0(a), a, tree0(a))

(* ****** ****** *)
//
exception NotFound of ()
//
extern
fun
{a:t@ype}
search_df_exn
  (tree0(a), pred: (a) -<cloref1> bool): a
//
extern
fun
{a:t@ype}
search_df_opt
  (tree0(a), pred: (a) -<cloref1> bool): Option(a)
//
(* ****** ****** *)
//
// HX: this is a poor use of exceptions
//
implement
{a}(*tmp*)
search_df_exn
  (t0, pred) =
(
case+ t0 of
| tree0_nil() => $raise NotFound()
| tree0_cons(tl, x0, tr) =>
    if pred(x0)
      then x0
      else 
        try search_df_exn(tl, pred) with ~NotFound() => search_df_exn(tr, pred)
      // end of [else]
   // end of [tree0_cons]
)

(* ****** ****** *)

implement
{a}(*tmp*)
search_df_opt
  (t0, pred) =
(
case+ t0 of
| tree0_nil() => None()
| tree0_cons(tl, x0, tr) =>
    if pred(x0)
      then Some(x0)
      else let
        val opt = search_df_opt(tl, pred)
      in
        case+ opt of
        | Some _ => opt
        | None _ => search_df_opt(tr, pred)
      end
   // end of [tree0_cons]
)

(* ****** ****** *)


(* end of [tree-search.dats] *)
