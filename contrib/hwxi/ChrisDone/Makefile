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

all:: 001-hello
regress:: 001-hello; ./$<
cleanall:: ; $(RMF) 001-hello

all:: 002-imports
regress:: 002-imports; ./$<
cleanall:: ; $(RMF) 002-imports

all:: 003-exprs
regress:: 003-exprs; ./$<
cleanall:: ; $(RMF) 003-exprs

all:: 004-finalization
regress:: 004-finalization; ./$<
cleanall:: ; $(RMF) 004-finalization

all:: 005-local-bindings
regress:: 005-local-bindings; ./$<
cleanall:: ; $(RMF) 005-local-bindings

all:: 006-tuples
regress:: 006-tuples; ./$<
cleanall:: ; $(RMF) 006-tuples

all:: 007-records
regress:: 007-records; ./$<
cleanall:: ; $(RMF) 007-records

all:: 008-if
regress:: 008-if; ./$<
cleanall:: ; $(RMF) 008-if

all:: 009-sequences
regress:: 009-sequences; ./$<
cleanall:: ; $(RMF) 009-sequences

all:: 010-functions
regress:: 010-functions; ./$<
cleanall:: ; $(RMF) 010-functions

all:: 011-coins
regress:: 011-coins; ./$<
cleanall:: ; $(RMF) 011-coins

all:: 012-tco
regress:: 012-tco; ./$<
cleanall:: ; $(RMF) 012-tco

all:: 013-nqueens
regress:: 013-nqueens; ./$<
cleanall:: ; $(RMF) 013-nqueens

all:: 014-mutualrecursive
regress:: 014-mutualrecursive; ./$<
cleanall:: ; $(RMF) 014-mutualrecursive

## ###### ###### ##
#
%: %.dats ; \
$(PATSCC) -O2 -D_GNU_SOURCE -DATS_MEMALLOC_LIBC -o $@ $<
#
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
