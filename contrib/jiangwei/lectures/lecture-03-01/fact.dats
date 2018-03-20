#include
"share/atspre_staload.hats"
#include
"share/atspre_staload_libats_ML.hats"

extern
fun
fact(n:int): int = "ext#myfact"
extern
fun
fact2(n:int): int = "mac#myfact2"

implement
fact(n) =
(
fix f(n:int): int =>
  if n > 0 then n*f(n-1) else 1
)(n)

%{
int myfact2(int n)
{
  return myfact(n);
}
%}

implement
main0() =
(
println!("fact(10) = ", fact(10));
println!("fact2(10) = ", fact2(10));
)
