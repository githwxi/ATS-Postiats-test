#
# A simple Makefile
#

######

.PHONY: all

######

PATSCC=$(PATSHOME)/bin/patscc

######

all:: tailrec
tailrec: \
tailrec.dats ; $(PATSCC) -tcats tailrec.dats

######

all:: intlst_last
intlst_last: \
intlst_last.dats ; $(PATSCC) -DATS_MEMALLOC_LIBC -o $@ $<
regress:: intlst_last; ./$<
cleanall:: ; $(RMF) intlst_last

######

testall:: all
testall:: regress
testall:: cleanall

######

RMF=rm -f

######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *.o
clean:: ; $(RMF) *.c

######

cleanall:: clean

###### end of [Makefile] ######
