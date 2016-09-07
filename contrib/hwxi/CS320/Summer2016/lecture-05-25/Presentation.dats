(* ****** ****** *)
(*
//
// An abstract presentation...
//
*)
(* ****** ****** *)
//
extern
fun{}
signal_get(): int
//
(* ****** ****** *)
//
extern
fun{}
slide_present(i: int): void
//
(* ****** ****** *)
//
extern
fun{}
nslide_present(n: int): void
//
(* ****** ****** *)

implement
{}(*tmp*)
nslide_present(n) = let
//
fun
loop
(
  i: int
) : void = let
  val d = signal_get()
in
  if d != 0 then loop2(i, d)
end (* end of [loop] *)

and
loop2
(
  i: int, d: int
) : void = let
  val i1 = i + d
in
//
if i1 < n
  then let
    val () = slide_present(i1)
  in
    loop(i1)
  end else () // end of [else]
end (* end of [loop2] *)
//
in
  loop(0)
end // end of [nslide_present]

(* ****** ****** *)

(* end of [Presentation.dats] *)
