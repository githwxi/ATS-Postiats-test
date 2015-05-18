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

all:: 015-closures
regress:: 015-closures; ./$<
cleanall:: ; $(RMF) 015-closures

all:: 016-higherorder
regress:: 016-higherorder; ./$<
cleanall:: ; $(RMF) 016-higherorder

all:: 017-currying
regress:: 017-currying; ./$<
cleanall:: ; $(RMF) 017-currying

all:: 018-datatypes
regress:: 018-datatypes; ./$<
cleanall:: ; $(RMF) 018-datatypes

all:: 019-templates
regress:: 019-templates; ./$<
cleanall:: ; $(RMF) 019-templates

all:: 020-polymorphic
regress:: 020-polymorphic; ./$<
cleanall:: ; $(RMF) 020-polymorphic

all:: 021-exceptions
regress:: 021-exceptions; ./$<
cleanall:: ; $(RMF) 021-exceptions

all:: 022-io
regress:: 022-io; \
./022-io < ./022-io.dats > /dev/null
cleanall:: ; $(RMF) 022-io

all:: 022-references
regress:: 022-references; ./$<
cleanall:: ; $(RMF) 022-references

all:: 023-arrays
regress:: 023-arrays; ./$<
cleanall:: ; $(RMF) 023-arrays

all:: 023-macros
regress:: 023-macros; ./$<
cleanall:: ; $(RMF) 023-macros

all:: 024-matrices
regress:: 024-matrices; ./$<
cleanall:: ; $(RMF) 024-matrices

all:: 025-dependent-types
regress:: 025-dependent-types; ./$<
cleanall:: ; $(RMF) 025-dependent-types

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
