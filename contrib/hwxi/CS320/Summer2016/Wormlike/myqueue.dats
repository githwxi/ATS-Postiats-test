(* ****** ****** *)
//
// 2-list-based
// queue implementation
//
(* ****** ****** *)
//
#include
"share/atspre_define.hats"
#include
"{$LIBATSCC2PY3}/staloadall.hats"
//
(* ****** ****** *)
//
abstype
queue_type(a:t@ype) = ptr
typedef
queue(a:t@ype) = queue_type(a)
//
(* ****** ****** *)
//
extern
fun
{a:t@ype}
queue_make_nil(): queue(a)
//
(* ****** ****** *)
//
extern
fun
{a:t@ype}
queue2list2(queue(a)): $tup(list0(a), list0(a))
//
(* ****** ****** *)
//
extern
fun
{a:t@ype}
queue_enqueue
  (xs: queue(a), x0: a): void
//
extern
fun
{a:t@ype}
queue_dequeue_exn(xs: queue(a)): a
extern
fun
{a:t@ype}
queue_dequeue_opt(xs: queue(a)): Option(a)
//
(* ****** ****** *)
//
extern
fun
{a:t@ype}
queue_enqueue_list
  (xs: queue(a), ys: list0(a)): void
//
(* ****** ****** *)
//
extern
fun
{a:t@ype}
queue_size(xs: queue(a)): intGte(0)
//
(* ****** ****** *)
//
extern
fun
{a:t@ype}
queue_last_opt(xs: queue(a)): Option(a)
//
(* ****** ****** *)
//
assume
queue_type(a:t@ype) =
  $tup(ref(list0(a)), ref(list0(a)))
//
(* ****** ****** *)
//
implement
{a}(*tmp*)
queue_make_nil() =
  $tup(ref(list0_nil), ref(list0_nil))
//
(* ****** ****** *)

implement
{a}(*tmp*)
queue2list2(Q) = let
  val r0 = Q.0 and r1 = Q.1 in $tup(r0[], r1[])
end // end of [queue2list2]

(* ****** ****** *)

implement
{a}(*tmp*)
queue_enqueue
  (Q, x0) = let
  val r0 = Q.0
  val () = r0[] := list0_cons(x0, r0[])
in
  // nothing
end // end of [queue_enqueue]

(* ****** ****** *)

implement
{a}(*tmp*)
queue_dequeue_opt
  (Q) = let
  val r1 = Q.1
in
  case r1[] of
  | nil0() => let
      val r0 = Q.0
      val xs = list0_reverse(r0[])
      val () = r0[] := list0_nil()
    in
      case+ xs of
      | nil0() => None()
      | cons0(x, xs) => (r1[] := xs; Some(x))
    end // end of [nil0]
  | cons0(x, xs) => (r1[] := xs; Some(x))
end // end of [queue_dequeue]

(* ****** ****** *)

implement
{a}(*tmp*)
queue_size(Q) = let
  val r0 = Q.0
  and r1 = Q.1
in
  list0_length(r0[]) + list0_length(r1[])
end // end of [queue_size]

(* ****** ****** *)

implement
{a}(*tmp*)
queue_last_opt
  (Q) = let
//
val r0 = Q.0
//
in
//
case+ r0[] of
| list0_cons
    (x0, _) => Some(x0)
  // list0_cons
| list0_nil() => let
    val r1 = Q.1 in list0_last_opt(r1[])
  end // end of [list0_nil]
//
end // end of [queue_last_opt]

(* ****** ****** *)

implement
{a}(*tmp*)
queue_enqueue_list
  (xs, ys) = loop(ys) where
{
//
fun loop(ys: list0(a)): void =
  case+ ys of
  | list0_nil() => ()
  | list0_cons(y, ys) => (queue_enqueue(xs, y); loop(ys))
//
} (* end of [queue_enqueue_list] *)

(* ****** ****** *)

(* end of [myqueue.dats] *)
