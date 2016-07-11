(* ****** ****** *)

(*
//
The code is taken from:
https://groups.google.com/forum/#!topic/ats-lang-users/A8kzvx42pVk
//
Author: Hanwen Wu
// with minor modification by Hongwei Xi
//
Start time: the 10th of July, 2016
//
*)

(* ****** ****** *)

#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"
#include "share/HATS/atspre_staload_libats_ML.hats"

(* ****** ****** *)

staload UN = "prelude/SATS/unsafe.sats"

(* ****** ****** *)

abstype parser(a:t@ype) = ptr 

abstype input_t  = ptr
abstype output_t = ptr 

(* ****** ****** *)

typedef cont_t (a:t@ype) = (a, input_t) -<cloref1> output_t 
typedef cont_t = [a:t@ype] cont_t a

typedef par_t  (a:t@ype) = (input_t, cont_t a) -<cloref1> output_t
typedef par_t = [a:t@ype] par_t a
 
extern castfn parser_encode {a:t@ype} (par_t a): parser a
extern castfn parser_decode {a:t@ype} (parser a): par_t a

extern fun {a:t@ype} memo0 (() -<cloref1> parser a): (() -<cloref1> parser a) 
extern fun {a,b:t@ype} memo1 (a -<cloref1> parser b): (a -<cloref1> parser b)

(* ****** ****** *)

implement
{a}
memo0 (f) = let val p = f () in lam () => p end

(* ****** ****** *)

implement
{a,b}
memo1 (f) = let 
//
#define ::  list0_cons 
#define nil list0_nil

typedef key = a 
typedef itm = parser b
    
staload FM = "libats/ML/SATS/funmap.sats"
staload _(*anon*) = "libats/ML/DATS/funmap.dats"    
staload _(*anon*) = "libats/DATS/funmap_avltree.dats"

(* ****** ****** *)
    
implement
$FM.compare_key_key<key>
  (x, y) = gcompare_val_val<key> (x, y)

val table = ref<$FM.map(key,itm)> ($FM.funmap_nil<>())

in 
//
lam a =<cloref1> 
  case+ $FM.funmap_search<key,itm> (!table, a) of 
     | ~Some_vt p  => p
     | ~None_vt () => let 
         val p = f a 
         var t = !table
         val- ~None_vt () = $FM.funmap_insert<key,itm> (t, a, p)
         val _ = !table := t
       in 
         p
       end 
end

(* ****** ****** *)
//
extern
fun
{a:t@ype} print_addr(a): void 
implement
{a}
print_addr(a) =
  $extfcall (void, "printf", "%p\n", $UN.cast{ptr}(a))
//
(* ****** ****** *)

implement
main0 () =
{
  val a = (lam (x:int) =<cloref1> parser_encode (lam (input, cont) => cont (x, input)))
  val b = memo1<int,int>(a)
  val _ = print_addr(a(1))
  val _ = print_addr(a(1))
  val _ = print_addr(b(1))
  val _ = print_addr(b(1))
}

(* ****** ****** *)

(* end of [test38.dats] *)
