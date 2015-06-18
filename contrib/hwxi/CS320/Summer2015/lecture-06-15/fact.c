/*
extern
fun fact : int -> int = "ext#C_fact
*/

int C_fact(int n)
{
  int i, res = 1;
  for (i = 1; i <= n; i += 1) res *= i;
  return res;
}
