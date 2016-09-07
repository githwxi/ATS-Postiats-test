(* ****** ****** *)
//
// stack implementation
//
(* ****** ****** *)
//
#include
"share/atspre_define.hats"
#include
"{$LIBATSCC2PY3}/staloadall.hats"
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
//
implement
{a}(*tmp*)
stack_pop_opt(stk) =
  case stk[] of
  | list0_nil() => None()
  | list0_cons(x, xs) => (stk[] := xs; Some(x))
//
(* ****** ****** *)
//
implement
{a}(*tmp*)
stack_push(stk, x0) =
  stk[] := list0_cons(x0, stk[])
//
(* ****** ****** *)
//
implement
{a}(*tmp*)
stack_push_list(stk, xs) =
  stk[] := list0_append{a}(xs, stk[])
//
(* ****** ****** *)

(* end of [mystack.dats] *)
