(* ****** ****** *)
//
// HX-2015-09-27
// For answering the question:
// https://groups.google.com/forum/#!topic/ats-lang-users/dYgT3JF356s
//
(* ****** ****** *)
//
staload
UN =
"prelude/SATS/unsafe.sats"
//
(* ****** ****** *)

%{^

unsigned char
crcLookupTable_read
  (char *T, int index)
{
  return pgm_read_byte(&T[i]) ;
}

%} // end of [%{^]

(* ****** ****** *)
//
abstype
crcLookupTable = ptr
//
extern
val
theCrcLookupTable: crcLookupTable = "mac#"
//
extern
fun
crcLookupTable_read
  (crcLookupTable, natLt(256)): uint8 = "mac#"
overload [] with crcLookupTable_read
extern
fun
crcLookupTable_read_uint8
  (crcLookupTable, index: uint8): uint8 = "mac#"
overload [] with crcLookupTable_read_uint8
//
implement
crcLookupTable_read_uint8
  (T, i) =
  let val i = $UN.cast{natLt(256)}(i) in T[i] end
//
(* ****** ****** *)

extern
fun
pec_add (old: uint8, new: uint8): uint8

implement
pec_add(old, new) = theCrcLookupTable[old] lxor theCrcLookupTable[new]

(* ****** ****** *)

(* end of [test19.dats] *)
