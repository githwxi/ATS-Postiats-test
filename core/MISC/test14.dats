(*
** There are several different styles for writing characters using octal
** and hexadecimal character sequences. This makes sure that they get
** lexed correctly.
**)

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

// Characters using hexadecimal escape sequences
val tilde: char '~' = '\x7e'
val tilde: char '~' = '\x7E'
val tilde: char '~' = '\X7e'
val tilde: char '~' = '\X7E'

// Characters using octal escape sequences
val bell: char '\a' = '\7'
val bell: char '\a' = '\07'
val bell: char '\a' = '\007'

// String using hexadecimal escape sequences
val () = assertloc("\x7e" = "~")
val () = assertloc("\x7E" = "~")
val () = assertloc("\X7e" = "~")
val () = assertloc("\X7E" = "~")
val () = assertloc("\x7ex" = "~x")
val () = assertloc("\x7Ex" = "~x")
val () = assertloc("\X7ex" = "~x")
val () = assertloc("\X7Ex" = "~x")

// String using octal escape sequences
val () = assertloc("\7" = "\a")
val () = assertloc("\07" = "\a")
val () = assertloc("\007" = "\a")
val () = assertloc("\7x" = "\ax")
val () = assertloc("\07x" = "\ax")
val () = assertloc("\007x" = "\ax")

implement main0() = ()

(* ****** ****** *)

(* end of [test14.dats] *)
