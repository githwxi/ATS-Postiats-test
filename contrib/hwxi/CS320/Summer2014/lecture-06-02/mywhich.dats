(* ****** ****** *)
//
// Searching for files
// in given directories
//
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
staload "libats/ML/SATS/basis.sats"
staload "libats/ML/SATS/list0.sats"
staload "libats/ML/SATS/string.sats"
//
staload _ = "libats/ML/DATS/list0.dats"
staload _ = "libats/ML/DATS/string.dats"
//
(* ****** ****** *)
//
extern
fun myfind
  (dirs: list0(string), cmd: string): bool
//
(* ****** ****** *)

(*
implement
myfind (dirs, cmd) = let
in
//
case+ dirs of
| nil0 () => false
| cons0 (dir, dirs) => let
    val path = dir + "/" + cmd
    val test = test_file_exists (path)
  in
    if test then true else myfind (dirs, cmd)
  end
//
end // end of [myfind]
*)

(* ****** ****** *)

extern
fun{a:t@ype}
mylist0_find
  (xs: list0 (a), pred: (a) -<cloref1> bool): int

(* ****** ****** *)

implement
{a}(*tmp*)
mylist0_find
  (xs, pred) = let
//
fun aux
(
  xs: list0(a), ind: int
) : int =
  case+ xs of
  | nil0 () => ~1
  | cons0 (x, xs) => if pred(x) then ind else aux (xs, ind+1)
//
in
  aux (xs, 0)
end // end of [mylist0_find]

(* ****** ****** *)

implement
myfind (dirs, cmd) = let
//
fun pred (dir: string): bool =
let
val test = test_file_exists (dir + "/" + cmd)
val ((*void*)) = if test then println! (dir, "/", cmd)
in
  test
end // end of [pred]
//
in
  mylist0_find (dirs, lam (dir) => pred (dir)) >= 0
end // end of [myfind]

(* ****** ****** *)

val PATH = $list{string}("/bin", "/usr/bin", "/usr/local/bin")
val PATH = g0ofg1 (PATH)

(* ****** ****** *)

implement
main0{n}(argc, argv) =
{
//
fun
loop{i:nat}
(
  i: int(i)
, argv: !argv(n)
) : void =
  if i < argc then let
    val test = myfind (PATH, argv[i])
  in
    loop (succ(i), argv)
  end else ((*exit*)) // end of [if]
//
val () = loop (1, argv)
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [mywhich.dats] *)
