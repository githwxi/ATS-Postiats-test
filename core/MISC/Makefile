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

all:: \
test01
test01: \
test01.dats; $(PATSCC) -o $@ $<
regress:: test01; ./test01
cleanall:: ; $(RMF) test01

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
test03.dats; \
$(PATSCC) -DATS_MEMALLOC_LIBC -o $@ $<
regress:: test03; ./test03
cleanall:: ; $(RMF) test03

## ###### ###### ##

all:: \
test04
test04: \
test04.dats; \
$(PATSCC) -DATS_MEMALLOC_LIBC -o $@ $<
regress:: test04; ./test04
cleanall:: ; $(RMF) test04

## ###### ###### ##

all:: \
test05
test05: \
test05.dats; \
$(PATSCC) -D_GNU_SOURCE -DATS_MEMALLOC_LIBC -o $@ $<
regress:: test05; ./test05
cleanall:: ; $(RMF) test05

## ###### ###### ##

all:: \
test06
test06: \
test06.dats; \
$(PATSCC) -D_GNU_SOURCE -DATS_MEMALLOC_LIBC -o $@ $<
regress:: test06; ./test06
cleanall:: ; $(RMF) test06

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
