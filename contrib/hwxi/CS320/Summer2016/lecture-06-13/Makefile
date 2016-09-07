#
# A simple Makefile
#
PATSCC=$(PATSHOME)/bin/patscc
#
all:: \
mergesort
mergesort: \
mergesort_dats.c; \
  $(PATSCC) -O2 \
    -D_GNU_SOURCE \
    -DATS_MEMALLOC_LIBC -o $@ $<
#
mergesort_dats.c: \
  mergesort.dats; $(PATSCC) -ccats $<
#
regress:: mergesort; ./mergesort
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
cleanall:: ; $(RMF) mergesort
#
###### end of [Makefile] ######
