(*
** Test various forms of
** dot-symbol overloading
*)

(* ****** ****** *)

typedef
size_struct = @{ size= size_t }

(* ****** ****** *)
//
fun
foo_get
(
  x: &size_struct
) : size_t = x.size
//
fun
foo_set
(
  x: &size_struct, n: size_t
) : void = x.size := (n)
//
(* ****** ****** *)
  
fun
foo2_get
  {l:addr}
(
  pf: !size_struct@l | p: ptr(l)
) : size_t = p->size
fun
foo2_set
  {l:addr}
(
  pf: !size_struct@l | p: ptr(l), n: size_t
) : void = (p->size := n)
    
(* ****** ****** *)

abst@ype T = int
abst@ype T1 = int and T2 = int

(* ****** ****** *)
//
extern
fun T_get_T1(T): T1
and T1_get_T2(T1): T2
extern
fun T1_set_T2(T1, T2): void
//
overload .get with T_get_T1
overload .get with T1_get_T2
overload .set with T1_set_T2
//
(* ****** ****** *)
//
fun{}
test_get_get (x: T): T2 = (x.get()).get()
fun{}
test_get_set (x: T, x2: T2): void = (x.get()).set(x2)
//
(* ****** ****** *)

absvt@ype VT = int
absvt@ype VT1 = int and VT2 = int

(* ****** ****** *)

extern
fun
VT_get_size(!VT): size_t
extern
fun
VT_set_size(!VT, size_t): void
//
overload .size with VT_get_size
overload .size with VT_set_size
//
(* ****** ****** *)
//
fun{}
test_get2_size(x: !VT): size_t = x.size()
fun{}
test_set2_size(x: !VT, n: size_t): void = x.size(n)
//
(* ****** ****** *)

implement main0 () = ()

(* ****** ****** *)

(* end of [dotoverld.dats] *)
