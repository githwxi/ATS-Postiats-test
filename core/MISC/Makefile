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
test01.dats; \
$(PATSCC) -DATS_MEMALLOC_LIBC -o $@ $<
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

all:: \
test07
test07: \
test07.dats; \
$(PATSCC) -D_GNU_SOURCE -DATS_MEMALLOC_LIBC -o $@ $<
regress:: test07; ./test07
cleanall:: ; $(RMF) test07

## ###### ###### ##

all:: \
test08
test08: \
test08.dats; \
$(PATSCC) -D_GNU_SOURCE -DATS_MEMALLOC_LIBC -o $@ $<
regress:: test08; ./test08
cleanall:: ; $(RMF) test08

## ###### ###### ##

all:: \
test09
test09: \
test09.dats; $(PATSCC) -o $@ $<
regress:: test09; ./test09
cleanall:: ; $(RMF) test09

## ###### ###### ##

all:: \
test10
test10: \
test10.dats; \
$(PATSCC) -D_GNU_SOURCE -DATS_MEMALLOC_LIBC -o $@ $< -latslib
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
test13
test13: \
test13.dats; $(PATSCC) -o $@ $<
regress:: test13; ./test13
cleanall:: ; $(RMF) test13

## ###### ###### ##

all:: \
test14
test14: \
test14.dats; $(PATSCC) -o $@ $<
regress:: test14; ./test14
cleanall:: ; $(RMF) test14

## ###### ###### ##

all:: \
test15
test15: test15.dats
	@if $(PATSCC) -o $@ $< 2> /dev/null; then \
		echo "test15.dats should not compile"; \
		exit 1; \
	fi
regress:: test15; [ ! -x test15 ] || ./test15
cleanall:: ; $(RMF) test15

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
