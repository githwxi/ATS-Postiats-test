(* ****** ****** *)
//
// For use in
// Crash into ATS
//
(* ****** ****** *)
//
(*
#include
"share/atspre_staload.hats"
#include
"share/atspre_staload_libats_ML.hats"
*)
//
(* ****** ****** *)
//
(*
symelim iseqz
symelim isneqz
*)
//
symelim .head
symelim .tail
//
symelim .drop
symelim .take
//
symelim .foreach
symelim .foldleft
symelim .foldright
//
(* ****** ****** *)
//
extern
fun{}
int_foreach
( n0: int
, fwork: cfun(int, void)): void
extern
fun{}
int_foreach_method
(n0: int)(fwork: cfun(int, void)): void
//
overload
.foreach with int_foreach_method of 100
//
(* ****** ****** *)

implement
{}(*tmp*)
int_foreach
  (n0, fwork) =
  loop(0) where
{
//
fun loop(i: int): void =
  if i < n0 then (fwork(i); loop(i+1))
//
} (* end of [int_foreach] *)

implement
{}(*tmp*)
int_foreach_method(n0) =
lam(fwork) => int_foreach<>(n0, fwork)

(* ****** ****** *)
//
extern
fun
{res:t@ype}
int_foldleft
( n0: int
, res: res
, fopr: cfun(res, int, res)): res
extern
fun
{res:t@ype}
int_foldleft_method
(n0: int, ty: TYPE(res))
(res: res, fopr: cfun(res, int, res)): res
//
overload .foldleft with int_foldleft_method of 100
//
(* ****** ****** *)
//
extern
fun
{res:t@ype}
int_foldright
( n0: int
, fopr: cfun(int, res, res), res: res): res
extern
fun
{res:t@ype}
int_foldright_method
(n0: int, ty: TYPE(res))
(fopr: cfun(int, res, res), res: res): res
//
overload .foldright with int_foldright_method of 100
//
(* ****** ****** *)
//
implement
{res}(*tmp*)
int_foldleft
  (n0, res, fopr) =
  loop(res, 0) where
{
//
fun loop(res: res, i: int): res =
  if i < n0
    then loop(fopr(res, i), i+1) else res
  // end of [if]
//
} (* end of [int_foldleft] *)
//
implement
{res}(*tmp*)
int_foldleft_method(n0, ty) =
lam(res, fopr) => int_foldleft<res>(n0, res, fopr)
//
(* ****** ****** *)
//
implement
{res}(*tmp*)
int_foldright
  (n0, fopr, res) =
  loop(n0, res) where
{
//
fun loop(i: int, res: res): res =
  if i > 0
    then loop(i-1, fopr(i-1, res)) else res
  // end of [if]
//
} (* end of [int_foldright] *)
//
implement
{res}(*tmp*)
int_foldright_method(n0, ty) =
lam(res, fopr) => int_foldright<res>(n0, res, fopr)
//
(* ****** ****** *)
//
extern
fun{}
int_cross_foreach
(m: int, n: int, fwork: cfun(int, int, void)): void
//
implement
{}(*tmp*)
int_cross_foreach
  (m, n, fwork) =
  int_foreach(m, lam(i) => int_foreach(n, lam(j) => fwork(i, j)))
//
(* ****** ****** *)
//
extern
fun{}
int_exists
(n: int, test: cfun(int, bool)): bool
extern
fun{}
int_forall
(n: int, test: cfun(int, bool)): bool
//
(* ****** ****** *)
//
implement
{}(*tmp*)
int_exists
(n, test) =
(
fix
f(i:int): bool =<cloref1>
if i < n
  then (if test(i) then true else f(i+1)) else false
// end of [if]
)(0) // end of [int_exists]
//
implement
{}(*tmp*)
int_forall
(n, test) =
(
fix
f(i:int): bool =<cloref1>
if i < n
  then (if test(i) then f(i+1) else false) else true
// end of [if]
)(0) // end of [int_forall]
//
(* ****** ****** *)
//
// For list0-values
//
(* ****** ****** *)
//
extern
fun{}
list0_is_nil{a:t@ype}(list0(a)): bool
extern
fun{}
list0_is_cons{a:t@ype}(list0(a)): bool
//
implement
{}(*tmp*)
list0_is_nil(xs) =
(case+ xs of list0_nil() => true | _ => false)
implement
{}(*tmp*)
list0_is_cons(xs) =
(case+ xs of list0_cons _ => true | _ => false)
//
overload iseqz with list0_is_nil of 100
overload isneqz with list0_is_cons of 100
//
(* ****** ****** *)
//
extern
fun
{a:t@ype}
list0_length(xs0: list0(INV(a))): int
//
(*
implement
list0_length
(
case+ xs0 of
| list0_nil() => 0
| list0_cons(x0, xs1) => 1 + list0_length<a>(xs1)
) (* end of [list0_length] *)
*)
//
(* ****** ****** *)
//
extern
fun
{a:t@ype}
list0_append
(xs: list0(INV(a)), ys: list0(a)): list0(a)
//
extern
fun
{a:t@ype}
list0_concat(xs: list0(list0(INV(a)))): list0(a)
//
(* ****** ****** *)
//
extern
fun
{a:t@ype}
list0_reverse(xs: list0(INV(a))): list0(a)
and
list0_revappend
(xs: list0(INV(a)), ys: list0(a)): list0(a)
//
(* ****** ****** *)
//
extern
fun
{a:t@ype}
list0_head_exn(xs: list0(INV(a))): (a)
extern
fun
{a:t@ype}
list0_tail_exn(xs: list0(INV(a))): list0(a)
//
implement
{a}(*tmp*)
list0_head_exn(xs) =
let val-list0_cons(x0, _) = xs in x0 end
implement
{a}(*tmp*)
list0_tail_exn(xs) =
let val-list0_cons(_, xs) = xs in xs end
//
overload .head with list0_head_exn of 100
overload .tail with list0_tail_exn of 100
//
(* ****** ****** *)
//
extern
fun
{a:t@ype}
list0_get_at_exn
(xs: list0(INV(a)), n: int): a
//
implement
{a}(*tmp*)
list0_get_at_exn
  (xs, n) =
