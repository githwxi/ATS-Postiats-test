(* ****** ****** *)
//
// Title:
// Principles of
// Programming Languages
// Course: CAS CS 520
//
// Semester: Spring, 2018
//
// Classroom: MCS B25
// Class Time: TR 2:00-3:15
//
// Instructor: Hongwei Xi (hwxiATcsDOTbuDOTedu)
//
(* ****** ****** *)
//
// Due date: Tuesday, the 13th of March
//
(* ****** ****** *)

(*
//
// HX: 50 points
//
Please do this one for ATS:
http://rosettacode.org/wiki/Simple_database
//
For instance, please take a look at the Java implementation.
//
*)

(* ****** ****** *)
// #include "share/atspre_define.hats"
#include "share/atspre_staload.hats"
#include "share/atspre_staload_libats_ML.hats"
#include "libats/libc/DATS/time.dats"
staload UN = "prelude/SATS/unsafe.sats"

(*define item record*)

typedef
item = @{name = string, date = string, category = string}

(*end of def of item record*)

(*following is the print functions for item record*)
(*reference from datatype term*)

extern
fun
print_item(t0: item): void // stdout
and
prerr_item(t0: item): void // stderr

extern
fun
fprint_item(out: FILEref, t0: item): void

overload print with print_item
overload prerr with prerr_item
overload fprint with fprint_item

implement
print_item(t0) =
fprint_item(stdout_ref, t0)
implement
prerr_item(t0) =
fprint_item(stderr_ref, t0)

implement
fprint_item(out, t0) =
(
  // fprint!(out, "name: ", t0.name, ", date: ", t0.date, ", cat: ", t0.category)
  fprint!(out, t0.name, ",", t0.date, ",", t0.category)
)

(*end of item print functions*)

(*load external file to record list*)

//def of item list
datatype itemlst =
  | itemlst_nil of () | itemlst_cons of (item, itemlst)

#define nil itemlst_nil
#define :: itemlst_cons

//print a itemlst to some out channel
fun fprint_itemlst(out: FILEref, t0: itemlst): void = 
(
case+ t0 of
| itemlst_nil () => ()//print('\n')
| itemlst_cons (t1, t2) =>
  {
    val () = let 
                val () = fprint_item(out, t1)
                val () = fprint!(out, '\n')
              in
                ()
              end
    val () = fprint_itemlst(out, t2);
  }
)

//print itemlst to stdout
fun print_itemlst(t0: itemlst): void = 
(
  fprint_itemlst(stdout_ref, t0)
)

//get latest entry
fun latest(myitemlst: itemlst): item = 
(
let
  fun loop(myitemlst_inner: itemlst, latestitem: item): item = 
  (
  case+ myitemlst_inner of
  | itemlst_nil () => latestitem
  | itemlst_cons (t1, t2) => if t1.date > latestitem.date then
                                loop(t2, t1)
                              else
                                loop(t2, latestitem)
  )
  val empty = @{name="this is an empty entry for display", date="0",category= "only"}: item
in
  loop(myitemlst, empty)
end
)

fun latest_by_cat(myitemlst: itemlst, cat: string): item = 
(
let
  fun loop(myitemlst_inner: itemlst, latestitem: item): item = 
  (
  case+ myitemlst_inner of
  | itemlst_nil () => latestitem
  | itemlst_cons (t1, t2) => if t1.date > latestitem.date andalso t1.category = cat then
                                loop(t2, t1)
                              else
                                loop(t2, latestitem)
  )
  val empty = @{name="this is an empty entry for display", date="0",category= "only"}: item
in
  loop(myitemlst, empty)
end
)

//save a itemlst to csv file, override the original file
fun store(myitemlst: itemlst, filepath: string): void = 
(
let
  val out = fileref_open_exn(filepath, file_mode_w)
in
  begin
    fprint_itemlst(out, myitemlst);
    fileref_close(out)
  end
end
)

