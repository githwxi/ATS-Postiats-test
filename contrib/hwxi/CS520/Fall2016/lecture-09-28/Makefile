#
# For lecture-09-14
#

######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt

######
#
all:: \
permute
permute :: \
permute.dats; \
$(PATSCC) -DATS_MEMALLOC_LIBC -o $@ $<
#
regress:: permute; ./$<
cleanall:: ; $(RMF) permute
#
######
#
all:: \
permute_vt
permute_vt :: \
permute_vt.dats; \
$(PATSCC) -DATS_MEMALLOC_LIBC -o $@ $<
#
regress:: permute_vt; ./$<
cleanall:: ; $(RMF) permute_vt
#
######

RMF=rm -f

######

testall:: all
testall:: regress
testall:: cleanall

######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *_?ats.c

cleanall:: clean

###### end of [Makefile] ######
