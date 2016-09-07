#
# A simple Makefile
#
PATSCC=$(PATSHOME)/bin/patscc
#
all:: \
myfile_test
myfile_test: \
myfile_test_dats.c; \
  $(PATSCC) -O2 \
    -D_GNU_SOURCE \
    -DATS_MEMALLOC_LIBC -o $@ $< -latslib
#
myfile_test_dats.c: \
  myfile_test.dats; $(PATSCC) -ccats $<
#
regress:: myfile_test; ./myfile_test
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
cleanall:: ; $(RMF) myfile_test
#
###### end of [Makefile] ######
