(* ****** ****** *)
//
// Title:
// Principles of
// Programming Languages
// Course: CAS CS 520
//
// Semester: Spring, 2018
//
// Classroom: MCS B25
// Class Time: TR 2:00-3:15
//
// Instructor: Hongwei Xi (hwxiATcsDOTbuDOTedu)
//
(* ****** ****** *)
//
// Due date: Tuesday, the 13th of February
//
(* ****** ****** *)

#include
"share/atspre_staload.hats"
#include
"share/atspre_staload_libats_ML.hats"

(* ****** ****** *)

datatype term =
  | TMint of (int)
  | TMvar of string
  | TMlam of (string, term(*body*))
  | TMapp of (term(*fun*), term(*arg*))
  | TMopr of (string(*opr*), termlst)
  | TMfix of (string(*f*), string(*x*), term)
  | TMifnz of (term(*test*), term(*then*), term(*else*))
  
where termlst = list0(term)

(* ****** ****** *)

extern
fun
print_term(t0: term): void // stdout
and
prerr_term(t0: term): void // stderr

extern
fun
fprint_term(out: FILEref, t0: term): void

(* ****** ****** *)

overload print with print_term
overload prerr with prerr_term
overload fprint with fprint_term

(* ****** ****** *)

implement
print_term(t0) =
fprint_term(stdout_ref, t0)
implement
prerr_term(t0) =
fprint_term(stderr_ref, t0)

(* ****** ****** *)

implement
fprint_val<term> = fprint_term

(* ****** ****** *)

implement
fprint_term(out, t0) =
(
case+ t0 of
//
| TMint(i) =>
  fprint!(out, "TMint(", i, ")")
//
| TMvar(x) =>
  fprint!(out, "TMvar(", x, ")")
//
| TMlam(x, t) =>
  fprint!(out, "TMlam(", x, "; ", t, ")")
| TMapp(t1, t2) =>
  fprint!(out, "TMapp(", t1, "; ", t2, ")")
//
| TMopr(opr, ts) =>
  fprint!(out, "TMopr(", opr, "; ", ts)
//
| TMfix(f, x, t) =>
  fprint!(out, "TMfix(", f, ", ", x, "; ", t, ")")
//
| TMifnz(t1, t2, t3) =>
  fprint!(out, "TMifnz(", t1, "; ", t2, "; ", t3, ")")
)

(* ****** ****** *)
//
// HX-2018-02-08:
// please implement the
// following one on your own:
//
extern
fun evaluate(t0: term): term
//
(* ****** ****** *)
//
// HX-2018-02-08:
// You may need to implement some
// primitive operators on your own
// for the following two problems
//
(* ****** ****** *)
//
// 10 points in total
//
// Please construct a lambda-term that
extern
val IsPrime : term // tests if a given integer is a prime
//
(* ****** ****** *)
//
// 10 points in total
//
// Please construct a lambda-term that returns the number
extern
val NumberOfPrimes : term // of primes below a given integer
//
(* ****** ****** *)

(* end of [assign03.dats] *)
