
extern
fun
add_int_int : (int, int) -> int
extern
fun
add2_int_int : (int, int) -> int
extern
fun
add_string_string : (string, string) -> string

infix ++
overload ++ with add_int_int of 0
overload ++ with add2_int_int of 10
overload ++ with add_string_string of 0

val sum = 1 ++ 2
val sum = "1" ++ "2"
