(* ****** ****** *)
//
// HX-2013-10-22
//
// Implementing
// the produce/consume problem
//
(* ****** ****** *)

abstype bufitm_type
typedef bufitm = bufitm_type

(* ****** ****** *)

absvtype buffer_vtype = ptr
vtypedef buffer = buffer_vtype

(* ****** ****** *)

extern
fun buffer_isnil (!buffer): bool
extern
fun buffer_isful (!buffer): bool

extern
fun buffer_remove (!buffer): bufitm
extern
fun buffer_insert (!buffer, bufitm): void

(* ****** ****** *)

extern
fun buffer_acquire (): buffer
extern
fun buffer_release (buffer): void

(* ****** ****** *)

abstype condvar_type
typedef condvar = condvar_type

(* ****** ****** *)

extern
fun condvar_signal (condvar): void

extern
fun buffer_condwait (!buffer, condvar): void

(* ****** ****** *)

extern val CV_isnil: condvar
extern val CV_isful: condvar

(* ****** ****** *)

extern
fun buffer_consume (!buffer): bufitm

implement
buffer_consume (buf) =
(
  if buffer_isnil (buf) then let
    val () = buffer_condwait (buf, CV_isnil)
  in
    buffer_consume (buf)
  end else let
    val isful = buffer_isful (buf)
    val itm = buffer_remove (buf)
    val () = if isful then condvar_signal (CV_isful)
  in
    itm
  end // end of [if]
)  

(* ****** ****** *)

extern
fun buffer_produce (!buffer, bufitm): void

implement
buffer_produce (buf, itm) =
(
  if buffer_isful (buf) then let
    val () = buffer_condwait (buf, CV_isful)
  in
    buffer_produce (buf, itm)
  end else let
    val isnil = buffer_isnil (buf)
    val () = buffer_insert (buf, itm)
    val () = if isnil then condvar_signal (CV_isnil)
  in
    // nothing
  end // end of [if]
)  

(* ****** ****** *)

extern fun consume (): bufitm
extern fun produce (bufitm): void

(* ****** ****** *)

implement
consume () = itm where
{
  val buf = buffer_acquire ()
  val itm = buffer_consume (buf)
  val () = buffer_release (buf)
}

(* ****** ****** *)

implement
produce (itm) = () where
{
  val buf = buffer_acquire ()
  val () = buffer_produce (buf, itm)
  val () = buffer_release (buf)
}

(* ****** ****** *)

(* end of [ProduceConsume.dats] *)
