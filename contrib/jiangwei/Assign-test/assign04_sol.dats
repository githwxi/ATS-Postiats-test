(* ****** ****** *)

#include "./assign04.dats"

(* ****** ****** *)

(*
Please do your implementation below:
*)

(* ****** ****** *)

#define N 8 // HX: this should not be changed!


extern
fun
print_value(t0: value): void
extern
fun
fprint_value(out: FILEref, t0: value): void

overload print with print_value
overload fprint with fprint_value

(* ****** ****** *)

implement
fprint_val<value> = fprint_value

implement
print_value
(t0) = fprint_value(stdout_ref, t0)

implement
fprint_value(out, t0) =
(
case+ t0 of
//
| VALint(i) => fprint!(out, "VALint(", i, ")")
| VALstr(s) => fprint!(out, "VALstr(", s, ")")
//
| VALtup(vs) => fprint!(out, "VALtup(", vs, ")")
//
| VALlam(_, _) => fprint!(out, "VALlam(_, _)")
| VALfix(_, _) => fprint!(out, "VALfix(_, _)")
//
| VALunit() => fprint!(out, "VALunit()")
//
)

extern
fun
interp2 : (term, envir) -> value

overload interp with interp1
overload interp with interp2

implement
interp1(src) =
interp2(src, list0_nil())


extern
fun
envir_find :
(envir, string) -> value
implement
envir_find(env, x0) =
(
case- env of
| list0_cons(xv, env) =>
  if x0 = xv.0
    then xv.1 else envir_find(env, x0)
  // end of [if]
)


fun
interp2_list
(ts: termlst, env: envir): valuelst =
list0_map<term><value>(ts, lam(t) => interp2(t, env))

implement
interp2(t0, env) =
(
case t0 of
//
| TMint(i) => VALint(i)
| TMstr(s) => VALstr(s)
//
| TMvar(x) => envir_find(env, x)
//
| TMlam _ => VALlam(t0, env)
| TMfix _ => VALfix(t0, env)
//
| TMtup(ts) =>
  VALtup(interp2_list(ts, env))
//
| TMproj
    (t_tup, i) => let
    val v_tup = interp2(t_tup, env)
  in
    case- v_tup of
    | VALtup(vs) => vs[i] // = list0_get_at_exn(vs, i)
  end
//
| TMapp(t1, t2) => let
    val v1 = interp2(t1, env)
  in
    case- v1 of
    | VALlam
      (t_lam, env_lam) => let
        val v2 = interp2(t2, env)
        val-TMlam(x, t_body) = t_lam
        val env_lam = list0_cons($tup(x, v2), env_lam)
      in
        interp2(t_body, env_lam)
      end
    | VALfix
      (t_fix, env_fix) => let
        val v2 = interp2(t2, env)
        val-TMfix(f, x, t_body) = t_fix
        val env_fix = list0_cons($tup(x, v2), env_fix)
        val env_fix = list0_cons($tup(f, v1), env_fix)
      in
        interp2(t_body, env_fix)
      end
  end // end of [TMapp]
//
| TMopr _ => interp2_opr(t0, env)
//
| TMifnz
    (t1, t2, t3) => let
    val v1 = interp2(t1, env)
  in
    case- v1 of
    | VALint(i) =>
      interp2(if i != 0 then t2 else t3, env)
  end
//
| TMseq(t1, t2) =>
  let val _ = interp2(t1, env) in interp2(t2, env) end
) where
{
//
fun
interp2_opr
( t0: term
, env: envir): value = let
//
#define :: list0_cons
#define nil list0_nil
//
val-TMopr(opr, ts) = t0
//
val vs =
list0_map<term><value>(ts, lam(t) => interp2(t, env))
//
in
case- opr of
| "+" =>
  (
    case- vs of
    | VALint(i1)::VALint(i2)::nil() => VALint(i1+i2)
  )
| "-" =>
  (
    case- vs of
    | VALint(i1)::VALint(i2)::nil() => VALint(i1-i2)
  )
| "*" =>
  (
    case- vs of
    | VALint(i1)::VALint(i2)::nil() => VALint(i1*i2)
  )
| "/" =>
  (
    case- vs of
    | VALint(i1)::VALint(i2)::nil() => VALint(i1/i2)
  )
| "~" =>
  (
    case- vs of VALint(i1)::nil() => VALint(~i1)
  )
| "abs" =>
  (
    case- vs of VALint(i1)::nil() => VALint(abs(i1))
  )
| "<" =>
  (
    case- vs of
    | VALint(i1)::VALint(i2)::nil() => if (i1 < i2) then VALint(1) else VALint(0)
  )
| ">" =>
  (
    case- vs of
    | VALint(i1)::VALint(i2)::nil() => if (i1 > i2) then VALint(1) else VALint(0)
  )
| "<=" =>
  (
    case- vs of
    | VALint(i1)::VALint(i2)::nil() => if (i1 <= i2) then VALint(1) else VALint(0)
  )
| ">=" =>
  (
    case- vs of
    | VALint(i1)::VALint(i2)::nil() => if (i1 >= i2) then VALint(1) else VALint(0)
  )
| "=" =>
  (
    case- vs of
    | VALint(i1)::VALint(i2)::nil() => if (i1 = i2) then VALint(1) else VALint(0)
  )
| "print" =>
  (
    case- vs of v0::nil() =>
    (
    let val () =
      case+ v0 of
      | VALint(i) => print(i)
      | VALstr(s) => print(s)
      | VALtup(vs) => print("VALtup(...)")
      | VALlam(_, _) => print("VALlam(...)")
      | VALfix(_, _) => print("VALfix(...)")
      | VALunit() => print("VALunit()")
    in
      VALunit()
    end
    )
  )
| "println" =>
  (
    case- vs of v0::nil() =>
    (
    let val () =
      case+ v0 of
      | VALint(i) => println!(i)
      | VALstr(s) => println!(s)
      | VALtup(vs) => print("VALtup(...)")
      | VALlam(_, _) => println!("VALlam(...)")
      | VALfix(_, _) => println!("VALfix(...)")
      | VALunit() => print("VALunit()")
    in
      VALunit()
    end
    )
  )

end // end of [interp2_opr]

} (* end of [interp2] *)

