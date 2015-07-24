#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

#define N 3

implement
main0 () = {
//
var arr = @[int](5, 4, 3)
//
val () = fprint(stdout_ref, "arr(bef) = ")
val () = (fprint(stdout_ref, arr, i2sz(N)); fprint_newline(stdout_ref))
//
implement
array_quicksort$cmp<int> (x, y) = compare (x, y)
//
val () = array_quicksort<int> (arr, i2sz(N))
//
val () = fprint(stdout_ref, "arr(aft) = ")
val () = (fprint(stdout_ref, arr, i2sz(N)); fprint_newline(stdout_ref))
//
} (* end of [main] *)
            