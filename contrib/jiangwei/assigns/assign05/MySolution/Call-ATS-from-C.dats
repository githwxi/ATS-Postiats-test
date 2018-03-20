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

#define ATS_MAINATSFLAG 1

(* ****** ****** *)
#include "share/atspre_staload.hats"
#include "share/atspre_staload_libats_ML.hats"
#include "./../Call-ATS-from-C.dats"
staload UN = "prelude/SATS/unsafe.sats"

(* ****** ****** *)

// (*
//
// HX: A dummy implementation
//
implement Query(Data, Length) = 
(
let
  val hello = string_explode("Here am I")
  val () = Length := $UN.cast{size_t}(10)
  fun loop(left: list0(char), data_inner: ptr): int = 
  (
  case+ left of
  | list0_nil() => let
                     val () = $UN.ptr0_set<char>(data_inner, '\0')
                   in
                     1
                   end
  | list0_cons(t0, t1) => let
                            val () = $UN.ptr0_set<char>(data_inner, t0)
                          in
                            loop(t1, ptr0_succ<char>(data_inner))
                          end
  )
  // val () = $UN.ptr0_set<char>(Data, )
in
  if Length < 10 then 
    0
  else
    loop(hello, Data)
end
)
//
// *)
//
(* ****** ****** *)

(* end of [Call-ATS-from-C.dats] *)
