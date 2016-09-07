(* ****** ****** *)
//
// Functions on lists
//
(* ****** ****** *)
//
staload
"libats/ML/SATS/basis.sats"
//
(* ****** ****** *)
(*
//
// HX: alread in ML/basis.sats
//
datatype
list0(a:t@ype) =
  | list0_nil of ()
  | list0_cons of (a, list0(a))
*)
(* ****** ****** *)
//
// [mylist_length] is O(n)-time
//
extern
fun{a:t@ype}
mylist_length : list0(a) -> int
//
implement{a}
mylist_length(xs) =
(
case xs of
| list0_nil() => 0
| list0_cons(_, xs_tail) => 1 + mylist_length<a>(xs_tail)
)
//
(* ****** ****** *)
//
// [mylist_is_nil] is O(1)-time
//
extern
fun{a:t@ype}
mylist_is_nil : list0(a) -> bool
implement{a}
mylist_is_nil(xs) =
  case+ xs of
  | list0_nil() => true | list0_cons _ => false
//
(* ****** ****** *)
//
extern
fun{a:t@ype}
mylist_append : (list0(a), list0(a)) -> list0(a)
//
implement{a}
mylist_append(xs, ys) =
(
case xs of
| list0_nil() => ys
| list0_cons(x, xs) => list0_cons(x, mylist_append(xs, ys))
)
//
(* ****** ****** *)
//
extern
fun{a:t@ype}
mylist_reverse : list0(a) -> list0(a)
extern
fun{a:t@ype}
mylist_revappend : (list0(a), list0(a)) -> list0(a)
//
(* ****** ****** *)

extern
fun{a:t@ype}
mylist_mergesort : list0(a) -> list0(a)

(* ****** ****** *)
//
extern
fun{a:t@ype}
mylist_foreach_cloref
  : (list0(a), (a) -<cloref1> void) -> void
//
implement{a}
mylist_foreach_cloref
  (xs, fwork) = let
//
fun loop
(
  xs: list0(a)
) : void =
(
  case+ xs of
  | list0_nil() => () 
  | list0_cons(x, xs) => (fwork(x); loop(xs))
)
//
in
  loop(xs)
end // end of [mylist_foreach_cloref]

(* ****** ****** *)
//
extern
fun{a:t@ype}
mylist_iforeach_cloref
  : (list0(a), (int, a) -<cloref1> void) -> void
//
implement{a}
mylist_iforeach_cloref
  (xs, fwork) = let
//
fun loop
(
  i: int, xs: list0(a)
) : void =
(
  case+ xs of
  | list0_nil() => () 
  | list0_cons(x, xs) => (fwork(i, x); loop(i+1, xs))
)
//
in
  loop(0, xs)
end // end of [mylist_iforeach_cloref]
//
(* ****** ****** *)
//
extern
fun
{a,b:t@ype}
mylist_foldleft_cloref
  (xs: list0(a), init: b, fopr: (b, a) -<cloref1> b): b
//
implement
{a,b}(*tmp*)
mylist_foldleft_cloref
  (xs, init, fopr) = let
//
fun
aux(xs: list0(a), init: b): b =
(
case+ xs of
| list0_nil() => init
| list0_cons(x, xs) => aux(xs, fopr(init, x))
)
//
in
  aux(xs, init)
end // end of [mylist_foldleft_cloref]
//
(* ****** ****** *)
//
extern
fun
{a,b:t@ype}
mylist_foldright_cloref
  (xs: list0(a), fopr: (a, b) -<cloref1> b, sink: b): b
//
implement
{a,b}(*tmp*)
mylist_foldright_cloref
  (xs, fopr, sink) = let
//
fun
aux(xs: list0(a), sink: b): b =
(
case+ xs of
| list0_nil() => sink
| list0_cons(x, xs) => fopr(x, aux(xs, sink))
)
//
in
  aux(xs, sink)
end // end of [mylist_foldright_cloref]
//
(* ****** ****** *)
//
extern
fun{a:t@ype}
mylist_filter_cloref
  (xs: list0(a), test: (a) -<cloref1> bool): list0(a)
//
implement
{a}
mylist_filter_cloref
  (xs, test) =
(
  mylist_foldright_cloref<a,list0(a)>
    ( xs
    , lam(x, res) =>
        if test(x) then list0_cons(x, res) else res
    , list0_nil((*sink*))
    )
)
//
(* ****** ****** *)
//
extern
fun{a,b:t@ype}
mylist_map_cloref
  (xs: list0(a), fopr: (a) -<cloref1> b): list0(b)
