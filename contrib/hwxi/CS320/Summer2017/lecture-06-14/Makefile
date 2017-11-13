######
#
# A Simple Makefile
#
######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt

######

all:: series
all:: Sierpinski
all:: QueenPuzzle

######

regress:: series; ./series
regress:: QueenPuzzle; ./QueenPuzzle

######

series: \
series.dats; \
$(PATSCC) -DATS_MEMALLOC_LIBC -o $@ $<

Sierpinski: Sierpinski.dats; $(PATSCC) -tcats $<

QueenPuzzle: \
QueenPuzzle.dats; \
$(PATSCC) -DATS_MEMALLOC_LIBC -o $@ $<

######

testall:: all
testall:: regress
testall:: cleanall

######

clean:: ; rm -f *~
clean:: ; rm -f *_?ats.o
clean:: ; rm -f *_?ats.c

cleanall:: clean
cleanall:: ; rm -f series
cleanall:: ; rm -f QueenPuzzle

###### end of [Makefile] ######
