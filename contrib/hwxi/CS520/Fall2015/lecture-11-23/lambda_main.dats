(* ****** ****** *)

staload "lambda.sats"

(* ****** ****** *)

dynload "lambda_vnam.dats"
dynload "lambda_term.dats"

(* ****** ****** *)
//
val x = vnam_string"x"
val f = vnam_string"f"
//
val x_var = TMvar(x)
val f_var = TMvar(f)
//
val omega =
  TMlam(x, TMapp(TMvar(x), TMvar(x)))
//
val Omega = TMapp(omega, omega)
//
(* ****** ****** *)

(*
val _ = eval_cbn(Omega)
val _ = eval_cbv(Omega)
*)

(* ****** ****** *)

val Z = TMlam(f, TMlam(x, x_var))
val SZ = TMlam(f, TMlam(x, TMapp(f_var, x_var)))
val SSZ = TMlam(f, TMlam(x, TMapp(f_var, TMapp(f_var, x_var))))
val SSSZ = TMlam(f, TMlam(x, TMapp(f_var, TMapp(f_var, TMapp(f_var, x_var)))))

(* ****** ****** *)

macdef
TMapp2 (f, x0, x1) = TMapp(TMapp(,(f), ,(x0)), ,(x1))

(* ****** ****** *)
//
val _0_ = TMint(0)
val _1_ = TMint(1)
val _succ_ = TMlam(x, TMopr("+", $list{term}(x_var, _1_)))
//
(* ****** ****** *)

val () = println! ("Z = ", Z)
val () = println! ("SZ = ", SZ)
val () = println! ("SSZ = ", SSZ)
val () = println! ("SSSZ = ", SSSZ)

(* ****** ****** *)

val () = println! ("Z = ", eval_cbv(TMapp2(Z, _succ_, _0_)))
val () = println! ("SZ = ", eval_cbv(TMapp2(SZ, _succ_, _0_)))
val () = println! ("SSZ = ", eval_cbv(TMapp2(SSZ, _succ_, _0_)))
val () = println! ("SSSZ = ", eval_cbv(TMapp2(SSSZ, _succ_, _0_)))

(* ****** ****** *)

val m = vnam_string"m"
val n = vnam_string"n"
val m_var = TMvar(m)
val n_var = TMvar(n)

val TMadd =
  TMlam(m, TMlam(n, TMlam(f, TMlam(x, TMapp2(m_var, f_var, (TMapp2(n_var, f_var, x_var)))))))

(* ****** ****** *)

val SSSSSZ = eval_cbv(TMapp2(TMadd, SSZ, SSSZ))
val () = println! ("SSSSSZ = ", eval_cbv(TMapp2(SSSSSZ, _succ_, _0_)))

(* ****** ****** *)

implement main0 () = ()

(* ****** ****** *)

(* end of [lambda_main.dats] *)
