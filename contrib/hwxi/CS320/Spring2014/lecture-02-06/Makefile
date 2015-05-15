#
# A simple Makefile
#
include $(PATSHOME)/share/atsmake-pre.mk
#
all:: intlist
intlist: intlist.dats ; $(PATSCC2) $(MALLOCFLAG) -o $@ $^
#
regress:: intlist; ./$<
cleanall:: ; $(RMF) intlist
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