//
implement
{a,b}
mylist_map_cloref
  (xs, fopr) =
(
mylist_foldright_cloref<a,list0(b)>
  (xs, lam(x, res) =>
         list0_cons(fopr(x), res), list0_nil()
  )
)
//
(* ****** ****** *)
//
implement
{a}
mylist_reverse(xs) = mylist_revappend(xs, list0_nil)
implement
{a}
mylist_revappend(xs, ys) =
mylist_foldleft_cloref<a,list0(a)>
  (xs, ys, lam(ys, x) => list0_cons(x, ys))
//
(* ****** ****** *)
//
extern
fun{a:t@ype}
mylist_concat : list0(list0(a)) -> list0(a)
//
implement
{a}(*tmp*)
mylist_concat(xss) =
mylist_foldright_cloref<list0(a),list0(a)>
  (xss, lam(xs, res) => mylist_append<a>(xs, res), list0_nil)
//
(* ****** ****** *)
//
extern
fun{a:t@ype}
mylist_mcons(list0(list0(a)), a): list0(list0(a))
//
implement
{a}(*tmp*)
mylist_mcons(xss, x0) =
mylist_map_cloref<list0(a),list0(a)>(xss, lam(xs) => list0_cons(x0, xs))
//
(* ****** ****** *)
//
extern
fun
{a:t@ype}
mylist_exists_cloref(list0(a), (a) -<cloref1> bool): bool
and
mylist_forall_cloref(list0(a), (a) -<cloref1> bool): bool
//
(* ****** ****** *)

implement
{a}(*tmp*)
mylist_exists_cloref
  (xs, pred) = let
//
exception True of ()
//
in
//
try
//
mylist_foldleft_cloref<a,bool>
( xs, false
, lam(_, x) =>
    if pred(x) then $raise True() else false
  // end of [lam]
) (* end of [mylist_foldleft_cloref] *)
//
with ~True((*void*)) => true
//
end // end of [mylist_exists]

implement
{a}(*tmp*)
mylist_forall_cloref
  (xs, pred) = let
//
exception False of ()
//
in
//
try
//
mylist_foldleft_cloref<a,bool>
( xs, true
, lam(_, x) =>
    if pred(x) then true else $raise False()
  // end of [lam]
) (* end of [mylist_foldleft_cloref] *)
//
with ~False((*void*)) => false
//
end // end of [mylist_forall]

(* ****** ****** *)
//
extern
fun
{a1,a2,b:t@ype}
mylist2_foldleft_cloref
  (xs: list0(a1), ys: list0(a2), init: b, fopr: (b, a1, a2) -<cloref1> b): b
//
implement
{a1,a2,b}(*tmp*)
mylist2_foldleft_cloref
  (xs, ys, init, fopr) = let
//
fun
aux
(
  xs: list0(a1), ys: list0(a2), init: b
) : b =
(
case+ (xs, ys) of
| (list0_nil(), _) => init
| (_, list0_nil()) => init
| (list0_cons(x, xs), list0_cons(y, ys)) => aux(xs, ys, fopr(init, x, y))
)
//
in
  aux(xs, ys, init)
end // end of [mylist2_foldleft_cloref]
//
(* ****** ****** *)
//
extern
fun
{a1,a2,b:t@ype}
mylist2_foldright_cloref
  (xs: list0(a1), ys: list0(a2), fopr: (a1, a2, b) -<cloref1> b, sink: b): b
//
implement
{a1,a2,b}(*tmp*)
mylist2_foldright_cloref
  (xs, ys, fopr, sink) = let
//
fun
aux
(
  xs: list0(a1), ys: list0(a2), sink: b
) : b =
(
case+ (xs, ys) of
| (list0_nil(), _) => sink
| (_, list0_nil()) => sink
| (list0_cons(x, xs), list0_cons(y, ys)) => fopr(x, y, aux(xs, ys, sink))
)
//
in
  aux(xs, ys, sink)
end // end of [mylist2_foldleft_cloref]
//
(* ****** ****** *)
//
extern
fun
{a,b:t@ype}
mylist2_zip(list0(a), list0(b)): list0($tup(a, b))
//
implement
{a,b}
mylist2_zip(xs, ys) =
mylist2_foldright_cloref<a,b,list0($tup(a,b))>
  (xs, ys, lam(x, y, res) => list0_cons($tup(x, y), res), list0_nil())
//
(* ****** ****** *)

(* end of [mylist.dats] *)
