#
# A simple Makefile
#
include $(PATSHOME)/share/atsmake-pre.mk
#
all:: \
quicksort.dats ; $(PATSCC) -tcats $<
#
include $(PATSHOME)/share/atsmake-post.mk
#
testall:: all
#
cleanall:: ; $(RMF) *_?ats.c
#
###### end of [Makefile] ######
