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
test_prelude
test_prelude: \
test_prelude.dats; \
$(PATSCC) -DATS_MEMALLOC_LIBC -O2 -o $@ $<
regress:: test_prelude; ./test_prelude
cleanall:: ; $(RMF) test_prelude

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