(* ****** ****** *)
//
val x = TMvar("x")
val f = TMvar("f")
//
(* ****** ****** *)

fun
sub_term_int
(t1: term, i2: int): term =
TMopr
( "-"
, list0_tuple(t1, TMint(i2)))

fun
sub_term_term
(t1: term, i2: term): term =
TMopr
( "-"
, list0_tuple(t1, i2))

fun
add_term_term
(t1: term, t2: term): term =
TMopr("+", list0_tuple(t1, t2))

fun
add_term_int
(t1: term, t2: int): term =
TMopr("+", list0_tuple(t1, TMint(t2)))

fun
mul_term_term
(t1: term, t2: term): term =
TMopr("*", list0_tuple(t1, t2))

fun
abs_term
(t1: term): term =
TMopr("abs", list0_tuple(t1))

fun
less_term_term
(t1: term, t2: term): term =
TMopr("<", list0_tuple(t1, t2))

fun
more_term_term
(t1: term, t2: term): term =
TMopr(">", list0_tuple(t1, t2))

fun
less_eq_term_term
(t1: term, t2: term): term =
TMopr("<=", list0_tuple(t1, t2))

fun
more_eq_term_term
(t1: term, t2: term): term =
TMopr(">=", list0_tuple(t1, t2))

fun
equal_term_term
(t1: term, t2: term): term =
TMopr("=", list0_tuple(t1, t2))

fun
equal_term_int
(t1: term, t2: int): term =
TMopr("=", list0_tuple(t1, TMint(t2)))

overload - with sub_term_int
overload - with sub_term_term
overload + with add_term_term
overload + with add_term_int
overload * with mul_term_term
overload abs with abs_term
overload < with less_term_term
overload > with more_term_term
overload <= with less_eq_term_term
overload >= with more_eq_term_term
overload = with equal_term_term
overload = with equal_term_int

