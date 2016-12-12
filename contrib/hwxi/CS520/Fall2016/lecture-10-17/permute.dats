(* ****** ****** *)
//
// HX: Permutation
//
(* ****** ****** *)
//
stacst fact : int -> int
//
extern
prfun
lemma_fact_0 :
  () -<prf> [fact(0)==1] void
extern
prfun
lemma_fact_pos :
  {n:pos} () -<prf> [fact(n)==n*fact(n-1)] void
//
(* ****** ****** *)
//
extern
fun
{a:t0ype}
permute{n:nat}
  (xs: list(a, n)): list(list(a, n), fact(n))
//
(* ****** ****** *)
//
extern
fun
{a:t0ype}
insert_all{n:nat}
  (x0: a, ys: list(a, n)): list(list(a, n+1), n+1)
//
extern
fun
{a:t0ype}
concat_eqlen
  {m,n:int}(xss: list(list(a, n), m)): list(a, m*n)
//
(* ****** ****** *)

implement
{a}(*tmp*)
insert_all
  {n}(x0, ys) =
(
case+ ys of
| list_nil() =>
  list_sing(list_sing(x0))
| list_cons(y0, ys1) =>
  list_cons
  (
    list_cons(x0, ys)
  , list_vt2t(list_map_cloref<list(a, n)><list(a, n+1)>(insert_all(x0, ys1), lam(zs) => list_cons(y0, zs)))
  ) (* end of [list_cons] *)
) (* end of [insert_all] *)

(* ****** ****** *)

implement
{a}(*tmp*)
concat_eqlen
  (xss) =
(
  case+ xss of
  | list_nil() => list_nil()
  | list_cons(xs, xss) => list_append(xs, concat_eqlen(xss))
)

(* ****** ****** *)

implement
{a}(*tmp*)
permute(xs) = let
//
fun
helper
{n:nat}
(
xs: list(a, n)
) : list(list(a, n), fact(n)) =
(
case+ xs of
| list_nil() => let
    prval () = lemma_fact_0()
  in
    list_cons(list_nil(), list_nil())
  end // end of [list_nil]
| list_cons
    (x0, xs1) => let
//
    prval () = lemma_fact_pos{n}()
//
    val res =
      helper(xs1) // list(list(a, n-1), fact(n-1))
    val ress =
      list_map_cloref<list(a,n-1)><list(list(a, n), n)>(res, lam ys => insert_all(x0, ys))
    val ress = list_vt2t(ress)
  in
    concat_eqlen(ress) // list(list(a, n), n*fact(n-1))
  end // end of [list_cons]
)
//
in
  helper(xs)
end // end of [permute]

(* ****** ****** *)

(* end of [permute.dats] *)
