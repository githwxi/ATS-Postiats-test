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
$(NPM) i effectivats-divideconquer
#
######
#
all:: \
myreverse
myreverse: \
myreverse.dats; $(PATSCC2) -o $@ $<
#
regress:: myreverse; ./$<
cleanall:: ; $(RMF) myreverse
#
######
#
all:: \
myreverse2
myreverse2: \
myreverse2.dats; $(PATSCC2) -o $@ $<
#
regress:: myreverse2; ./$<
cleanall:: ; $(RMF) myreverse2
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
