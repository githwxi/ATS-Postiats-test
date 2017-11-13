######
#
# A Simple Makefile
#
######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt

######

all:: fib
all:: coin_change

######

regress:: fib; ./fib
regress:: coin_change; ./coin_change

######

fib: \
fib.dats; $(PATSCC) -DATS_MEMALLOC_LIBC -o $@ $<
coin_change: \
coin_change.dats; $(PATSCC) -DATS_MEMALLOC_LIBC -o $@ $<

######

testall:: all
testall:: regress
testall:: cleanall

######

clean:: ; rm -f *~
clean:: ; rm -f *_?ats.o
clean:: ; rm -f *_?ats.c

cleanall:: clean
cleanall:: ; rm -f fib
cleanall:: ; rm -f coin_change

###### end of [Makefile] ######