(
case- xs of
(*
| list0_nil() =>
  $raise ListSubscriptExn()
*)
| list0_cons(x, xs) =>
  if n <= 0
    then x else list0_get_at_exn<a>(xs, n-1)
  // end of [list0_cons]
)
//
overload [] with list0_get_at_exn of 100
//
(* ****** ****** *)
//
extern
fun
{a:t@ype}
list0_drop_exn(list0(INV(a)), int): list0(a)
extern
fun
{a:t@ype}
list0_take_exn(list0(INV(a)), int): list0(a)
//
implement
{a}(*tmp*)
list0_drop_exn
  (xs, n) =
(
if
n > 0
then let
//
val-
list0_cons(_, xs) = xs
//
in
  list0_drop_exn<a>(xs, n-1)
//
end // end of [then]
else (xs) // end of [else]
//
) (* list0_drop_exn *)
//
implement
{a}(*tmp*)
list0_take_exn
  (xs, n) =
(
if
n > 0
then let
//
val-
list0_cons(x, xs) = xs
//
in
  list0_cons(x, list0_take_exn(xs, n-1))
end // end of [then]
else list0_nil() // end of [else]
//
) (* list0_take_exn *)
//
overload .drop with list0_drop_exn of 100
overload .take with list0_take_exn of 100
//
(* ****** ****** *)
//
extern
fun
{r:t@ype}
{a:t@ype}
list0_foldleft
(
xs: list0(INV(a)), r0: r, fopr: cfun(r, a, r)
) : (r) // end of [list0_foldleft]
//
implement
{r}{a}
list0_foldleft
(xs, r0, fopr) =
  loop(xs, r0) where
{
fun
loop(xs: list0(a), r0: r): r =
case+ xs of
| list0_nil() => r0
| list0_cons(x, xs) => loop(xs, fopr(r0, x))
}
//
(* ****** ****** *)
//
extern
fun
{a:t@ype}
{r:t@ype}
list0_foldright
(
xs: list0(INV(a)), fopr: cfun(a, r, r), r0: r
) : (r) // end of [list0_foldright]
//
implement
{a}{r}
list0_foldright
( xs
, fopr, r0) =
auxlst(xs) where
{
fun
auxlst
(xs: list0(a)): r =
(
case+ xs of
| list0_nil() => r0
| list0_cons(x, xs) => fopr(x, auxlst(xs))
) (* end of [auxlst] *)
}
//
(* ****** ****** *)
//
implement
{a}(*tmp*)
list0_length(xs) =
  list0_foldleft<int><a>(xs, 0, lam(r, _) => r + 1)
//
(* ****** ****** *)
//
implement
{a}(*tmp*)
list0_append(xs, ys) =
  list0_foldright<a><list0(a)>
  (xs, lam(x, ys) => list0_cons(x, ys), ys)
//
implement
{a}(*tmp*)
list0_concat(xss) =
  list0_foldright<list0(a)><list0(a)>
  (xss, lam(xs, res) => list0_append(xs, res), list0_nil())
//
(* ****** ****** *)
//
implement
{a}(*tmp*)
list0_reverse(xs) =
  list0_revappend<a>(xs, list0_nil())
//
implement
{a}(*tmp*)
list0_revappend(xs, ys) =
  list0_foldleft<list0(a)><a>(xs, ys, lam(ys, x) => list0_cons(x, ys))
