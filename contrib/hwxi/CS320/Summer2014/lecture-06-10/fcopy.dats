(* ****** ****** *)
//
#include
"share/atspre_define.hats"
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)
//
staload "libats/ML/SATS/basis.sats"
staload "libats/ML/SATS/array0.sats"
staload _ = "libats/ML/DATS/array0.dats"
//
(* ****** ****** *)

staload "{$LIBATSHWXI}/teaching/BUCS/DATS/BUCS320.dats"

(* ****** ****** *)

fun fcopy
(
  inp: FILEref, out: FILEref
) : void = let
  val c = fileref_getc (inp)
in
  if c >= 0 then let
    val () = fileref_putc (out, c) in fcopy (inp, out)
  end // end of [if]
end (* end of [fcopy] *)

(* ****** ****** *)

fun
fcopy_srcname
(
  src: string, out: FILEref
) : void = let
  val opt = fileref_open_opt (src, file_mode_r)
in
//
case+ opt of
| ~None_vt () => ()
| ~Some_vt (inp) =>
  {
    val () = fcopy (inp, out)
    val () = fileref_close (inp)
  }
//
end // end of [fcopy_srcname]

(* ****** ****** *)

implement
main0 (argc, argv) =
{
//
val A = array0_make_argv<> (argv, argc)
//
fun loop
(
  i: int
) : void =
(
if i < argc
  then (fcopy_srcname (A[i], stdout_ref); loop (i+1)) else ()
)
//
val () = loop (1)
//
} (* end of [main0] *)

(* ****** ****** *)

(* end  of [fcopy.dats] *)
