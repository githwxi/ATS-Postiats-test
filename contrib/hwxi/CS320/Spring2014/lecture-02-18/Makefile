#
# A simple Makefile
#
include $(PATSHOME)/share/atsmake-pre.mk
#
all:: list0
list0: list0.dats ; $(PATSCC2) $(MALLOCFLAG) -o $@ $<
regress:: list0; ./$<
cleanall:: ; $(RMF) list0
#
all:: array0
array0: array0.dats ; $(PATSCC2) $(MALLOCFLAG) -o $@ $<
regress:: array0; ./$<
cleanall:: ; $(RMF) array0
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
