(*
**
Time: 2016-01-18
Reported by Khalil El Harake
**
*)
(*

Tried with ats2 0.2.2 and 0.2.6

> patscc sigsegv.dats -DATS_MEMALLOC_LIBC; ./a.out 
1
2
fish: “./a.out” terminated by signal SIGSEGV (Address boundary error)

*)

#define ATS_DYNLOADFLAG 0  
  
#include
"share/atspre_staload.hats"

abstype nil_t
abstype cons_t(int, type)

stadef :: = cons_t

datatype mylist_t(type) =
| mynil(nil_t) of ()
| {x:int}{xs:type}
  mycons(x::xs) of (int(x), mylist_t(xs))

extern fun
  {cdr:type}
  myprint(mylist_t(cdr)): void

fun do_nothing() = ()

implement (car,cdr) myprint<car::cdr>(lst) = let
  val+mycons(x,xs) = lst
  val () = println!(x)
in
//
// myprint<cdr>(xs)
// needs to be changed into
//
  ignoret(myprint<cdr>(xs))
//
end

implement myprint<nil_t>(x) =
  println!("nil")

implement main0() = let
  val x = mycons(1, mycons(2, mynil()))
  val () = myprint(x)
in
  ()
end


(* end of [test34.dats] *)