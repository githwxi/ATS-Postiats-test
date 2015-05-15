#include <stdio.h>

/*
fun loop
(
  i: int, res: int
) : int =
  if i <= n then
  (
    if f_mod (n, i) = 0
      then loop (i+1, res+i) else loop (i+1, res)
    // end of [if]
  ) else res // end of [if]
*/

int
sumdiv
  (int n) {
  int i, res ;

  res = 0 ;
  for (i = 1; i <= n ; i++)
  {
    if (n % i == 0) res = res + i ;
  }
  return res ;
}

/* ****** ****** */

int
main () {
  fprintf (stdout, "sumdiv(%i) = %i\n", 28, sumdiv(28)) ;
  fprintf (stdout, "sumdiv(%i) = %i\n", 100, sumdiv(100)) ;
  return 0 ;
} /* end of [main] */

/* ****** ****** */

/* end of [sumdiv_loop.c] */
