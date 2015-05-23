(* I/O *)

#include "share/atspre_staload.hats"

(* Open a file *)
val out =
  fileref_open_exn("hello.txt",file_mode_w)

(* Do some actions with the file *)
val _ =
  begin fprint_string (out,"Hello,world!\n");
        fileref_close (out);
  end

(* A simple get line / output line loop. *)
fun loop ():  void =
if
fileref_is_eof(stdin_ref)
then ()
else let
  val line = fileref_get_line_string (stdin_ref)
  val line = strptr2string(line)
  val ((*void*)) = (fileref_puts(stdout_ref,line);fileref_puts(stdout_ref,"\n"))
in
  loop ()  
end

val _ = loop ()

implement main0 () = ()

(* ****** ****** *)

%{
extern
atstype_ptr
atspre_fileref_get_line_string_main2
(
  atstype_int bsz0
, atstype_ptr filp0
, atstype_ref nlen // int *nlen
)
{
//
  int bsz = bsz0 ;
  FILE *filp = (FILE*)filp0 ;
  int ofs = 0, ofs2 ;
  char *buf, *buf2, *pres ;
  buf = atspre_malloc_gc(bsz) ;
//
  while (1) {
    buf2 = buf+ofs ;
    pres = fgets(buf2, bsz-ofs, filp) ;
    if (!pres)
    {
      if (feof(filp))
      {
        *buf2 = '\000' ;
        *(int*)nlen = ofs ; return buf ;
      } else {
        atspre_mfree_gc(buf) ;
        *(int*)nlen = -1 ; return (char*)0 ;
      } // end of [if]
    }
    ofs2 = strlen(buf2) ;
    if (ofs2==0) return buf ;
    ofs += ofs2 ; // HX: ofs > 0
//
// HX: the newline symbol needs to be trimmed:
//
    if (buf[ofs-1]=='\n')
    {
      buf[ofs-1] = '\0'; *(int*)nlen = ofs-1 ; return buf ;
    }
//
// HX: there is room // so there are no more chars:
//
    if (ofs+1 < bsz) { *(int*)nlen = ofs ; return buf ; }
//
// HX: there is no room // so another call to [fgets] is needed:
//
    bsz *= 2 ;
    buf2 = buf ; buf = atspre_malloc_gc(bsz) ; memcpy(buf, buf2, ofs) ;
    atspre_mfree_gc(buf2) ;
  } // end of [while]
//
  return buf ; // HX: deadcode
//
} // end of [atspre_fileref_get_line_string_main2]
%}
