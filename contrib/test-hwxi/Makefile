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
test00
test00: \
test00.dats; $(PATSCC) -o $@ $<
regress:: ; ./test00
cleanall:: ; $(RMF) test00

## ###### ###### ##

ifeq ($(OS),linux)
all:: \
test01
test01: \
test01.dats; \
$(PATSCC) -D_GNU_SOURCE -o $@ $< -lrt
regress:: ; ./test01
cleanall:: ; $(RMF) test01
endif # if(OS=linux)

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
