##
## A Makefile for simple testing
##

## ###### ###### ##

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt

## ###### ###### ##

RMF=rm -f

## ###### ###### ##

all::
regress::
cleanall::

## ###### ###### ##

all:: \
test10
test10: \
test10.dats; $(PATSCC) -o $@ $<
regress:: test10; ./test10
cleanall:: ; $(RMF) test10

## ###### ###### ##

all:: \
test11
test11: \
test11.dats; $(PATSCC) -o $@ $<
regress:: test11; ./test11
cleanall:: ; $(RMF) test11

## ###### ###### ##

all:: \
test12
test12: \
test12.dats; $(PATSCC) -o $@ $<
regress:: test12; ./test12
cleanall:: ; $(RMF) test12

## ###### ###### ##

all:: \
bternary
bternary: \
bternary.dats; \
$(PATSCC) -DATS_MEMALLOC_LIBC -o $@ $<
regress:: bternary; ./$<
cleanall:: ; $(RMF) bternary

## ###### ###### ##

testall:: all
testall:: regress
testall:: cleanall

## ###### ###### ##

clean:: ; $(RMF) *~
clean:: ; $(RMF) *_?ats.c

## ###### ###### ##

cleanall:: clean

## ###### ###### ##

## ###### end of [Makefile] ###### ##