fun board(t0: term, t1: term, t2: term, t3: term, t4: term, t5: term, t6: term, t7: term): term =
 TMtup(cons0(t0, cons0(t1, cons0(t2, cons0(t3, cons0(t4, cons0(t5, cons0(t6, cons0(t7, nil0())))))))))

 fun board_get_data(t0: term, t1: term): term =
 TMtup(cons0(t0, cons0(t1, nil0())))

fun fst(t0: term): term = TMproj(t0, 0)
fun snd(t0: term): term = TMproj(t0, 1)
fun thrd(t0: term): term = TMproj(t0, 2)
fun fourth(t0: term): term = TMproj(t0, 3)
fun fifth(t0: term): term = TMproj(t0, 4)
fun sixth(t0: term): term = TMproj(t0, 5)
fun seventh(t0: term): term = TMproj(t0, 6)
fun eighth(t0: term): term = TMproj(t0, 7)

val bd_get_data = TMvar("bd_get_data")

val board_get = 
  TMlam("bd_get_data", TMifnz( snd(bd_get_data) = 0 , fst(fst(bd_get_data)) , TMifnz( snd(bd_get_data) = 1 , snd(fst(bd_get_data)) , TMifnz( snd(bd_get_data) = 2 , thrd(fst(bd_get_data)) ,  TMifnz( snd(bd_get_data) = 3 , fourth(fst(bd_get_data)) ,  TMifnz( snd(bd_get_data) = 4 , fifth(fst(bd_get_data)) ,  TMifnz( snd(bd_get_data) = 5 , sixth(fst(bd_get_data)) , TMifnz( snd(bd_get_data) = 6 , seventh(fst(bd_get_data)) , TMifnz( snd(bd_get_data) = 7 , eighth(fst(bd_get_data)) , TMint(0) ) ) ) ))))))

  fun board_set_data(t0: term, t1: term, t2:term ): term =
 TMtup(cons0(t0, cons0(t1, cons0(t2, nil0()))))

val bd_set_data = TMvar("bd_set_data")

// fun board_set(bd: term, i: term, j: term): term = 

