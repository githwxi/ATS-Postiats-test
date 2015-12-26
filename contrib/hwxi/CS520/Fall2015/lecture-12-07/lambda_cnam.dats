(* ****** ****** *)
//
// Implement <cnam>
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
print_cnam(x) = fprint(stdout_ref, x)
implement
prerr_cnam(x) = fprint(stderr_ref, x)

(* ****** ****** *)

implement
eq_cnam_cnam(x, y) = compare(x, y) = 0

(* ****** ****** *)

local

assume
cnam_type = string

in (* in-of-local *)

implement
cnam_string(x) = x

implement
cnam2string(x) = x

implement
fprint_cnam (out, x) = fprint_string (out, x)

implement
compare_cnam_cnam(x, y) = compare_string_string(x, y)

end // end of [local]

(* ****** ****** *)

(* end of [lambda_cnam.dats] *)
