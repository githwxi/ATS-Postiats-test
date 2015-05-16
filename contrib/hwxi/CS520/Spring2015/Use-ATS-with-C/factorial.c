int
fact_in_c(int n)
{
  int
  res = 1 ;
  while (n > 0) { res *= n; n--; }
  return res ;
}
