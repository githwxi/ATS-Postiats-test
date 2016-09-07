(* ****** ****** *)
//
// Testing functions on queues
//
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
#include
"share/HATS/atspre_staload_libats_ML.hats"
//
(* ****** ****** *)

staload "./../mylib/myqueue.dats"

(* ****** ****** *)
//
val Q = queue_make_nil<int>()
//
val () = queue_enqueue<int>(Q, 1)
val () = queue_enqueue<int>(Q, 2)
val () = queue_enqueue<int>(Q, 3)
//
val-Some(x) = queue_dequeue_opt<int>(Q)
val () = println! ("x(1) = ", x)
val-Some(x) = queue_dequeue_opt<int>(Q)
val () = println! ("x(2) = ", x)
//
val () = queue_enqueue<int>(Q, 4)
val () = queue_enqueue<int>(Q, 5)
val-Some(x) = queue_dequeue_opt<int>(Q)
val () = println! ("x(3) = ", x)
val-Some(x) = queue_dequeue_opt<int>(Q)
val () = println! ("x(4) = ", x)
val-Some(x) = queue_dequeue_opt<int>(Q)
val () = println! ("x(5) = ", x)
//
val-None((*empty*)) = queue_dequeue_opt<int>(Q)
//
(* ****** ****** *)

implement main0() = ()

(* ****** ****** *)

(* end of [myqueue_test.dats] *)
