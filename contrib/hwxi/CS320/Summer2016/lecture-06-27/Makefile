#
# A simple Makefile
#
PATSCC=$(PATSHOME)/bin/patscc
#
all:: \
mylist_test
mylist_test: \
mylist_test_dats.c; \
  $(PATSCC) -O2 \
    -D_GNU_SOURCE \
    -DATS_MEMALLOC_LIBC -o $@ $< -latslib
#
mylist_test_dats.c: \
  mylist_test.dats; $(PATSCC) -ccats $<
#
regress:: mylist_test; ./mylist_test
#
all:: \
mylist_test2
mylist_test2: \
mylist_test2_dats.c; \
  $(PATSCC) -O2 \
    -D_GNU_SOURCE \
    -DATS_MEMALLOC_LIBC -o $@ $< -latslib
#
mylist_test2_dats.c: \
  mylist_test2.dats; $(PATSCC) -ccats $<
#
regress:: mylist_test2; ./mylist_test2
#
testall:: all
testall:: regress
testall:: cleanall
#
RMF= rm -f
#
clean:: ; $(RMF) *~
clean:: ; $(RMF) *_?ats.c
#
cleanall:: clean
cleanall:: ; $(RMF) mylist_test
cleanall:: ; $(RMF) mylist_test2
#
###### end of [Makefile] ######
