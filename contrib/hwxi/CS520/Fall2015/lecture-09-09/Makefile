#
# A simple Makefile
#

######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt

######

all:: fib
regress:: fib; ./fib
cleanall:: ; rm -f fib

all:: fib2
regress:: fib2; ./fib2
cleanall:: ; rm -f fib2

all:: fib3
regress:: fib3; ./fib3
cleanall:: ; rm -f fib3

######

testall:: all
testall:: regress
testall:: cleanall

######
#
%: %.dats; $(PATSCC) -o $@ $<
#
# for instance:
# fib: fib.dats; $(PATSCC) -o $@ $<
# fib2: fib2.dats; $(PATSCC) -o $@ $<
#
######

fib3: fib3.dats myfib.c; $(PATSCC) -o $@ $^

######

clean:: ; rm -f *~
clean:: ; rm -f myfib.o
clean:: ; rm -f *_dats.o
clean:: ; rm -f *_dats.c

cleanall:: clean

###### end of [Makefile] ######
