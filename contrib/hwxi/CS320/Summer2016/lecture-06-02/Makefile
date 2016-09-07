#
# A simple Makefile
#
include $(PATSHOME)/share/atsmake-pre.mk
#
include $(PATSHOME)/share/atsmake-post.mk
#
all:: \
mylist_test
#
mylist_test: \
mylist_test_dats.c; \
  $(PATSCC2) -O2 \
  -DATS_MEMALLOC_LIBC -o $@ $< -lgc
#
mylist_test_dats.c: \
  mylist_test.dats; $(PATSCC2) -ccats $<
#
regress:: mylist_test; ./mylist_test
#
all:: \
mylist_subseq
#
mylist_subseq: \
mylist_subseq_dats.c; \
  $(PATSCC2) -O2 \
  -DATS_MEMALLOC_LIBC -o $@ $< -lgc
#
mylist_subseq_dats.c: \
  mylist_subseq.dats; $(PATSCC2) -ccats $<
#
regress:: mylist_subseq; ./mylist_subseq
#
testall:: all
testall:: regress
testall:: cleanall
#
cleanats:: ; $(RMF) *~
cleanats:: ; $(RMF) *_?ats.c
#
cleanall:: cleanats
cleanall:: ; $(RMF) mylist_test
cleanall:: ; $(RMF) mylist_subseq
#
###### end of [Makefile] ######
