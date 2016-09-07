#
# A simple Makefile
#
PATSCC=$(PATSHOME)/bin/patscc
#
all:: \
matmult
#
matmult: \
matmult_dats.c; \
  $(PATSCC) -O2 -DATS_MEMALLOC_LIBC -o $@ $<
#
matmult_dats.c: \
  matmult.dats; $(PATSCC) -ccats $<
#
regress:: matmult; ./matmult
#
all:: \
mlist_exn
#
mlist_exn: \
mlist_exn_dats.c; \
  $(PATSCC) -O2 -D_GNU_SOURCE -DATS_MEMALLOC_LIBC -o $@ $<
#
mlist_exn_dats.c: \
  mlist_exn.dats; $(PATSCC) -ccats $<
#
regress:: mlist_exn; ./mlist_exn
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
cleanall:: ; $(RMF) matmult
cleanall:: ; $(RMF) mlist_exn
#
###### end of [Makefile] ######
