(*
**
Time: 2016-01-18
Reported by Khalil El Harake
**
*)
(* ****** ****** *)
(*

Tried with ats2 0.2.2 and 0.2.6

If line 52 is set to myprint0, it results in an infinite loop.

However if line 52 is set to myprint1, the program executes properly.

> patscc printinf.dats -DATS_MEMALLOC_LIBC; ./a.out 
elt
elt
elt
elt
elt
elt
elt
nil
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
  myprint0(): void

extern fun
  {cdr:type}
  myprint1(): void

// --------------

implement (car,cdr) myprint0<car::cdr>() = let
  val () = println!("elt")
in
// *****************************************************************
// ** swap myprint0 for myprint1 to remove infinite loop          **
// *****************************************************************
//
// myprint0<cdr>()
// is to be changed into
   ignoret(myprint0<cdr>())
//
end

implement myprint0<nil_t>() =
  println!("nil")

// --------------

implement (car,cdr) myprint1<car::cdr>() = let
  val () = println!("elt")
in
  myprint0<cdr>()
end

implement myprint1<nil_t>() =
  println!("nil")

// --------------



implement main0() = let
  val () = myprint0<1::2::3::4::5::6::7::nil_t>()
in
  ()
end


(* end of [test35.dats] *)