//
(* ****** ****** *)
//
(*
extern
fun
{a:t@ype}
fprint_val
(out: FILEref, x0: a): void
//
implement
fprint_val<int> = fprint_int
implement
fprint_val<double> = fprint_double
implement
fprint_val<string> = fprint_string
//
*)
//
(* ****** ****** *)
//
extern
fun
{a:t@ype}
print_list0
(xs: list0(INV(a))): void
extern
fun
{a:t@ype}
fprint_list0
(out: FILEref, xs: list0(INV(a))): void
//
overload print with print_list0 of 100
overload fprint with fprint_list0 of 100
//
(* ****** ****** *)
//
implement
{a}(*tmp*)
print_list0(xs) =
fprint_list0<a>(stdout_ref, xs)
//
implement
{a}(*tmp*)
fprint_list0(out, xs) = let
//
fun
loop(i: int, xs: list0(a)): void =
(
case+ xs of
| list0_nil() => ()
| list0_cons(x, xs) =>
  (
    if i > 0
      then fprint(out, ", ");
    // end of [if]
    fprint_val<a>(out, x); loop(i+1, xs)
  )
)
//
in
  loop(0, xs)
end // end of [fprint_list0]
//
(* ****** ****** *)

extern
fun
{a:t@ype}
{b:t@ype}
list0_map
(xs: list0(INV(a)), fopr: cfun(a, b)): list0(b)
extern
fun
{a:t@ype}
{b:t@ype}
list0_mapopt
(xs: list0(INV(a)), fopr: cfun(a, option0(b))): list0(b)

(* ****** ****** *)
//
(*
extern
fun
{a:t@ype}
list0_tabulate
  (n: int, fopr: cfun(int, a)): list0(a)
*)
//
(* ****** ****** *)
//
extern
fun
{a:t@ype}
list0_foreach
(xs: list0(INV(a)), fwork: cfun(a, void)): void
//
(* ****** ****** *)

extern
fun
{a:t@ype}
list0_filter
(xs: list0(INV(a)), pred: cfun(a, bool)): list0(a)

(* ****** ****** *)

implement
{a}{b}
list0_map
(
  xs, fopr
) = auxlst(xs) where
{
//
fun
auxlst
(xs: list0(a)): list0(b) =
(
case+ xs of
| list0_nil() =>
  list0_nil()
| list0_cons(x, xs) =>
  list0_cons(fopr(x), auxlst(xs))
)
//
} (* end of [list0_map] *)

(* ****** ****** *)

implement
{a}{b}
list0_mapopt
(
  xs, fopr
) = auxlst(xs) where
{
//
fun
auxlst
(xs: list0(a)): list0(b) =
(
case+ xs of
| list0_nil() =>
  list0_nil()
| list0_cons(x, xs) =>
  (
  case+ fopr(x) of
  | None0() => auxlst(xs)
  | Some0(y) => list0_cons(y, auxlst(xs))
  )
)
//
} (* end of [list0_mapopt] *)

(* ****** ****** *)
//
extern
fun
{a:t@ype}
list0_mapcons
( x0: a
, xss: list0(list0(a))): list0(list0(a))
//
implement
{a}(*tmp*)
list0_mapcons
  (x0, xss) =
(
list0_map<list0(a)><list0(a)>(xss, lam(xs) => list0_cons(x0, xs))
) (* list0_mapcons *)
//
(* ****** ****** *)
//
extern
fun
{a:t@ype}
{b:t@ype}
list0_mapjoin
( xs: list0(INV(a))
, fopr: cfun(a, list0(b))): list0(b)
//
implement
{a}{b}
list0_mapjoin
  (xs, fopr) =
(
  list0_concat<b>(list0_map<a><list0(b)>(xs, fopr))
)
//
(* ****** ****** *)

implement
{a}(*tmp*)
list0_foreach
(
  xs, fwork
) = loop(xs) where
{
//
fun
loop
(xs: list0(a)): void =
(
case+ xs of
| list0_nil() => ()
| list0_cons(x, xs) => (fwork(x); loop(xs))
)
//
} (* end of [list0_foreach] *)

(* ****** ****** *)

implement
{a}(*tmp*)
list0_filter
(
  xs, test
) = auxlst(xs) where
{
//
fun
auxlst
(xs: list0(a)): list0(a) =
(
case+ xs of
| list0_nil() =>
  list0_nil()
| list0_cons(x, xs) =>
  if test(x)
    then list0_cons(x, auxlst(xs)) else auxlst(xs)
  // end of [if]
)
//
} (* end of [list0_filter] *)

(* ****** ****** *)
//
extern
fun
{a:t@ype}
int_list0_map
( n: int
, fopr: cfun(int, a)): list0(a)
extern
fun
{a:t@ype}
int_list0_mapopt
( n: int
, fopr: cfun(int, option0(a))): list0(a)
//
(* ****** ****** *)
//
implement
{a}(*tmp*)
int_list0_map
  (n, fopr) =
  auxmain(0) where
{
fun
auxmain
(
 i: int
) : list0(a) =
if
(i < n)
then
(
  list0_cons(fopr(i), auxmain(i+1))
) else list0_nil((*void*))
} (* end of [int_list0_map] *)
//
implement
{a}(*tmp*)
int_list0_mapopt
  (n, fopr) =
  auxmain(0) where
{
//
fun
auxmain
(
 i: int
) : list0(a) =
if
(i < n)
then
(
  case+ fopr(i) of
  | None0() => auxmain(i+1)
  | Some0(x) => list0_cons(x, auxmain(i+1))
) else list0_nil((*void*))
//
} (* end of [int_list0_mapopt] *)
//
(* ****** ****** *)
//
extern
fun
{a:t@ype}
list0_find_index
(xs: list0(INV(a)), test: cfun(a, bool)): int
//
implement
{a}(*tmp*)
list0_find_index
  (xs, test) = let
