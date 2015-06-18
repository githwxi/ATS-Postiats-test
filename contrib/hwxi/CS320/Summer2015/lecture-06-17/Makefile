#
# PATSHOME is already available
#

######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt
PATSLIB=$(PATSHOME)/ccomp/atslib/lib

######

all:: \
combinators
combinators: \
combinators.dats; \
$(PATSCC) -D_GNU_SOURCE -DATS_MEMALLOC_LIBC -o $@ $<
regress:: combinators; ./combinators
cleanall:: ; rm -f combinators

######

all:: \
game-of-24
game-of-24: \
game-of-24.dats; \
$(PATSCC) -D_GNU_SOURCE -DATS_MEMALLOC_LIBC -o $@ $<
regress:: game-of-24; ./game-of-24
cleanall:: ; rm -f game-of-24

######

testall:: all
testall:: regress
testall:: cleanall

######

clean:: ; rm -f *~
clean:: ; rm -f *_?ats.o
clean:: ; rm -f *_?ats.c

cleanall:: clean

###### end of [Makefile] ######
