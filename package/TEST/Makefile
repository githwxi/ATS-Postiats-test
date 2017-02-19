##
## A Makefile for simple testing
##

## ###### ###### ##

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt

## ###### ###### ##
#
PATSCC2=\
$(PATSCC) \
-D_GNU_SOURCE \
-D_ATS_CCOMP_ASSUME_CHECK_NONE_
#
## ###### ###### ##
#
export \
PATSHOMELOCS=\
./node_modules:./../../node_modules
#
## ###### ###### ##

RMF=rm -f

## ###### ###### ##

all::
regress::
cleanall::

## ###### ###### ##

all:: \
test01_mergesort
test01_mergesort: \
test01_mergesort.dats; \
$(PATSCC) -O2 \
-DATS_MEMALLOC_GCBDW -o $@ $< -lgc
regress:: \
test01_mergesort; ./$<
cleanall:: ; $(RMF) test01_mergesort

## ###### ###### ##

all:: \
test02_mergesort
test02_mergesort: \
test02_mergesort.dats; \
$(PATSCC) -O2 \
-DATS_MEMALLOC_GCBDW -o $@ $< -lgc
regress:: \
test02_mergesort; ./$<
cleanall:: ; $(RMF) test02_mergesort

## ###### ###### ##

all:: \
test01_mergesortpar
test01_mergesortpar: \
test01_mergesortpar.dats; \
$(PATSCC2) -O2 \
-DATS_MEMALLOC_GCBDW -o $@ $< -lgc -lpthread
regress:: \
test01_mergesortpar; ./$<
cleanall:: ; $(RMF) test01_mergesortpar

## ###### ###### ##

all:: \
test02_mergesortpar
test02_mergesortpar: \
test02_mergesortpar.dats; \
$(PATSCC2) -O2 \
-DATS_MEMALLOC_GCBDW -o $@ $< -lgc -lpthread
regress:: \
test02_mergesortpar; ./$<
cleanall:: ; $(RMF) test02_mergesortpar

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