//
fun
loop
(xs: list0(a), i: int): int =
(
case+ xs of
| list0_nil() => ~1
| list0_cons(x, xs) =>
  if test(x) then i else loop(xs, i+1)
)
//
in
  loop(xs, 0)
end // end of [list0_find_index]
//
(* ****** ****** *)
//
(*
extern
fun
{a:t@ype}
list0_find_suffix
( xs: list0(INV(a))
, test: cfun(a, bool)): option0(list0(a))
//
implement
{a}(*tmp*)
list0_find_suffix
  (xs, test) =
  auxmain(xs) where
{
//
fun
auxmain
(
xs: list0(a)
) : option0(list0(a)) =
(
case+ xs of
| list0_nil() =>
  None0((*void*))
| list0_cons(x0, xs1) =>
  if test(x0) then Some0(xs) else auxmain(xs1)
)
//
} (* end of [list0_find_suffix] *)
*)
//
(* ****** ****** *)
//
extern
fun
{a:t@ype}
list0_find_suffix
( xs: list0(INV(a))
, test: cfun(list0(a), bool)): list0(a)
//
implement
{a}(*tmp*)
list0_find_suffix
  (xs, test) =
  loop(xs) where
{
//
fun
loop
(
xs: list0(a)
) : list0(a) =
(
case+ xs of
| list0_nil() =>
  list0_nil((*void*))
| list0_cons(x0, xs1) =>
  if test(xs) then xs else loop(xs1)
)
//
} (* end of [list0_find_suffix] *)
//
(* ****** ****** *)
//
extern
fun
{a:t@ype}
list0_exists
(xs: list0(INV(a)), test: cfun(a, bool)): bool
extern
fun
{a:t@ype}
list0_forall
(xs: list0(INV(a)), test: cfun(a, bool)): bool
//
implement
{a}(*tmp*)
list0_exists(xs, test) =
list0_find_index<a>(xs, test) >= 0
implement
{a}(*tmp*)
list0_forall(xs, test) =
list0_find_index<a>(xs, lam(x) => not(test(x))) < 0
//
(* ****** ****** *)
//
extern
fun
{a,b:t@ype}
list0_cross
( xs: list0(INV(a))
, ys: list0(INV(b))): list0($tup(a, b))
//
implement
{a,b}(*tmp*)
list0_cross
  (xs, ys) = let
//
typedef ab = $tup(a, b)
//
in
//
list0_concat
(
list0_map<a><list0(ab)>
( xs
, lam(x) =>
  list0_map<b><ab>(ys, lam(y) => $tup(x, y)))
) (* end of [list0_concat] *)
//
end // end of [list0_cross]
//
(* ****** ****** *)
//
extern
fun
{a:t@ype}
{b:t@ype}
list0_imap
(xs: list0(INV(a)), fopr: cfun(int, a, b)): list0(b)
//
implement
{a}{b}
list0_imap
(
  xs, fopr
) = auxlst(0, xs) where
{
//
fun
auxlst
(i: int, xs: list0(a)): list0(b) =
(
case+ xs of
| list0_nil() =>
  list0_nil()
| list0_cons(x, xs) =>
  list0_cons(fopr(i, x), auxlst(i+1, xs))
)
//
} (* end of [list0_imap] *)
//
(* ****** ****** *)
//
extern
fun
{a:t@ype}
list0_iforeach
( xs: list0(INV(a))
, fwork: cfun(int, a, void)): void
//
implement
{a}(*tmp*)
list0_iforeach
(
  xs, fwork
) = loop(0, xs) where
{
//
fun
loop
(i: int, xs: list0(a)): void =
(
case+ xs of
| list0_nil() => ()
| list0_cons(x, xs) => (fwork(i, x); loop(i+1, xs))
)
//
} (* end of [list0_iforeach] *)
//
(* ****** ****** *)
//
extern
fun
{a:t@ype}
list0_iexists
(xs: list0(INV(a)), test: cfun(int, a, bool)): bool
extern
fun
{a:t@ype}
list0_iforall
(xs: list0(INV(a)), test: cfun(int, a, bool)): bool
//
implement
{a}(*tmp*)
list0_iexists
(xs, test) =
loop(0, xs) where
{
fun loop(i: int, xs: list0(a)): bool =
  case+ xs of
  | list0_nil() => false
  | list0_cons(x, xs) =>
    if test(i, x) then true else loop(i+1, xs)
}
//
implement
{a}(*tmp*)
list0_iforall
(xs, test) =
loop(0, xs) where
{
fun loop(i: int, xs: list0(a)): bool =
  case+ xs of
  | list0_nil() => true
  | list0_cons(x, xs) =>
    if test(i, x) then loop(i+1, xs) else false
}
//
(* ****** ****** *)

