(*
** Interacting with C from within ATS
*)

(* ****** ****** *)
//
// patscc -o fact_extern fact_extern.dats
//
(* ****** ****** *)

%{
int
fact_in_c(int n)
{
  return (n > 0 ? n * fact_in_c(n-1) : 1);
}
%}

(* ****** ****** *)

extern
fun fact(int): int = "mac#fact_in_c"
  
(* ****** ****** *)

(*
implement
fact(n) = if n > 0 then n * fact(n-1) else 1
*)
  
(* ****** ****** *)

implement main0 () = println! ("fact(10) = ", fact(10))

(* ****** ****** *)

(* end of [fact_extern.dats] *)
