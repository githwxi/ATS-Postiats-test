#
# A simple Makefile
#
include $(PATSHOME)/share/atsmake-pre.mk
#
include $(PATSHOME)/share/atsmake-post.mk
#
all:: \
mysystem
#
mysystem: \
mysystem_dats.c; \
  $(PATSCC2) -O2 \
  -DATS_MEMALLOC_GCBDW -o $@ $< -lgc
#
mysystem_dats.c: \
  mysystem.dats; $(PATSCC2) -ccats $<
#
regress:: mysystem; ./mysystem "ls ."
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
testall:: all
testall:: regress
testall:: cleanall
#
cleanats:: ; $(RMF) *~
cleanats:: ; $(RMF) *_?ats.c
#
cleanall:: cleanats
cleanall:: ; $(RMF) mysystem
cleanall:: ; $(RMF) mylist_test
#
###### end of [Makefile] ######