extern
fun {
a,b:t@ype
} list0_zip
  (xs: list0(a), ys: list0(b)): list0($tup(a, b))
//
implement
{a,b}
list0_zip(xs, ys) =
(
case xs of
| list0_nil() =>
  list0_nil()
| list0_cons(x, xs) =>
  (
    case+ ys of
    | list0_nil() =>
      list0_nil()
    | list0_cons(y, ys) =>
      list0_cons($tup(x, y), list0_zip<a,b>(xs, ys))
  )
)

(* ****** ****** *)

extern
fun
{a
,b:t@ype}
{c:t@ype}
list0_map2
(xs: list0(a), ys: list0(b), fopr: cfun(a, b, c)): list0(c)
//
implement
{a,b}{c}
list0_map2
(xs, ys, fopr) =
(
case xs of
| list0_nil() =>
  list0_nil()
| list0_cons(x, xs) =>
  (
    case+ ys of
    | list0_nil() =>
      list0_nil()
    | list0_cons(y, ys) =>
      list0_cons(fopr(x, y), list0_map2<a,b><c>(xs, ys, fopr))
  ) (* end of [list0_cons] *)
)

(* ****** ****** *)
//
extern
fun
{a:t@ype}
{b:t@ype}
option0_map
(option0(INV(a)), fopr: cfun(a, b)): option0(b)
//
implement
{a}{b}
option0_map
  (opt, fopr) =
(
case+ opt of
| None0() => None0() | Some0(x) => Some0(fopr(x))
)
//
(* ****** ****** *)
//
extern
fun
{a:t@ype}
list0_merge
( xs: list0(a)
, ys: list0(a), cmp: cfun(a, a, int)): list0(a)
//
implement
{a}(*tmp*)
list0_merge
(xs0, ys0, cmp) = let
//
fun
auxlst
( xs0: list0(a)
, ys0: list0(a)
) : list0(a) = (
//
case+ xs0 of
| list0_nil() => ys0
| list0_cons
    (x1, xs1) => (
    case+ ys0 of
    | list0_nil() => xs0
    | list0_cons
        (y1, ys1) => let
        val sgn = cmp(x1, y1)
      in
        if (sgn <= 0)
          then list0_cons(x1, auxlst(xs1, ys0))
          else list0_cons(y1, auxlst(xs0, ys1))
        // end of [if]
      end // end of [list0_cons]
  ) (* end of [list0_cons] *)
//
) (* end of [auxlst] *)
//
in
  auxlst(xs0, ys0)
end // end of [list0_merge]

(* ****** ****** *)
//
extern
fun
{a:t@ype}
list0_mergesort
(xs: list0(INV(a)), cmp: cfun(a, a, int)): list0(a)
//
implement
{a}(*tmp*)
list0_mergesort
  (xs, cmp) = let
//
// It is assumed
// that length(xs) = n
//
fun
msort
(xs: list0(a), n: int): list0(a) =
if
(n >= 2)
then let
  val n1 = n / 2
  val xs1 = list0_take_exn<a>(xs, n1)
  val xs2 = list0_drop_exn<a>(xs, n1)
in
  list0_merge<a>(msort(xs1, n1), msort(xs2, n-n1), cmp)
end // end of [then]
else (xs) // end of [else]
//
in
  msort(xs, list0_length<a>(xs))
end // end of [list0_mergesort]

(* ****** ****** *)
//
macdef
list0_sing(x) =
list0_cons(,(x), list0_nil())
//
(* ****** ****** *)

extern
fun
{a:t@ype}
list0_choose2
(xs: list0(a)): list0($tup(a, a))
//
extern
fun
{a:t@ype}
list0_choose2
(xs: list0(a)): list0($tup(a, a))
//
implement
{a}(*tmp*)
list0_choose2
  (xs) = let
//
typedef aa = $tup(a, a)
//
in
//
case+ xs of
| list0_nil() =>
  list0_nil()
| list0_cons(x0, xs) =>
  list0_append<aa>
  (list0_map<a><aa>(xs, lam(x) => $tup(x0, x)), list0_choose2(xs))
//
end // end of [list0_choose2]

(* ****** ****** *)
//
extern
fun
{a:t@ype}
list0_nchoose
(xs: list0(a), n: int): list0(list0(a))
//
extern
fun
{a:t@ype}
list0_nchoose_rest
(xs: list0(INV(a)), n: int): list0($tup(list0(a), list0(a)))
//
(* ****** ****** *)

