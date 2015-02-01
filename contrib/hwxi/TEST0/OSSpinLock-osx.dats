(*
** For testing spinlock
*)

(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
staload UN = $UNSAFE
//
(* ****** ****** *)
//
staload
"libc/SATS/string.sats"
//
(* ****** ****** *)

%{^
#include <libkern/OSAtomic.h>
%} // end of [%{^]

(* ****** ****** *)
//
abst@ype
OSSpinLock_t0ype = $extype"OSSpinLock"
//
typedef OSSpinLock = OSSpinLock_t0ype
//
(* ****** ****** *)
//
absview locked_v
//
(*
bool OSSpinLockTry(OSSpinLock *lock);
void OSSpinLockLock(OSSpinLock *lock);
void OSSpinLockUnlock(OSSpinLock *lock);
*)
//
extern
fun
OSSpinLockLock
  (lock: &OSSpinLock): (locked_v | void) = "mac#"
//
extern
fun
OSSpinLockUnlock
  (pf: locked_v | lock: &OSSpinLock): void = "mac#"
//
extern
fun
OSSpinLockTry
  (lock: &OSSpinLock)
: [b:bool] (option_v(locked_v, b) | bool(b)) = "mac#"
//
(* ****** ****** *)

fun
OSSpinLock_initize
  (lock: &OSSpinLock? >> _): void = let
//
val () =
$extfcall
(
  void, "memset", addr@lock, sizeof<OSSpinLock>, 0
) (* end of [val] *)
//
prval () =
__assert(lock) where
{
  extern praxi __assert (lock: &OSSpinLock? >> _): void
}
//
in
  // nothing
end // end of [OSpinLock_initize]

(* ****** ****** *)

implement
main0 () =
{
//
var lock: OSSpinLock
//
val () = OSSpinLock_initize (lock)
//
val (pf | ()) = OSSpinLockLock(lock)
val ((*void*)) = OSSpinLockUnlock(pf | lock)
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [OSSpinLock-osx.dats] *)
