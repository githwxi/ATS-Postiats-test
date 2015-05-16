#
# A simple Makefile
#

######

.PHONY: all

######

PATSCC=$(PATSHOME)/bin/patscc

######

all:: \
CPS_fact_fib
CPS_fact_fib: \
CPS_fact_fib.dats ; \
$(PATSCC) -DATS_MEMALLOC_LIBC -o $@ $<
regress:: CPS_fact_fib; ./$<
cleanall:: ; $(RMF) CPS_fact_fib

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
