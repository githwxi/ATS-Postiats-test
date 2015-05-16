#
# A simple Makefile
#

######

.PHONY: all

######

PATSCC=$(PATSHOME)/bin/patscc

######

all:: \
findroot
findroot: \
findroot.dats ; $(PATSCC) -o $@ $<
regress:: findroot; ./$<
cleanall:: ; $(RMF) findroot

######

all:: \
stringlen
stringlen: \
stringlen.dats ; $(PATSCC) -o $@ $<
regress:: stringlen; ./$<
cleanall:: ; $(RMF) stringlen

######

all:: \
stringsort
stringsort: \
stringsort.dats ; $(PATSCC) -DATS_MEMALLOC_LIBC -o $@ $<
regress:: stringsort; ./$<
cleanall:: ; $(RMF) stringsort

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

cleanall:: clean

###### end of [Makefile] ######
