//
// Unsafe features
//
(* ****** ****** *)

#include
"share/atspre_staload.hats"

(* ****** ****** *)

staload
UN = "prelude/SATS/unsafe.sats"

(* ****** ****** *)

extern
fun stringlen (str: string): size_t

(* ****** ****** *)

implement
stringlen (str) = let
//
fun loop
(
  p: ptr, n: size_t
) : size_t = let
//
val c = $UN.ptr0_get<char> (p)
//
in
  if c != '\000' then loop (ptr_succ<char> (p), succ(n)) else n
end // end of [loop]
//
in
  loop (string2ptr(str), i2sz(0))
end (* end of [stringlen] *)

(* ****** ****** *)

implement
main0 (argc, argv) =
{
val () = assertloc (strlen("abcdefghijklmn") = stringlen("abcdefghijklmn"))
}

(* ****** ****** *)

(* end of [stringlen.dats] *)
