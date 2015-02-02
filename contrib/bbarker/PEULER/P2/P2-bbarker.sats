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

// Note recurrence subscripts as follows: x_n = x_(n-1) - x_(n-2)
//                                                (*n1*)    (*n2*)
//
praxi
MYSUM_sat
  {n1,n2,t:nat}
  (pf1: MYSUM(n2, n1, t)):
  ($P2.FIB(n2, n1+n2), $P2.MYSUM(n2, t))

//
// TODO: annotate inputs with FIB relationship
//
fun mysum {n1,n2,t:nat} (x_n2: int n2, x_n1: int n1, tl: int t):
[n1f,n2f,tf:int | n1f >= n1; n2f >= n2; tf >= t] (MYSUM (n2f, n1f, tf) | int tf)
//