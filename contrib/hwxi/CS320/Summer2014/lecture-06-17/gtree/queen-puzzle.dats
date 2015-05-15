(* ******* ****** *)

#include
"share/atspre_staload.hats"

(* ******* ****** *)

staload
"libats/ML/SATS/basis.sats"
staload
"libats/ML/SATS/list0.sats"

(* ******* ****** *)

staload
_ = "libats/ML/DATS/list0.dats"

(* ******* ****** *)

staload "./gtree.sats"
staload _ = "./gtree.dats"

(* ******* ****** *)

typedef
int2 = (int, int)
//
assume node = list0 (int2)
//
(* ******* ****** *)

#define N 8

(* ******* ****** *)
//
fun
show_dots (n: int) = 
  if n > 0 then (print ". "; show_dots (n-1))
fun
show_int2 (x: int2): void =
  (show_dots (x.1); print "Q "; show_dots (N-1-x.1))
//
(* ******* ****** *)

fun
show_path
(
  xs: list0 (int2)
) : void =
(
case+ xs of
| nil0 () => ()
| cons0 (x, xs) =>
  (
    show_int2 (x); print_newline (); show_path (xs)
  ) (* end of [cons0] *)
)

(* ******* ****** *)

fun
path_test
  (x0: int2, xs: list0(int2)): bool =
(
case+ xs of
| nil0 () => true
| cons0 (x, xs) =>
  (
    case+ 0 of
    | _ when (x0.0 = x.0) => false
    | _ when (x0.1 = x.1) => false
    | _ when (abs(x0.0 - x.0) = abs(x0.1 - x.1)) => false
    | _ => path_test (x0, xs)
  ) (* end of [cons0] *)
)

(* ******* ****** *)

exception SolutionFoundExn of ()

(* ******* ****** *)

val theNumberOfSolution = ref<int> (0)

(* ******* ****** *)

implement
process_node<>
  (xs0) =
(
case+ xs0 of
| nil0 () => true
| cons0 (x, xs) => let
    val test = path_test (x, xs)
  in
    case+ test of
    | true => let
        val len = length (xs0)
      in
        if len < N
          then true
          else let
            val n = !theNumberOfSolution
            val () = !theNumberOfSolution := n+1
            val () = println! ("Solution [", n, "] is found!")
            val () = show_path (list0_reverse (xs0))
            val () = print_newline ((*void*))
          in
            false
          end // end of [else]
      end
    | false => false
  end
) (* end of [process_node] *)

(* ****** ****** *)

implement
node_get_children<> (nx0) = let
//
val i = length (nx0)
//
fun aux (j: int): nodelst =
  if j < N
    then cons0 (cons0 ((i, j), nx0), aux (j+1))
    else nil0 ()
  // end of [if]
//
in
  aux (0)
end // end of [node_get_children]

(* ****** ****** *)

implement
main0 () =
{
//
val () = search_depth<> (nil0)
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [queen-puzzle.dats] *)
