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
mystream
mystream: \
mystream.dats; $(PATSCC2) -o $@ $<
#
regress:: mystream; ./$<
cleanall:: ; $(RMF) mystream
#
######
#
all:: \
QueenPuzzle_bfs
QueenPuzzle_bfs: \
QueenPuzzle_bfs.dats; $(PATSCC2) -o $@ $<
#
regress:: QueenPuzzle_bfs; ./$<
cleanall:: ; $(RMF) QueenPuzzle_bfs
#
######
#
all:: \
QueenPuzzle_dfs
QueenPuzzle_dfs: \
QueenPuzzle_dfs.dats; $(PATSCC2) -o $@ $<
#
regress:: QueenPuzzle_dfs; ./$<
cleanall:: ; $(RMF) QueenPuzzle_dfs
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
