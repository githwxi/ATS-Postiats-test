#
# A simple Makefile
#
PATSCC=$(PATSHOME)/bin/patscc
#
all:: \
myarray_test
myarray_test: \
myarray_test_dats.c; \
  $(PATSCC) -O2 \
    -D_GNU_SOURCE \
    -DATS_MEMALLOC_LIBC -o $@ $<
#
myarray_test_dats.c: \
  myarray_test.dats; $(PATSCC) -ccats $<
#
regress:: myarray_test; ./myarray_test
#
all:: \
myqueue_test
myqueue_test: \
myqueue_test_dats.c; \
  $(PATSCC) -O2 \
    -D_GNU_SOURCE \
    -DATS_MEMALLOC_LIBC -o $@ $<
#
myqueue_test_dats.c: \
  myqueue_test.dats; $(PATSCC) -ccats $<
#
regress:: myqueue_test; ./myqueue_test
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
cleanall:: ; $(RMF) myarray_test
cleanall:: ; $(RMF) myqueue_test
#
###### end of [Makefile] ######
