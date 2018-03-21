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
// Due date: Tuesday, the 6th of February
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
  | TMadd of (term, term) // addition
  | TMlam of (string, term)
  | TMapp of (term(*t1*), term(*t2*))
  | TMifnz of (term, term, term) // TMifnz(t1, t2, t3): if t1 != 0 then t2 else t3

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
| TMadd(t1, t2) =>
  fprint!(out, "TMadd(", t1, "; ", t2, ")")
//
| TMlam(x, t) =>
  fprint!(out, "TMlam(", x, "; ", t, ")")
| TMapp(t1, t2) =>
  fprint!(out, "TMapp(", t1, "; ", t2, ")")
//
| TMifnz(t1, t2, t3) =>
  fprint!(out, "TMifnz(", t1, "; ", t2, "; ", t3, ")")
)

(* ****** ****** *)
//
// HX-2018-02-01:
// 10 points in total
//
(* ****** ****** *)
//
extern
fun // 5 points
evaluate(t0: term): term
//
extern
fun
subst // 5 points // t0[x -> t1]
(t0: term, x0: string, sub: term): term
//
(* ****** ****** *)
//
val f = TMvar("f")
val x = TMvar("x")
val y = TMvar("y")
//
val twice = TMlam("f", TMlam("x", TMapp(f, TMapp(f, x))))
val thrice = TMlam("f", TMlam("x", TMapp(f, TMapp(f, TMapp(f, x)))))
//
(* ****** ****** *)
//
val tmdbl =
TMlam("x", TMadd(x, x))
//
val twicethrice = TMapp(twice, thrice)
val thricetwice = TMapp(thrice, twice)
//
(* ****** ****** *)

(* end of [assign02.dats] *)
