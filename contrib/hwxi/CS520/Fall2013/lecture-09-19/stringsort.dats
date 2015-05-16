//
// An example of using extfcall
//
(* ****** ****** *)

#include
"share/atspre_staload.hats"

(* ****** ****** *)

staload
UN = "prelude/SATS/unsafe.sats"

(* ****** ****** *)

extern
fun stringsort (str: string): string

(* ****** ****** *)

%{^
#undef ATSextfcall
#define ATSextfcall(f, args) f args
%} // end of [%{^]

(* ****** ****** *)

%{^
#define \
__qsort(base, nmemb, size, compar) \
  qsort(base, nmemb, size, (void*)compar)
%} // end of [%{^]

implement
stringsort (str) = let
//
val str2 = string0_copy (str)
val str2 = $UN.castvwtp0{string}(str2)
//
val () =
$extfcall (
  void
, "__qsort"
, str2
, strlen(str)
, sizeof<char>
, lam (c1: &char, c2: &char): int => compare_char0_char0 (c1, c2)
) 
//
in
  str2
end (* end of [stringsort] *)

(* ****** ****** *)

implement
main0
  (argc, argv) = let
//
val cmdname = argv[0]
val cmdname2 = stringsort (cmdname)
//
in
  println! ("cmdname2 = ", cmdname2)
end // end of [main0]

(* ****** ****** *)

(* end of [stringsort.dats] *)
