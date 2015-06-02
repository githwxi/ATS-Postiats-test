(*
** Some file manipulation functions
*)
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
#include
"share/HATS/atspre_staload_libats_ML.hats"
//
(* ****** ****** *)

implement
main0(argc, argv) = let
//
val () =
println! ("Hello from [", argv[0], "]")
val inp = stdin_ref
val inp =
(
  if argc >= 2 then fileref_open_exn(argv[1], file_mode_r) else inp
) : FILEref
//
fun
loop
(
  inp: FILEref, n: int
) : void = let
  val iseof = fileref_is_eof(inp)
in
  if iseof then ()
  else let
    val ln = fileref_get_line_string (inp)
    val () = println! ("line(", n, "):\t", ln)
  in
    loop(inp, n+1)
  end // end of [else]
end // end of [loop]
//
in
  loop(inp, 1)
end (* end of [main0] *)

(* ****** ****** *)

(* end of [filebas.dats] *)
