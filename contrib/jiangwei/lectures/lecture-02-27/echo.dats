//usr/bin/env myatscc "$0"; exit
(*
\#\#myatsccdef=\
patsopt --constraint-ignore --dynamic $1 | \
tcc - -run -DATS_MEMALLOC_LIBC -I${PATSHOME} -I${PATSHOME}/ccomp/runtime -L${PATSHOME}/ccomp/atslib/lib -latslib -
*)
(* ****** ****** *)

#include "share/atspre_staload.hats"
#include "share/atspre_staload_libats_ML.hats"

(* ****** ****** *)

typedef istring = (int, string)

fun
echo() = let
  fun
  loop(xs: stream_vt(istring)): void =
  (
    case+ !xs of
    | ~stream_vt_nil() => ()
    | ~stream_vt_cons(x, xs) =>
       (println!("[", x.0, "]: ", x.1); loop(xs))
  )
  typedef a = string
  typedef b = istring
  val xs = streamize_fileref_line(stdin_ref)
  val ys = stream_vt_imap_cloptr<a><b>(xs, lam(i, x) => (i+1, x))
in
  loop(ys)
end //  end of [echo]

(* ****** ****** *)

implement
main0() = echo()

(* ****** ****** *)

(* end of [echo.dats] *)
