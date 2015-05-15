(* ****** ****** *)
//
staload
"libats/ML/SATS/basis.sats"
staload
"libats/ML/SATS/list0.sats"
//
(* ****** ****** *)

staload "./graph.sats"

(* ****** ****** *)

datatype
queue (a:t@ype) = Q of (list0 (a), list0 (a))

(* ****** ****** *)

extern
fun{a:t@ype}
queue_make_nil (): queue (a)

implement
{a}(*tmp*)
queue_make_nil () = Q (nil0, nil0 ())

(* ****** ****** *)

extern
fun{a:t@ype}
queue_insert (q: queue(a), x: a): queue(a)

implement
{a}(*tmp*)
queue_insert
  (q, x) =
(
  let val+Q (f, r) =  q in Q (cons0 (x, f), r) end
) // end of [queue_insert]

(* ****** ****** *)

extern
fun{a:t@ype}
queue_takeout (q: queue(a)): (queue(a), option0(a))

(* ****** ****** *)

implement
{a}(*tmp*)
queue_takeout
  (q) = let
  val+Q (f, r) =  q
in
  case+ r of
  | nil0 () => let
      val r = list0_reverse (f)
    in
      case+ r of
      | nil0 () => (q, None0 ())
      | cons0 (x, r) => (Q (nil0 (), r), Some0 (x))
    end
  | cons0 (x, r) => (Q (f, r), Some0 (x))
end // end of [queue_takeout]

(* ****** ****** *)

assume nodeset = queue (node)

(* ****** ****** *)

implement
{}(*tmp*)
nodeset_insert
  (nxs, nx) = queue_insert (nxs, nx)

(* ****** ****** *)

implement
{}(*tmp*)
nodeset_takeout (nxs) = queue_takeout (nxs)

(* ****** ****** *)

(* end of [graph-breadth.dats] *)