implement
{a}(*tmp*)
list0_nchoose
  (xs, n) =
  auxlst(xs, n) where
{
//
typedef xs = list0(a)
//
fun
auxlst
(
xs: xs, n: int
) : list0(xs) =
(
if
(n <= 0)
then
list0_sing(list0_nil())
else
(
case+ xs of
| list0_nil() =>
  list0_nil()
| list0_cons(x0, xs) =>
  list0_append<xs>(list0_mapcons(x0, auxlst(xs, n-1)), auxlst(xs, n))
) (* end of [else] *)
)
//
} (* end of [list0_nchoose] *)

(* ****** ****** *)

implement
{a}(*tmp*)
list0_nchoose_rest
  (xs, n) =
  auxlst(xs, n) where
{
//
typedef xs = list0(a)
typedef xsxs = $tup(xs, xs)
//
fun
auxlst
(
xs: xs, n: int
) : list0(xsxs) =
(
if
(n <= 0)
then
list0_sing
($tup(list0_nil(), xs))
else
(
case+ xs of
| list0_nil() =>
  list0_nil()
| list0_cons(x0, xs) => let
    val res1 =
    list0_map<xsxs><xsxs>
    ( auxlst(xs, n-1)
    , lam($tup(xs1, xs2)) => $tup(list0_cons(x0, xs1), xs2)
    )
    val res2 =
    list0_map<xsxs><xsxs>
    ( auxlst(xs, n-0)
    , lam($tup(xs1, xs2)) => $tup(xs1, list0_cons(x0, xs2))
    )
  in
    list0_append<xsxs>(res1, res2)
  end // end of [list0_cons]
) (* end of [else] *)
)
//
} (* end of [list0_nchoose_rest] *)

(* ****** ****** *)
//
extern
fun{a:t@ype}
array0_size(A: array0(a)): int
extern
fun{a:t@ype}
array0_length(A: array0(a)): int
//
implement
{a}(*tmp*)
array0_size(A) = sz2i(size(A))
implement
{a}(*tmp*)
array0_length(A) = sz2i(size(A))
//
(* ****** ****** *)
//
overload
size with array0_size of 100
overload
.size with array0_size of 100
//
overload
length with array0_length of 100
//
(* ****** ****** *)
//
macdef
ML_array0_make_elt_int =
   array0_make_elt_int
//
extern
fun
{a:t@ype}
array0_make_elt
  (size: int, x0: a): array0(a)
//
implement
{a}(*tmp*)
array0_make_elt
  (size, x0) =
  ML_array0_make_elt_int(size, x0)
//
(* ****** ****** *)
//
macdef
ML_array0_tabulate = array0_tabulate
//
extern
fun
{a:t@ype}
array0_tabulate
  (size: int, fopr: cfun(int, a)): array0(a)
//
implement
{a}(*tmp*)
array0_tabulate
  (size, fopr) = let
//
val size = g1ofg0(size)
val ((*void*)) = assertloc(size >= 0)
//
in
//
ML_array0_tabulate
( i2sz(size)
, lam(i:size_t):a =<cloref1> fopr(sz2i(i)))
//
end // end of [array0_tabulate]
//
(* ****** ****** *)
//
extern
fun
{a:t@ype}
array0_foreach
( xs: array0(INV(a))
, fwork: cfun(int, void)): void
//
(* ****** ****** *)
//
implement
{a}
array0_foreach
(
xs, fwork
) = int_foreach<>(length(xs), fwork)
//
(* ****** ****** *)
//
extern
fun
{a:t@ype}
array0_mapto
( xs: array0(INV(a))
, fopr: cfun(a, a)): void
extern
fun
{a:t@ype}
array0_imapto
( xs: array0(INV(a))
, fopr: cfun(int, a, a)): void
//
implement
{a}
array0_mapto(xs, fopr) =
int_foreach<>
(length(xs), lam(i) => xs[i] := fopr(xs[i]))
//
implement
{a}
array0_imapto(xs, fopr) =
int_foreach<>
(length(xs), lam(i) => xs[i] := fopr(i, xs[i]))
//
(* ****** ****** *)
//
extern
fun
{r:t@ype}
{a:t@ype}
array0_foldleft
(
xs: array0(INV(a)), r0: r, fopr: cfun(r, int, r)
) : (r) // end of [array0_foldleft]
extern
fun
{a:t@ype}
{r:t@ype}
array0_foldright
(
xs: array0(INV(a)), fopr: cfun(int, r, r), r0: r
) : (r) // end of [array0_foldright]
//
(* ****** ****** *)
//
implement
{res}{a}
array0_foldleft(xs, r0, fopr) =
int_foldleft<res>(length(xs), r0, fopr)
//
implement
{a}{res}
array0_foldright(xs, fopr, r0) =
int_foldright<res>(length(xs), fopr, r0)
//
(* ****** ****** *)
//
extern
fun
{a:t@ype}
array0_find_exn
(xs: array0(a), pred: cfun(a, bool)): int
//
implement
{a}(*tmp*)
array0_find_exn
(xs, pred) = loop(0, size(xs)) where
{
  fun
  loop(i: int, n: int): int =
  if
  (i < n)
  then (if pred(xs[i]) then i else loop(i+1, n))
  else $raise NotFoundExn()
}
//
(* ****** ****** *)
//
extern
fun
{a:t@ype}
matrix0_nrow
(xs: matrix0(INV(a))): int
extern
fun
{a:t@ype}
matrix0_ncol
(xs: matrix0(INV(a))): int
//
implement
{a}(*tmp*)
matrix0_nrow(A) = sz2i(A.nrow())
implement
{a}(*tmp*)
matrix0_ncol(A) = sz2i(A.ncol())
//
overload nrow with matrix0_nrow of 100
overload ncol with matrix0_ncol of 100
//
(* ****** ****** *)
//
macdef
ML_matrix0_make_elt = matrix0_make_elt
//
extern
fun
{a:t@ype}
matrix0_make_elt
  (nrow: int, ncol: int, x0: a): matrix0(a)
