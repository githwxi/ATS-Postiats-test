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
// Due date: Thursday, the 22nd of February
//
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
  | TMtup of termlst
  | TMproj of (term, int)
//
  | TMvar of string
//
  | TMlam of (string, term(*body*))
  | TMapp of (term(*fun*), term(*arg*))
  | TMfix of (string(*f*), string(*x*), term)
//
  | TMopr of (string(*opr*), termlst)
  | TMifnz of (term(*test*), term(*then*), term(*else*))
//
   | TMseq of (term, term)
  
where termlst = list0(term)

(* ****** ****** *)

datatype value =
  | VALint of int
  | VALstr of string
  | VALtup of valuelst
  | VALfix of (term, envir)
  | VALlam of (term, envir)
  | VALunit of ((*void*))

where

envir =
list0($tup(string, value))

and valuelst = list0(value)

(* ****** ****** *)
//
// HX-2018-02-08:
// please implement the
// following one on your own:
//
extern
fun interp1(t0: term): value
//
(* ****** ****** *)

(* end of [assign04.dats] *)
