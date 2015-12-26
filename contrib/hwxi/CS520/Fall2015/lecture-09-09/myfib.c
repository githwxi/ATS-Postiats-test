int myfib(int n)
{
  // if (n >= 2) { return myfib(n-1)+myfib(n-2); } else { return n; }
  return ((n >= 2) ? myfib(n-1)+myfib(n-2) : n);
}
