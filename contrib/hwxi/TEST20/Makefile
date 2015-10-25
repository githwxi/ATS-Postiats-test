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

all:: \
test22
test22: \
test22.dats; $(PATSCC) -o $@ $<
regress:: test22; ./test22
cleanall:: ; $(RMF) test22

## ###### ###### ##

all:: \
test23
test23: \
test23.dats; $(PATSCC) -tcats $<

## ###### ###### ##

all:: \
test24
test24: \
test24.dats; \
$(PATSCC) -DATS_MEMALLOC_LIBC -o $@ $<
regress:: test22; ./test24
cleanall:: ; $(RMF) test24

## ###### ###### ##

all:: \
test25
test25: \
test25.dats; $(PATSCC) -o $@ $<
regress:: test25; ./test25
cleanall:: ; $(RMF) test25

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
