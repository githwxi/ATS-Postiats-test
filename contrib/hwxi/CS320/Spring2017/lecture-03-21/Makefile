#
# A simple Makefile
#

######

NPM=npm

######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt
PATSLIB=$(PATSHOME)/ccomp/atslib/lib

######

PATSCC2=\
$(PATSCC) -O2 \
-D_GNU_SOURCE -DATS_MEMALLOC_LIBC

######
#
export \
PATSHOMELOCS=\
./node_modules:./../../node_modules
#
######

all::
regress::
cleanall::

######
#
npm-install:: ; \
$(NPM) i atscntrb-bucs320-graphsearch
#
######
#
all:: \
QueenPuzzle
QueenPuzzle: \
QueenPuzzle.dats; $(PATSCC2) -o $@ $<
#
regress:: QueenPuzzle; ./$<
cleanall:: ; $(RMF) QueenPuzzle
#
######

testall:: all
testall:: regress
testall:: cleanall

######

RMF=rm -f

######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *_?ats.c

######
#
cleanall:: clean
#
# cleanall:: ; $(RMF) -r node_modules
#
######

###### end of [Makefile] ######
