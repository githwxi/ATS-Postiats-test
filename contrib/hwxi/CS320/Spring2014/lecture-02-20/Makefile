#
# A simple Makefile
#
include $(PATSHOME)/share/atsmake-pre.mk
#
all:: higher-order
higher-order: higher-order.dats ; $(PATSCC2) $(MALLOCFLAG) -o $@ $^
regress:: higher-order; ./$<
cleanall:: ; $(RMF) higher-order
#
all:: list_foldleft
list_foldleft: list_foldleft.dats ; $(PATSCC2) $(MALLOCFLAG) -o $@ $^
regress:: list_foldleft; ./$<
cleanall:: ; $(RMF) list_foldleft
#
include $(PATSHOME)/share/atsmake-post.mk
#
testall:: all
testall:: regress
testall:: cleanall
#
cleanall:: ; $(RMF) *_?ats.c
#
###### end of [Makefile] ######
