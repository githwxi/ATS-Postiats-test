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
regress:: test00; ./test00
cleanall:: ; $(RMF) test00

## ###### ###### ##

ifeq ($(OS),linux)
all:: \
test01
test01: \
test01.dats; \
$(PATSCC) -D_GNU_SOURCE -o $@ $< -lrt
regress:: test01; ./test01
cleanall:: ; $(RMF) test01
endif # if(OS=linux)

ifeq ($(OS),osx)
all:: \
test01-osx
test01-osx: \
test01-osx.dats; $(PATSCC) -D_GNU_SOURCE -o $@ $<
regress:: test01-osx; ./test01-osx
cleanall:: ; $(RMF) test01-osx
endif # if(OS=osx)

## ###### ###### ##

all:: \
test02
test02: \
test02.dats; \
$(PATSCC) -DATS_MEMALLOC_LIBC -o $@ $<
regress:: test02; ./test02
cleanall:: ; $(RMF) test02

## ###### ###### ##

all:: \
test03
test03: \
test03.dats; $(PATSCC) -o $@ $<
regress:: test03; ./test03
cleanall:: ; $(RMF) test03

## ###### ###### ##

all:: \
test04
test04: \
test04.dats; $(PATSCC) -o $@ $<
regress:: test04; ./test04
cleanall:: ; $(RMF) test04

## ###### ###### ##

ifeq ($(OS),osx)
all:: \
OSSpinLock-osx
OSSpinLock-osx: \
OSSpinLock-osx.dats; $(PATSCC) -D_GNU_SOURCE -o $@ $<
regress:: \
OSSpinLock-osx; ./OSSpinLock-osx
cleanall:: ; $(RMF) OSSpinLock-osx
endif # if(OS=osx)

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
