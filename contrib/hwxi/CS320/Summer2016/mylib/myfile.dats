(*
** Stream-based API for files
*)

(* ****** ****** *)

#include
"share/atspre_staload.hats"
#include
"share/HATS/atspre_staload_libats_ML.hats"

(* ****** ****** *)
//
extern
fun{}
fileref_streamize(inp: FILEref): stream(string)
//
(* ****** ****** *)

implement
{}(*tmp*)
fileref_streamize
  (inp) = let
//
typedef line = string
//
fun
aux(): stream(line) = $delay
(
if
fileref_isnot_eof(inp)
then let
  val line =
    fileref_get_line_string(inp)
  // end of [val]
in
  stream_cons(line, aux())
end // end of [then]
else (fileref_close(inp); stream_nil())
)
//
in
  aux()
end // end of [fileref_streamize]

(* ****** ****** *)

(* end of [myfile.dats] *)
