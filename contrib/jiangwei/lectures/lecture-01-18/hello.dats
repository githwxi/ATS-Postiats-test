(* ****** ****** *)

extern
fun hello(): void

(* ****** ****** *)

implement
hello() =
println! ("Hello, world!")

(* ****** ****** *)

implement main0() = hello()

(* ****** ****** *)

(* end of [hello.dats] *)
