(*
** Project Euler: P2
** See https://projecteuler.net
*)
(* ****** ****** *)
//
// Author: Hongwei Xi
// Authoremail: gmhwxiATgmailDOTcom
// Start time: January 13, 2015
//
(* ****** ****** *)
//
// Author: Brandon Barker
// Authoremail: brandonDOTbarkerATgmailDOTcom
// Start time: January 31, 2015
//
(* ****** ****** *)
//
#include "share/atspre_define.hats"
//
(* ****** ****** *)
//
staload
"{$LIBATSHWXI}/PEULER/SATS/peuler.sats"
//
(* ****** ****** *)
//
#define LIMIT 4000000
//
(* ****** ****** *)
//
// MYSUM (n2, n1, t) =
// t = sum of all the even fibs <= LIMIT starting from n2, n1
//
dataprop MYSUM
(
  int(*n2*), int(*n1*), int(*t*)
) =
  | {n2,n1:nat | n1 + n2 > LIMIT}
    {t1:int}
    MYSUM (n2, n1, t1) of  MYSUM (n2, n1, t1)
  | {n2,n1:nat | n1 + n2 <= LIMIT; (n1 + n2) mod 2 > 0}
    {t1:int}
    MYSUM (n1, n1 + n2, t1) of MYSUM (n2, n1, t1)
  | {n2,n1:nat | n1 + n2 <= LIMIT; (n1 + n2) mod 2 == 0}
    {t1:int}
    MYSUM (n1, n1 + n2, n1 + n2 + t1) of MYSUM (n2, n1, t1)
// end of [MYSUM]

(* ****** ****** *)

//
fun mysum {n1,n2:nat} (x_n2: int n2, x_n1: int n1): [t:int] (MYSUM (n2, n1, t) | int t)
//