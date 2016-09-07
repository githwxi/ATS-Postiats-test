#
# A simple Makefile
#
PATSCC=$(PATSHOME)/bin/patscc
#
all:: \
queens
queens: \
queens_dats.c; \
  $(PATSCC) -O2 \
    -D_GNU_SOURCE \
    -DATS_MEMALLOC_LIBC -o $@ $<
#
queens_dats.c: \
  queens.dats; $(PATSCC) -ccats $<
#
regress:: queens; ./queens
#
all:: \
mysleep
mysleep: \
mysleep_dats.c; \
  $(PATSCC) -O2 \
    -D_GNU_SOURCE \
    -DATS_MEMALLOC_LIBC -o $@ $<
#
mysleep_dats.c: \
  mysleep.dats; $(PATSCC) -ccats $<
#
all:: \
quicksort
quicksort: \
quicksort_dats.c; \
  $(PATSCC) -O2 \
    -D_GNU_SOURCE \
    -DATS_MEMALLOC_LIBC -o $@ $<
#
quicksort_dats.c: \
  quicksort.dats; $(PATSCC) -ccats $<
#
regress:: quicksort; ./quicksort
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
cleanall:: ; $(RMF) queens
cleanall:: ; $(RMF) mysleep
cleanall:: ; $(RMF) quicksort
#
###### end of [Makefile] ######
