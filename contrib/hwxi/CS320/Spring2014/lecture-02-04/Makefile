#
# A simple Makefile
#
include $(PATSHOME)/share/atsmake-pre.mk
#
all:: \
datatype
datatype: \
datatype.dats ; $(PATSCC2) $(MALLOCFLAG) -o $@ $<
#
regress:: datatype; ./$<
cleanall:: ; $(RMF) datatype
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
