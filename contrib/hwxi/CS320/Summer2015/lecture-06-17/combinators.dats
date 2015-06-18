//
#include
"share/atspre_define.hats"
#include
"share/atspre_staload.hats"
#include
"share/HATS/atspre_staload_libats_ML.hats"
//
(* ****** ****** *)

implement
main0 () = let
//
val () = println! "Hello from [combinators]!"
//
val () = (10).foreach()(lam _ => println! ("Hello, world!"))
val () = (10).foreach()(lam i => println! (i+1, ": Hello, world!"))
//
local
fun
print_int
  (x: int) =
  $extfcall(void, "printf", "%02d", x)
//
in (* in-of-local *)
val () =
(9).foreach()
(
lam (i) =>
(i+1).foreach()
(
lam j =>
(
  (if j > 0 then print ' ');
  print! (j+1, "x", i+1, " = "); print_int((j+1) * (i+1));
  (if (i = j) then print_newline())
)
)
)
//
end // end of [local]
//
val fact10 = (10).foldleft(TYPE{int})(1, lam (res, i) => res * (i+1))
val () = println! ("fact(10) = ", fact10)
//
val fib10 = ((10).foldleft(TYPE{(int,int)})((0, 1), lam (res, _) => (res.1, res.0+res.1))).0
val () = println! ("fib(10) = ", fib10)
//
val g24_4 = (4).foldleft(TYPE{int})(1, lam (res, i) => if i = 0 then res else res * 3*(i+1)*i)
val () = println! ("g24_4 = ", g24_4)
val g24_5 = (5).foldleft(TYPE{int})(1, lam (res, i) => if i = 0 then res else res * 3*(i+1)*i)
val () = println! ("g24_5 = ", g24_5)
val g24_6 = (6).foldleft(TYPE{int})(1, lam (res, i) => if i = 0 then res else res * 3*(i+1)*i)
val () = println! ("g24_6 = ", g24_6)
//
in
  // nothing
end // end of [main0]

(* ****** ****** *)

(* end of [combinators.dats] *)
