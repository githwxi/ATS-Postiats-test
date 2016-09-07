#
# A simple Makefile
#
PATSCC=$(PATSHOME)/bin/patscc
#
all:: \
mystream_test
mystream_test: \
mystream_test_dats.c; \
  $(PATSCC) -O2 \
    -D_GNU_SOURCE \
    -DATS_MEMALLOC_LIBC -o $@ $<
#
mystream_test_dats.c: \
  mystream_test.dats; $(PATSCC) -ccats $<
#
regress:: mystream_test; ./mystream_test
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
cleanall:: ; $(RMF) mystream_test
#
###### end of [Makefile] ######
