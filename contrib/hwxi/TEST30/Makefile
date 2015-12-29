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
test30
test30: \
test30.dats; $(PATSCC) -o $@ $<
regress:: test30; ./test30
cleanall:: ; $(RMF) test30

## ###### ###### ##

all:: \
test31
test31: \
test31.dats; $(PATSCC) -o $@ $<
regress:: test31; ./test31
cleanall:: ; $(RMF) test31

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
