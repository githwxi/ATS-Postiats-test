#include <stdio.h>

int fact(int n)
{
  int res = 1 ;
  // assert(n >= 0);
  while(n > 0) { res = n * res; n = n - 1; }
  return res ;
}

#define N 1000000

int main()
{
  int res = fact(N);
  printf("fact(%i) = %i\n", N, res);
}
