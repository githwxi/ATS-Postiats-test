(* ****** ****** *)
//
// Implement lambda_library
//
(* ****** ****** *)
//
#include
"share/atspre_staload.hats"
//
(* ****** ****** *)

staload "./lambda.sats"

(* ****** ****** *)

implement
fprint_val<value> = fprint_value

(* ****** ****** *)

local

typedef
key = string and itm = value

in (* in-of-local *)

#include "libats/ML/HATS/myhashtblref.hats"

end // end of [local]

(* ****** ****** *)

val x = vnam_string"x"
val f = vnam_string"f"
val xs = vnam_string"xs"

(* ****** ****** *)

val x_tm = TMvar(x)
val f_tm = TMvar(f)
val xs_tm = TMvar(xs)

(* ****** ****** *)
//
macdef
TMapp2(t_f, t_1, t_2) =
  TMapp(TMapp(,(t_f), ,(t_1)), ,(t_2))
//
(* ****** ****** *)
//
macdef TMadd(t1, t2) =
  TMopr("+", $list{term}(,(t1), ,(t2)))
macdef TMsub(t1, t2) =
  TMopr("-", $list{term}(,(t1), ,(t2)))
macdef TMmul(t1, t2) =
  TMopr("*", $list{term}(,(t1), ,(t2)))
macdef TMdiv(t1, t2) =
  TMopr("/", $list{term}(,(t1), ,(t2)))
macdef TMmod(t1, t2) =
  TMopr("%", $list{term}(,(t1), ,(t2)))
//
(* ****** ****** *)

macdef TMsucc(t) = TMadd(,(t), TMint(1))
macdef TMpred(t) = TMsub(,(t), TMint(1))

(* ****** ****** *)

macdef TMisnil(xs) = TMopr("isnil", $list{term}(,(xs)))
macdef TMiscons(xs) = TMopr("iscons", $list{term}(,(xs)))
macdef TMlist_hd(xs) = TMopr("list_hd", $list{term}(,(xs)))
macdef TMlist_tl(xs) = TMopr("list_tl", $list{term}(,(xs)))

(* ****** ****** *)
//
val
theLibenv =
  myhashtbl_make_nil(1024)
//
(* ****** ****** *)

implement
lambda_eval_cst(c0) = let
  val c0 = cnam2string(c0)
  val opt = myhashtbl_search(theLibenv, c0)
in
//
case+ opt of
| ~Some_vt(v_def) => v_def
| ~None_vt((*void*)) => let
    val () =
      prerrln! ("lambda_eval_cst: c0 = ", c0)
    // end of [val]
  in
    exit(1){value}
  end // end of [None_vt]
//
end // end of [lambda_eval_cst]

(* ****** ****** *)
//
val
theEnvmap_nil =
  envmap_make_nil()
//
(* ****** ****** *)
//
val
list_length_tm =
TMfix(
  f
, TMlam(
    xs
  , TMcond(
      TMisnil(xs_tm)
    , TMint(0)
    , TMsucc(TMapp(f_tm, TMlist_tl(xs_tm)))
    )
  )
)
//
val-~None_vt() =
  theLibenv.insert("list_length", VALfix(list_length_tm, theEnvmap_nil))
//
(* ****** ****** *)

(* end of [lambda_libenv.dats] *)