//split a string given a delimiter
//hard coded ',' as delimiter
fun split_string(input_str: string): list0(string) = 
(
let
  val cs = string_explode(input_str)
  fun split_string_loop(cs: list0(char), res: list0(string), cur: string): list0(string) = 
  (
  case+ cs of
  | list0_nil() => list0_extend<string>(res, cur)
  | list0_cons(t0, t1) => if (',' = t0) then
                            split_string_loop(t1, list0_extend<string>(res, cur), "")
                          else
                            let

                            in
                              split_string_loop(t1, res, string_append(cur, string_implode(list0_sing(t0))) )
                            end
  )
in
  split_string_loop(cs, list0_nil(), "")
end
)

//load a string to an item
fun load_single(input_str: string): item = 
(
let
  val fields = split_string(input_str)
in
  //how to make it safe?
  @{name=fields[0], date=fields[1],category= fields[2]}
end
)

//load itemlst from FILEref
fun load_from_fileref(inp: FILEref): itemlst = 
(
let
  //val c = fileref_getc (inp)
  val empty_itemlst = itemlst_nil()
  val str_lst = fileref_get_lines_stringlst(inp)
  fun loop(lines: list0(string), res: itemlst): itemlst = 
  (
  case+ lines of
  | list0_nil() => res
  | list0_cons(t0, t1) => 
  let
    //val () = println! (t0)
  in
    if t0 = "" then 
      res 
    else
      loop(t1, load_single(t0) :: res)
  end
  )
in
  loop(str_lst, empty_itemlst)
end
)


//load csv file to an itemlst
fun load(filepath: string): itemlst = 
(
let
  val inp = fileref_open_exn (filepath, file_mode_r)
in
  load_from_fileref(inp)
  //how to close?
end
)

#define mydatabase "mydb.csv"
(*end of itemlst related functions*)

(*time fun*)
fun int2string(input: int): string = 
(
let
  fun i2smap(i: int): string = 
  (
    if i = 0 then "0"
    else if i = 1 then "1"
    else if i = 2 then "2"
    else if i = 3 then "3"
    else if i = 4 then "4"
    else if i = 5 then "5"
    else if i = 6 then "6"
    else if i = 7 then "7"
    else if i = 8 then "8"
    else if i = 9 then "9"
    else ""
  )

  fun loop(left: int, res: string): string = 
  (
    let
      //val () = println!(res)
    in
      if left = 0 then i2smap(0)
      else if left < 10 then string_append(i2smap(left), res)
      else loop(left/10, string_append(i2smap(left%10), res))
    end
  )
in
  loop(input, "")
end
)
(*end of time fun*)


(*following is user action function*)

fun print_usage(): void = 
(
let
  val () = println!("all - to print all entries")
  val () = println!("latest - to print the latest entry")
  val () = println!("add name cat - to add one entry")
in
end
)

fun print_all(): void = 
(
let
  var data = load(mydatabase)
in
  print_itemlst(data)
end
)

fun add_item(name: string, cat: string): void =
(
let

  var data = load(mydatabase)
  //var now_i = $UN.cast{int}(time())
  //why $UN.cast{string}(time()) caused a segment fault?
  val new_item = @{name=name, date= (*$UN.cast{string}(time())*)int2string($UN.cast{int}(time())),category=cat}: item
  val data = new_item :: data
in
  store(data, mydatabase)
end  
)

fun print_latest(): void = 
(
let
  var data = load(mydatabase)
  var latest_item = latest(data)
in
  println! ("latest item is ", latest_item)
end
)

fun print_latest_by_cat(cat: string): void = 
(
let
  var data = load(mydatabase)
  var latest_item = latest_by_cat(data, cat)
in
  println! ("latest item in ", cat ," is ", latest_item)
end
)

(*end of user action function*)

implement
main0 (argc, argv) = 
{
  val () = if argc < 2 then
              print_usage()
            else if argv[1] = "all" then
              print_all()
            else if (argc = 2) * (argv[1] = "latest") then
              print_latest()
            else if (argc = 3) * (argv[1] = "latest") then
              print_latest_by_cat(argv[2])
            else if (argc >= 3) * (argv[1] = "add") then
              if argc = 3 then 
                add_item(argv[2], "none")
              else if argc = 4 then
                add_item(argv[2], argv[3])
              else
                print_usage()
            else
              print_usage()
}

(* end of [Simple_database.dats] *)

