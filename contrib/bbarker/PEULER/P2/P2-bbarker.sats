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
staload P2 = "{$PATSHOMERELOC}/projects/MEDIUM/PEULER/P2/P2.sats"
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
    MYSUM (n2, n1, t1) of MYSUM (n2, n1, t1)
  | {n2,n1:nat | n1 + n2 <= LIMIT; (n1 + n2) mod 2 > 0}
    {t1:int}
    MYSUM (n1, n1 + n2, t1) of MYSUM (n2, n1, t1)
  | {n2,n1:nat | n1 + n2 <= LIMIT; (n1 + n2) mod 2 == 0}
    {t1:int}
    MYSUM (n1, n1 + n2, n1 + n2 + t1) of MYSUM (n2, n1, t1)
// end of [MYSUM]

(* ****** ****** *)
//
// Now we should show that the original, abstract definition of
// MYSUM is equivalent to the MYSUM defined above. More precisely,
// we should show the MYSUM above implies $P2.MYSUM, as strict
// equivalence is not necessary as long as we satisfy the specification
// of $P2.MYSUM.
//
(* ****** ****** *)

dataprop MYSUMSAT
(
  int(*n2*), int(*n1*), int(*n*)
) =
  | {n2,n1:nat | $P2.FIB(n-1) == n1 + n2}
    [n,t0,t1:nat | t0 == t1] MYSUMSAT(n2, n1, n) of
    (MYSUM(n2, n1, t1), $P2.MYSUM(n, t0))


//
fun mysum {n1,n2:nat} (x_n2: int n2, x_n1: int n1): [t:int] (MYSUM (n2, n1, t) | int t)
//