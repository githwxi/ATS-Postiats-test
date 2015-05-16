(*
** Code used during lecture-03-16
*)

(* ****** ****** *)

#include
"share/atspre_staload.hats"

(* ****** ****** *)

extern
fun
permgen(n: int): List(List(int))

(* ****** ****** *)

extern
fun
insert_at_one (xs: List(int), x0: int, i: int): List(int)
extern
fun
insert_at_all (xs: List(int), x0: int): List(List(int))

extern
fun
{a:t@ype}
{b:t@ype}
list_map{n:nat}
  (list(a, n), fopr: a -<cloref1> b): list(b, n)

extern
fun
{a:t@ype}
list_concat(List(List(a))): List(a)

implement
permgen(n) =
if
n = 0
then list_sing(list_nil)
else let
  val xss = permgen(n-1) // |xss| = (n-1)!
  typedef a = List(int)
  typedef b = List(List(int))
  prval () = lemma_list_param(xss)
  val xsss = list_map<a><b>(xss, lam (xs) => insert_at_all(xs, n))
in
  list_concat(xsss)
end

(* ****** ****** *)

extern
fun
permgen{n:nat}(n: int(n)): List(list(int, n))

(* ****** ****** *)

extern
fun
{a:t@ype}
insert_at_one{n:nat}{i:nat | i <= n}
  (xs: list(a, n), x0: a, i: int(i)): list(a, n+1)

extern
fun
{a:t@ype}
insert_at_all{n:nat}
  (xs: list(a, n), x0: a): list(list(a, n+1), n+1)

extern
fun
{a:t@ype}
{b:t@ype}
list_map{n:nat}
  (list(a, n), fopr: a -<cloref1> b): list(b, n)

extern
fun
{a:t@ype}
list_concat{m,n:nat}(list(list(a, n), m)): list(a, m*n)

implement
permgen{n}(n) =
if
n = 0
then list_sing(list_nil)
else let
  val xss = permgen(n-1) // |xss| = (n-1)!
  typedef a = list(int, n-1)
  typedef b = list(list(int, n), n)
  prval () = lemma_list_param(xss)
  val xsss = list_map<a><b>(xss, lam (xs) => insert_at_all(xs, n))
in
  list_concat(xsss)
end

(* ****** ****** *)

(* end of [permgen.dats] *)
