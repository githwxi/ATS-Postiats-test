#
# A simple Makefile
#
include $(PATSHOME)/share/atsmake-pre.mk
#
all:: \
inflist.dats ; $(PATSCC) -tcats $<
all:: \
breadth-first.dats ; $(PATSCC) -tcats $<
all:: \
graph-search.dats ; $(PATSCC) -tcats $<
#
include $(PATSHOME)/share/atsmake-post.mk
#
testall:: all
testall:: cleanall
#
cleanall:: ; $(RMF) *_?ats.c
#
###### end of [Makefile] ######
