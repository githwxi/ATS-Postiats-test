#
# A simple Makefile
#

######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt

######

all:: fib
fib: fib.dats; \
$(PATSCC) -DATS_MEMALLOC_LIBC -o $@ $<
regress:: fib; ./$<
cleanall:: ; rm -f fib

######

all:: ref
ref: ref.dats; \
$(PATSCC) -DATS_MEMALLOC_LIBC -o $@ $<
regress:: ref; ./$<
cleanall:: ; rm -f ref

######

testall:: all
testall:: regress
testall:: cleanall

######

clean:: ; rm -f *~
clean:: ; rm -f *_dats.c

######

cleanall:: clean

###### end of [Makefile] ######