val board_set = 
  TMlam("bd_set_data", TMifnz( snd(bd_set_data) = 0 , board( thrd(bd_set_data) , TMapp( board_get, board_get_data( fst(bd_set_data), TMint(1))) , TMapp( board_get, board_get_data( fst(bd_set_data), TMint(2))) , TMapp( board_get, board_get_data( fst(bd_set_data), TMint(3))), TMapp( board_get, board_get_data( fst(bd_set_data), TMint(4))), TMapp( board_get, board_get_data( fst(bd_set_data), TMint(5))), TMapp( board_get, board_get_data( fst(bd_set_data), TMint(6))), TMapp( board_get, board_get_data( fst(bd_set_data), TMint(7)))) , 
  
  TMifnz( snd(bd_set_data) = 1 , board( TMapp( board_get, board_get_data( fst(bd_set_data), TMint(0))), thrd(bd_set_data) , TMapp( board_get, board_get_data( fst(bd_set_data), TMint(2))) , TMapp( board_get, board_get_data( fst(bd_set_data), TMint(3))), TMapp( board_get, board_get_data( fst(bd_set_data), TMint(4))), TMapp( board_get, board_get_data( fst(bd_set_data), TMint(5))), TMapp( board_get, board_get_data( fst(bd_set_data), TMint(6))), TMapp( board_get, board_get_data( fst(bd_set_data), TMint(7)))) , 
  
  TMifnz( snd(bd_set_data) = 2 , board( TMapp( board_get, board_get_data( fst(bd_set_data), TMint(0))), TMapp( board_get, board_get_data( fst(bd_set_data), TMint(1))) , thrd(bd_set_data) , TMapp( board_get, board_get_data( fst(bd_set_data), TMint(3))), TMapp( board_get, board_get_data( fst(bd_set_data), TMint(4))), TMapp( board_get, board_get_data( fst(bd_set_data), TMint(5))), TMapp( board_get, board_get_data( fst(bd_set_data), TMint(6))), TMapp( board_get, board_get_data( fst(bd_set_data), TMint(7)))) , 
  
  TMifnz( snd(bd_set_data) = 3 , board( TMapp( board_get, board_get_data( fst(bd_set_data), TMint(0))), TMapp( board_get, board_get_data( fst(bd_set_data), TMint(1))) , TMapp( board_get, board_get_data( fst(bd_set_data), TMint(2))) , thrd(bd_set_data), TMapp( board_get, board_get_data( fst(bd_set_data), TMint(4))), TMapp( board_get, board_get_data( fst(bd_set_data), TMint(5))), TMapp( board_get, board_get_data( fst(bd_set_data), TMint(6))), TMapp( board_get, board_get_data( fst(bd_set_data), TMint(7)))) , 
  
  TMifnz( snd(bd_set_data) = 4 , board( TMapp( board_get, board_get_data( fst(bd_set_data), TMint(0))), TMapp( board_get, board_get_data( fst(bd_set_data), TMint(1))) , TMapp( board_get, board_get_data( fst(bd_set_data), TMint(2))) , TMapp( board_get, board_get_data( fst(bd_set_data), TMint(3))), thrd(bd_set_data), TMapp( board_get, board_get_data( fst(bd_set_data), TMint(5))), TMapp( board_get, board_get_data( fst(bd_set_data), TMint(6))), TMapp( board_get, board_get_data( fst(bd_set_data), TMint(7)))) , 

  TMifnz( snd(bd_set_data) = 5 , board( TMapp( board_get, board_get_data( fst(bd_set_data), TMint(0))), TMapp( board_get, board_get_data( fst(bd_set_data), TMint(1))) , TMapp( board_get, board_get_data( fst(bd_set_data), TMint(2))) , TMapp( board_get, board_get_data( fst(bd_set_data), TMint(3))), TMapp( board_get, board_get_data( fst(bd_set_data), TMint(4))), thrd(bd_set_data), TMapp( board_get, board_get_data( fst(bd_set_data), TMint(6))), TMapp( board_get, board_get_data( fst(bd_set_data), TMint(7)))) , 
  
  TMifnz( snd(bd_set_data) = 6 , board( TMapp( board_get, board_get_data( fst(bd_set_data), TMint(0))), TMapp( board_get, board_get_data( fst(bd_set_data), TMint(1))) , TMapp( board_get, board_get_data( fst(bd_set_data), TMint(2))) , TMapp( board_get, board_get_data( fst(bd_set_data), TMint(3))), TMapp( board_get, board_get_data( fst(bd_set_data), TMint(4))), TMapp( board_get, board_get_data( fst(bd_set_data), TMint(5))), thrd(bd_set_data), TMapp( board_get, board_get_data( fst(bd_set_data), TMint(7)))) , 
  
  TMifnz( snd(bd_set_data) = 7 , board( TMapp( board_get, board_get_data( fst(bd_set_data), TMint(0))), TMapp( board_get, board_get_data( fst(bd_set_data), TMint(1))) , TMapp( board_get, board_get_data( fst(bd_set_data), TMint(2))) , TMapp( board_get, board_get_data( fst(bd_set_data), TMint(3))), TMapp( board_get, board_get_data( fst(bd_set_data), TMint(4))), TMapp( board_get, board_get_data( fst(bd_set_data), TMint(5))), TMapp( board_get, board_get_data( fst(bd_set_data), TMint(6))), thrd(bd_set_data) ) , fst(bd_set_data)  )  ) ) ) ) ) ) ))


fun safety_test1_data(t0: term, t1: term, t2: term, t3: term): term =
 TMtup(cons0(t0, cons0(t1, cons0(t2, cons0(t3, nil0())))))

val sf1data = TMvar("sf1data")

val safety_test1 = 
  TMlam("sf1data", TMifnz( snd(sf1data) = fourth(sf1data) , TMint(0) , TMifnz( abs (fst(sf1data) - thrd(sf1data) ) = abs (snd(sf1data) - fourth(sf1data)) , TMint(0) , TMint(1) ) ) )

fun safety_test2_data(t0: term, t1: term, t2: term, t3: term): term =
 TMtup(cons0(t0, cons0(t1, cons0(t2, cons0(t3, nil0())))))

