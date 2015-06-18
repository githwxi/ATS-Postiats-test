#include <stdio.h>
#include <stdlib.h>

/*

implement
main0(argc, argv) = let
  val n = 10
  val n = (if argc >= 2 then g0string2int(argv[1]) else n): int
in
  println! ("fact(", n, ") = ", fact(n))
end // end of [main0]

*/

extern int ATS_fact(int) ;

int
main(int argc, char *argv[])
{
  int n = 10;
  if (argc >= 2) { n = atoi(argv[1]) ; }
  printf("ATS_fact(%d) = %d\n", n, ATS_fact(n));
  return 0;
}
