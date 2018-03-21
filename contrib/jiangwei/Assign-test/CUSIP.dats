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
Please read:
https://en.wikipedia.org/wiki/CUSIP

Here are some examples:

037833100 Apple Incorporated
17275R102 Cisco Systems
38259P508 Google Incorporated
594918104 Microsoft Corporation
68389X106 Oracle Corporation (incorrect)
68389X105 Oracle Corporation 

*)

(* ****** ****** *)

(*
//
// HX: 10 points
//
Please implement the following function for
checking the validity of a given CUSIP number
//
*)


#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"
#include "share/atspre_staload.hats"
#include "share/atspre_staload_libats_ML.hats"

extern
fun
cusip_check(cusip: string): bool

implement
cusip_check(cusip) = 
let
  val cs = string_explode(cusip)
  fun sumloop
  (i: int, sum: int): int =
    let
      val c = (if (i < 8) then cs[i] else '\0'): char
      val v = let
        val v_temp = (if (c >= '0') andalso (c <= '9') then c - '0'
              else if (c >= 'A') andalso (c <= 'Z') then (c - 'A') + 10
              else if (c = '*') then 36
              else if (c = '@') then 37
              else if (c = '#') then 38
              else ~10000): int
      in
        (if (i%2 = 1) then v_temp+v_temp else v_temp): int
      end
      val add = ((v/10) + (v%10)): int   
    in
      if (i < 8) then sumloop(i+1, sum + add) else sum
    end
  
  val sum_val = sumloop(0, 0)
  //val() = println! (sum_val)
in
  if (10-(sum_val%10))%10 = cs[8] - '0' then true else false
end


implement
main0 () = {
  val () = println! ("037833100 = ", cusip_check("037833100"))
  val () = println! ("17275R102 = ", cusip_check("17275R102"))
  val () = println! ("38259P508 = ", cusip_check("38259P508"))
  val () = println! ("594918104 = ", cusip_check("594918104"))
  val () = println! ("68389X106 = ", cusip_check("68389X106"))
  val () = println! ("68389X105 = ", cusip_check("68389X105"))
}

(* ****** ****** *)

(* end of [CUSIP.dats] *)
