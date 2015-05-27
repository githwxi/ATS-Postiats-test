#
# A simple Makefile
#
include $(PATSHOME)/share/atsmake-pre.mk
#
include $(PATSHOME)/share/atsmake-post.mk
#
all:: \
fact
fact: \
fact.dats ; $(PATSCC2) -o $@ $<
regress:: fact; ./$<
cleanall:: ; $(RMF) fact
#
all:: \
evenodd
evenodd: \
evenodd.dats ; $(PATSCC2) -o $@ $<
regress:: evenodd; ./$<
cleanall:: ; $(RMF) evenodd
#
all:: \
mydraw
mydraw: \
mydraw.dats ; \
$(PATSCC2) -DATS_MEMALLOC_LIBC -o $@ $<
regress:: mydraw; ./$<
cleanall:: ; $(RMF) mydraw
#
testall:: all
testall:: regress
testall:: cleanall
#
cleanats:: ; $(RMF) *~
cleanats:: ; $(RMF) *_?ats.c
#
cleanall:: cleanats
#
###### end of [Makefile] ######