//
implement
{a}(*tmp*)
matrix0_make_elt
  (nrow, ncol, x0) = ML_matrix0_make_elt(nrow, ncol, x0)
//
(* ****** ****** *)
//
macdef
ML_matrix0_tabulate = matrix0_tabulate
//
extern
fun
{a:t@ype}
matrix0_tabulate
( nrow: int
, ncol: int
, fopr: cfun(int, int, a)): matrix0(a)
//
implement
{a}(*tmp*)
matrix0_tabulate
  (nrow, ncol, fopr) = let
//
val nrow = g1ofg0(nrow)
val ncol = g1ofg0(ncol)
val ((*void*)) = assertloc(nrow >= 0)
val ((*void*)) = assertloc(ncol >= 0)
//
in
//
ML_matrix0_tabulate
( i2sz(nrow)
, i2sz(ncol)
, lam(i:size_t, j: size_t):a =<cloref1> fopr(sz2i(i), sz2i(j))
)
//
end // end of [matrix0_tabulate]
//
(* ****** ****** *)
//
extern
fun
{a:t@ype}
matrix0_foreach_row
( xs: matrix0(INV(a))
, fwork: cfun(int, int, void)): void
//
implement
{a}
matrix0_foreach_row(xss, fwork) =
int_foreach<>
( nrow(xss)
, lam(i) =>
  int_foreach<>(ncol(xss), lam(j) => fwork(i, j))
)
//
(* ****** ****** *)
//
extern
fun
{a:t@ype}
matrix0_foreach_col
( xs: matrix0(INV(a))
, fwork: cfun(int, int, void)): void
//
implement
{a}
matrix0_foreach_col(xss, fwork) =
int_foreach<>
( ncol(xss)
, lam(j) =>
  int_foreach<>(nrow(xss), lam(i) => fwork(i, j))
)
//
(* ****** ****** *)
//
extern
fun
int_stream_from(n: int): stream(int)
//
implement
int_stream_from(n) =
$delay
(
  stream_cons(n, int_stream_from(n+1))
)(*$delay*)(* end of [int_stream_from] *)
//
(* ****** ****** *)
//
extern
fun
{a:t@ype}
stream_make_list0
  (xs: list0(INV(a))): stream(a)
//
implement
{a}(*tmp*)
stream_make_list0(xs) = $delay
(
case+ xs of
| list0_nil() =>
  stream_nil()
| list0_cons(x, xs) =>
  stream_cons(x, stream_make_list0<a>(xs))
)
//
(* ****** ****** *)
//
extern
fun
{a:t@ype}
stream_get_at_exn
  (xs: stream(INV(a)), n: int): a
//
overload [] with stream_get_at_exn of 100
//
implement
{a}(*tmp*)
stream_get_at_exn
  (xs, n) =
(
case- !xs of
(*
| stream_nil() =>
  (
    $raise StreamSubscriptExn()
  )
*)
| stream_cons(x, xs) =>
  (
    if n <= 0
      then (x)
      else stream_get_at_exn<a>(xs, n-1)
    // end of [if]
  )
)
//
(* ****** ****** *)
//
extern
fun
{a:t@ype}
stream_append
(xs: stream(a), ys: stream(a)): stream(a)
//
implement
{a}(*tmp*)
stream_append
(xs, ys) = $delay
(
case+ !xs of
| stream_nil() => !ys
| stream_cons(x, xs) =>
  stream_cons(x, stream_append<a>(xs, ys))
)
//
(* ****** ****** *)
//
extern
fun
{a:t@ype}
stream_concat
  (xss: stream(stream(a))): stream(a)
