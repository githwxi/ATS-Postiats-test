(* ****** ****** *)

#include
"share/atspre_staload.hats"
#include
"share/atspre_staload_libats_ML.hats"

(* ****** ****** *)

datatype term =
//
  | TMint of (int)
  | TMstr of string
//
  | TMvar of string
//
  | TMlam of (string, term(*body*))
  | TMapp of (term(*fun*), term(*arg*))
  | TMfix of (string(*f*), string(*x*), term)
//
  | TMopr of (string(*opr*), termlst)
  | TMifnz of (term(*test*), term(*then*), term(*else*))
  
where termlst = list0(term)

(* ****** ****** *)

datatype value =
  | VALint of int
  | VALstr of string
  | VALclo of (term, envir)

where envir = list0($tup(string, value))

(* ****** ****** *)

implement main0() = ()

(* ****** ****** *)

(* end of [lambda2.dats] *)
