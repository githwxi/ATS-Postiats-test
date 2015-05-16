#
# A simple Makefile
#

######

.PHONY: all

######

PATSCC=$(PATSHOME)/bin/patscc

######

all:: \
mergesort
mergesort: \
mergesort.dats ; $(PATSCC) -DATS_MEMALLOC_LIBC -o $@ $<
regress:: \
mergesort; \
./$< 3 1 2 0 5 4 9 6 7 8
cleanall:: ; $(RMF) mergesort

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
