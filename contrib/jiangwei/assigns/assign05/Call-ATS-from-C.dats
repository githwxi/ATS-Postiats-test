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
// Due date: Tuesday, the 13th of March
//
(* ****** ****** *)

(*
//
// HX: 10 points
//
Please do this one for ATS:
http://rosettacode.org/wiki/Use_another_language_to_call_a_function
//
*)

(* ****** ****** *)
//
(*
extern
int
Query
(char * Data, size_t * Length);
*)
extern
fun
Query
( Data: ptr
, Length: &size_t >> _): int = "mac#"
//
(* ****** ****** *)

%{$

#include <stdio.h>

/*
extern
int
Query
(char *Data, size_t *Length);
*/
extern
int
Query
(void *Data, void *Length);
  
int
main(int argc, char *argv[])
{
  char Buffer[1024];
  size_t Size = sizeof(Buffer);
         
  if (0 == Query(Buffer, &Size))
  {
    printf ("failed to call Query\n");
  }
  else
  {
    char * Ptr = Buffer;
    while (Size-- > 0) putchar (*Ptr++);
    putchar ('\n');
  }
} /* end of [main] */

%}

(* ****** ****** *)

(* end of [Call-ATS-from-C.dats] *)
