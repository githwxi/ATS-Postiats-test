#
# A simple Makefile
#

######

.PHONY: all

######

PATSCC=$(PATSHOME)/bin/patscc

######

all:: fib
fib: fib.dats ; $(PATSCC) -DATS_MEMALLOC_LIBC -o $@ $<
regress:: fib; ./$<
cleanall:: ; $(RMF) fib

######

all:: sieve
sieve: sieve.dats ; $(PATSCC) -DATS_MEMALLOC_LIBC -o $@ $<
regress:: sieve; ./$<
cleanall:: ; $(RMF) sieve

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
