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
P2-bbarker-nopf
P2-bbarker-nopf: \
P2-bbarker-nopf.dats; $(PATSCC) -o $@ $<
regress:: P2-bbarker-nopf; ./P2-bbarker-nopf
cleanall:: ; $(RMF) P2-bbarker-nopf

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