//
implement
{a}(*tmp*)
stream_concat(xss) = $delay
(
case+ !xss of
| stream_nil() =>
  stream_nil()
| stream_cons(xs, xss) =>
  !(stream_append<a>(xs, stream_concat<a>(xss)))
)
//
(* ****** ****** *)
//
extern
fun
{a:t@ype}
print_stream
(xs: stream(INV(a))): void
extern
fun
{a:t@ype}
fprint_stream
(out: FILEref, xs: stream(INV(a))): void
//
overload print with print_stream of 100
overload fprint with fprint_stream of 100
//
(* ****** ****** *)
//
extern
fun{}
fprint_stream$limit(): int 
//
implement
{}(*tmp*)
fprint_stream$limit() = 100
//
implement
{a}(*tmp*)
print_stream(xs) =
fprint_stream<a>(stdout_ref, xs)
//
implement
{a}(*tmp*)
fprint_stream(out, xs) = let
//
val N = fprint_stream$limit<>()
//
fun
loop(i: int, xs: stream(a)): void =
if
(i < N)
then
(
case+ !xs of
| stream_nil() => ()
| stream_cons(x, xs) =>
  (
    if i > 0
      then fprint(out, ", ");
    // end of [if]
    fprint_val<a>(out, x); loop(i+1, xs)
  )
)
//
in
  loop(0, xs)
end // end of [fprint_stream]
//
(* ****** ****** *)
//
extern
fun
{a:t@ype}
{b:t@ype}
stream_map
( xs: stream(a)
, fopr: cfun(a, b)): stream(b)
//
implement
{a}{b}
stream_map
  (xs, fopr) = $delay
(
case+ !xs of
| stream_nil() =>
  stream_nil()
| stream_cons(x, xs) =>
  stream_cons
  (fopr(x), stream_map<a><b>(xs, fopr))
)
//
(* ****** ****** *)
//
extern
fun
{a:t@ype}
stream_filter
( xs: stream(a)
, test: cfun(a, bool)): stream(a)
//
implement
{a}(*tmp*)
stream_filter
  (xs, test) = $delay
(
case+ !xs of
| stream_nil() =>
  stream_nil()
| stream_cons(x, xs) =>
  if test(x)
    then
    stream_cons
      (x, stream_filter<a>(xs, test))
    // end of [then]
    else !(stream_filter<a>(xs, test))
  // end of [if]
)
//
(* ****** ****** *)
//
extern
fun{a:t0p}
streamize_list0_elt
  (list0(INV(a))):<!wrt> stream(a)
//
implement
{a}(*tmp*)
streamize_list0_elt
  (xs) = $delay
(
case+ xs of
| list0_nil() =>
  stream_nil()
| list0_cons(x, xs) =>
  stream_cons(x, streamize_list0_elt<a>(xs))
)
//
(* ****** ****** *)
//
extern
fun{}
fpath_get_lines_stringlst
  (fpath: string): stringlst0
//
implement
{}(*tmp*)
fpath_get_lines_stringlst
  (fpath) = let
//
val-~Some_vt(inp) =
fileref_open_opt(fpath, file_mode_r)
//
in
  fileref_get_lines_stringlst(inp)
end // end of [fpath_get_lines_stringlst]
//
(* ****** ****** *)

local
//
#staload
M =
"libats/libc/SATS/math.sats"
//
val sqrt = $M.sqrt_double
//
in (* in-of-local *)

extern
fun{}
list0_stdev
(xs: list0(double)): double
//
implement
{}(*tmp*)
list0_stdev(xs) = let
//
fun
loop
( xs: list0(double)
, s0: int, s1: double, s2: double
) : double =
(
case+ xs of
| list0_nil() =>
  sqrt(s0*s2-s1*s1)/s0
| list0_cons(x, xs) =>
  loop(xs, s0+1, s1+x, s2+x*x)
)
//
in
  if isneqz(xs) then loop(xs, 0, 0.0, 0.0) else 0.0
end // end of [list0_stdev]

end // end of [local]

(* ****** ****** *)

implement
(a1:t@ype
,a2:t@ype)
fprint_val<(a1,a2)> = fprint_tupval2<a1,a2>
implement
(a1:t@ype
,a2:t@ype
,a3:t@ype)
fprint_val<(a1,a2,a3)> = fprint_tupval3<a1,a2,a3>
implement
(a1:t@ype
,a2:t@ype
,a3:t@ype
,a4:t@ype)
fprint_val<(a1,a2,a3,a4)> = fprint_tupval4<a1,a2,a3,a4>

(* ****** ****** *)

implement
(a1:t@ype
,a2:t@ype)
fprint_val<$tup(a1,a2)> = fprint_tupbox2<a1,a2>
implement
(a1:t@ype
,a2:t@ype
,a3:t@ype)
fprint_val<$tup(a1,a2,a3)> = fprint_tupbox3<a1,a2,a3>
implement
(a1:t@ype
,a2:t@ype
,a3:t@ype
,a4:t@ype)
fprint_val<$tup(a1,a2,a3,a4)> = fprint_tupbox4<a1,a2,a3,a4>

(* ****** ****** *)

(* end of [class.dats] *)
