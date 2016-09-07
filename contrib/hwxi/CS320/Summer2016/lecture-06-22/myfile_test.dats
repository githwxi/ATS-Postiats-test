(* ****** ****** *)
//
// Testing functions on files
//
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
#include
"share/HATS/atspre_staload_libats_ML.hats"
//
(* ****** ****** *)

staload "./../mylib/myfile.dats"

(* ****** ****** *)

#define WORDS "./dict_words.txt"

(* ****** ****** *)

val theDict = let
  val-~Some_vt(inp) = fileref_open_opt(WORDS, file_mode_r)
in
  fileref_streamize(inp)
end // end of [theDict]

(* ****** ****** *)

val ws = stream_take_exn(theDict, 100)
val () = fprintln! (stdout_ref, "ws = ", ws)

(* ****** ****** *)

implement main0 () = ()

(* ****** ****** *)

(* end of [myfile_test.dats] *)