val sf2data = TMvar("sf2data")

 val safety_test2 = 
 TMfix("f", "sf2data", TMifnz( fourth(sf2data) >= TMint(0), TMifnz(TMapp(safety_test1, safety_test1_data( fst(sf2data), snd(sf2data), fourth(sf2data), TMapp(board_get, board_get_data( thrd(sf2data), fourth(sf2data) ) ) )), TMapp(f, safety_test2_data( fst(sf2data), snd(sf2data), thrd(sf2data), fourth(sf2data)-1 ) ) , TMint(0)) , TMint(1) ) )


fun search_data(t0: term, t1: term, t2: term, t3: term): term =
 TMtup(cons0(t0, cons0(t1, cons0(t2, cons0(t3, nil0())))))

val scdata = TMvar("scdata")
val i = TMvar("i")
val print_dots = 
  TMfix("f", "i",  TMifnz( (i > TMint(0)), TMseq( TMopr("print", list0_tuple(TMstr(".")) ) , TMapp(f, i-1) ) , i ) )

val print_row = 
  TMlam("i", TMseq( TMapp(print_dots, i) , TMseq( TMopr("print", list0_tuple(TMstr("Q")) ) , TMseq( TMapp(print_dots, TMint(N-1) - i), TMopr("print", list0_tuple(TMstr("\n"))) ) )))

val bd_data = TMvar("bd_data")
val print_bd = 
  TMlam("bd_data", TMseq( TMapp(print_row, fst(bd_data)) ,  TMseq( TMapp(print_row, snd(bd_data)) ,  TMseq( TMapp(print_row, thrd(bd_data)) ,  TMseq( TMapp(print_row, fourth(bd_data)) ,  TMseq( TMapp(print_row, fifth(bd_data)) ,  TMseq( TMapp(print_row, sixth(bd_data)) ,  TMseq( TMapp(print_row, seventh(bd_data)) , TMapp(print_row, eighth(bd_data))  ))))))) )



val search = 
TMfix("f", "scdata", TMifnz( thrd(scdata) < TMint(N) , 

  TMifnz( TMapp(safety_test2, safety_test2_data( snd(scdata), thrd(scdata), fst(scdata) , snd(scdata)-1) ), 

TMifnz( ((snd(scdata)+1) - N) = 0, 

  TMseq( TMapp(print_bd, TMapp(board_set, board_set_data( fst(scdata) , snd(scdata) , thrd(scdata) )) ) , TMapp(f, search_data( fst(scdata) , snd(scdata) , thrd(scdata)+1 , fourth(scdata)+1 )))

,  TMapp(f, search_data( TMapp(board_set, board_set_data( fst(scdata) , snd(scdata) , thrd(scdata) )) , snd(scdata) + TMint(1) , TMint(0) , fourth(scdata) )) )

 , TMapp(f, search_data(fst(scdata), snd(scdata) , thrd(scdata)+1 , fourth(scdata) )) )


 , TMifnz( snd(scdata) > TMint(0), TMapp(f, search_data( fst(scdata), snd(scdata)-1 , TMapp(board_get, board_get_data(fst(scdata), snd(scdata)-1) ) + 1 , fourth(scdata) ) ) , fourth(scdata) ) ) )


(* ****** ****** *)
val sample_board = board(TMint(3), TMint(7), TMint(2), TMint(3), TMint(4), TMint(5), TMint(6), TMint(7))
val start_board = board(TMint(0), TMint(0), TMint(0), TMint(0), TMint(0), TMint(0), TMint(0), TMint(0))
(* ****** ****** *)

implement main0() = () where
{

// val () = println!("print_dots = ", interp(TMapp(print_dots, TMint(5))))
// val () = println!("print_row = ", interp(TMapp(print_row, TMint(5))))
// val () = println!("print_bd = ", interp(TMapp(print_bd, sample_board)))

val () = println!("search = ", interp(TMapp(search, search_data( start_board , TMint(0) , TMint(0) , TMint(0) ))))

}

(* end of [assign04_sol.dats] *)