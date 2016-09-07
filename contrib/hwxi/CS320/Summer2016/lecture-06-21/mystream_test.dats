(* ****** ****** *)
//
// Testing functions on streams
//
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
#include
"share/HATS/atspre_staload_libats_ML.hats"
//
(* ****** ****** *)

staload "./../mylib/mystream.dats"

(* ****** ****** *)
//
val
theNats =
mystream_make_cloref<int,int>(0, lam(n) => $tup(n, n+1))
//
(* ****** ****** *)

val
theFibs = let
  typedef a = int
  typedef st = $tup(int, int)
  val st0 = $tup(0, 1)
in
  mystream_make_cloref<a,st>(st0, lam(st) => $tup(st.0, $tup(st.1, st.0+st.1)))
end // end of [val]

(* ****** ****** *)
//
val xs =
  stream_take_exn(theFibs, 10)
//
val () = println! ("xs = ", xs)
//
(* ****** ****** *)

val
theCubeSums = let
  typedef a = int
  typedef st = $tup(int, int)
  val st0 = $tup(0, 0)
  fun fopr (st: st): $tup(a, st) = let
    val i = st.0
    val j = st.1
  in
    if i <= j then $tup(i*i*i+j*j*j, $tup(i+1, j-1)) else fopr($tup(0, i+j+1))
  end
in
  mystream_make_cloref<a,st>(st0, lam(st) => fopr(st))
end // end of [val]
//
val xs =
  stream_take_exn(theCubeSums, 10)
//
val () = println! ("xs = ", xs)
//
(* ****** ****** *)

implement main0 () = ()

(* ****** ****** *)

(* end of [mystream_test.dats] *)
