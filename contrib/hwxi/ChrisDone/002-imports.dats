(* Import some prelude-like functions. *)

staload _ = "prelude/DATS/list.dats"
staload _ = "prelude/DATS/list_vt.dats"
staload _ = "prelude/DATS/array.dats"
staload _ = "prelude/DATS/matrix.dats"
staload _ = "prelude/DATS/option.dats"
staload _ = "prelude/DATS/pointer.dats"
staload _ = "prelude/DATS/reference.dats"

staload _ = "libats/ML/DATS/list0.dats"
staload _ = "libats/ML/DATS/array0.dats"
staload _ = "libats/ML/DATS/matrix0.dats"

staload _ = "libats/libc/SATS/stdio.sats"

(* Main entry point. *)
val _ = print "Here is a bunch of useful imports, like a prelude.\n"

implement main0 () = ()
