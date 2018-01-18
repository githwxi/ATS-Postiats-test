(* ****** ****** *)

abstype myfile
abstype myline

(* ****** ****** *)

typedef
cfun
( a1:t@ype
, a2:t@ype
, res:t@ype
) = (a1, a2) -<cloref1> res

(* ****** ****** *)

extern
fun
myline_get_nchar(myline): int

extern
fun
myfile_foldleft
(myfile, int, cfun(int, myline, int)): int

fun
myfile_get_nline(file: myfile): int =
myfile_foldleft(file, 0, lam(res, line) => res + 1)


fun
myfile_get_nchar(file: myfile): int =
myfile_foldleft(file, 0, lam(res, line) => res + myline_get_nchar(line))

(* ****** ****** *)

(* end of [myfile_foldleft] *)
