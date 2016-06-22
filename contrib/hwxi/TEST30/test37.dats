(*
//
HX-2016-06-18:
https://groups.google.com/forum/#!topic/ats-lang-users/w0m8v8wgAJE
//
*)

(* ****** ****** *)

#define chss_init       0
#define chss_thread     1
#define chss_irqsusp    2
#define chss_irqdisable 3
#define chss_irqwait    4
#define chss_isr        5
#define chss_slock      6
#define chss_ilock      7

(* ****** ****** *)
//
absvtype
chss(s:int)
//
vtypedef
chss_any = [s:int] chss(s)
//
vtypedef
chss_iclass =
[s:int |
 s==chss_slock || s==chss_ilock] chss(s)
//
(* ****** ****** *)
//
(*
dataprop
chss_p(int) = {s:int | s <= 7} CHSS(s) of ()
*)
//
stacst chss_p: int -> bool
//
extern
praxi
lemma_chss_p
  {s:int | s <= 7}(): [chss_p(s)] void
//
(* ****** ****** *)
//
abst@ype event_source_t
//
extern
fun
chEvtObjectInit
  {s:int | chss_p(s)}
  (!chss(s) | cPtr0(event_source_t)): void = "mac#"
//
(* ****** ****** *)

(* end of [test37.dats] *)
