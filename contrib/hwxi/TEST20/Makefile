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
test20
test20: \
test20.dats; $(PATSCC) -o $@ $<
regress:: test20; ./test20
cleanall:: ; $(RMF) test20

## ###### ###### ##

all:: \
test21
test21: \
test21.dats; $(PATSCC) -o $@ $<
regress:: test21; ./test21
cleanall:: ; $(RMF) test21

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
