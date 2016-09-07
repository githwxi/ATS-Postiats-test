(* ****** ****** *)
//
// stack implementation
//
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
#include
"share/HATS/atspre_staload_libats_ML.hats"
//
(* ****** ****** *)

typedef
stack(a:t@ype) = ref(list0(a))

(* ****** ****** *)

extern
fun{a:t@ype}
stack_make_nil(): stack(a)

implement
{a}(*tmp*)
stack_make_nil() = ref(list0_nil())

(* ****** ****** *)

extern
fun{a:t@ype}
stack_top_exn(stk: stack(a)): a

(* ****** ****** *)

extern
fun{a:t@ype}
stack_pop_exn(stk: stack(a)): a
extern
fun{a:t@ype}
stack_pop_opt(stk: stack(a)): Option(a)

(* ****** ****** *)

extern
fun{a:t@ype}
stack_push(stk: stack(a), x0: a): void

(* ****** ****** *)
//
extern
fun{a:t@ype}
stack_push_list
  (stk: stack(a), xs: list0(a)): void
//
(* ****** ****** *)

exception STACK_EMPTY_EXN of ()

(* ****** ****** *)
//
implement
{a}(*tmp*)
stack_pop_exn(stk) =
  case stk[] of
  | list0_cons
      (x, xs) => (stk[] := xs; x)
    // list0_cons
  | list0_nil() => $raise STACK_EMPTY_EXN()
//
(* ****** ****** *)
//
implement
{a}(*tmp*)
stack_pop_opt(stk) =
  case stk[] of
  | list0_nil() => None()
  | list0_cons(x, xs) => (stk[] := xs; Some(x))
//
(* ****** ****** *)

implement
{a}(*tmp*)
stack_push(stk, x0) =
  stk[] := list0_cons(x0, stk[])

(* ****** ****** *)

implement
{a}(*tmp*)
stack_push_list(stk, xs) =
  stk[] := list0_append(xs, stk[])

(* ****** ****** *)

(* end of [stack.dats] *)
