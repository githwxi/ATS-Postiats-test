//
#include
"share/atspre_staload.hats"
//
staload "libats/ML/SATS/basis.sats"
staload "libats/ML/SATS/list0.sats"
staload _ = "libats/ML/DATS/list0.dats"
//
(* ****** ****** *)

#define sing0(x) cons0(x, nil0())

(* ****** ****** *)
//
extern
fun
mylist0_subseq
  (xs: list0(int)): list0(list0(int))
//
(* ****** ****** *)

fun
list0_mcons
(
  x0: int, xss: list0(list0(int))
) : list0(list0(int)) =
(
  case+ xss of
  | list0_nil () => list0_nil ()
  | list0_cons (xs, xss) =>
      list0_cons (list0_cons(x0, xs), list0_mcons(x0, xss))
    // end of [list0_cons]
)

(* ****** ****** *)

implement
mylist0_subseq
  (xs) = let
in
//
case+ xs of
| nil0 () => sing0(nil0())
| cons0 (x, xs) => let
    val res1 = mylist0_subseq (xs)
  in
    list0_append (res1, list0_mcons (x, res1))
  end // end of [cons0]
//
end // end of [mylist0_subseq]

(* ****** ****** *)

implement
main0 () = () where
{
//
val xs =
$list{int}(0,1,2,3,4,5,6,7,8,9)
val xs = g0ofg1 (xs)
//
val xss = mylist0_subseq (xs)
val ((*void*)) = assertloc (length(xss) = 1024)
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [mylist0_subseq.dats] *)
