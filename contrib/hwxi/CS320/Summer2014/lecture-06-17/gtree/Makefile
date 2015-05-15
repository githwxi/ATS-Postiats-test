#
# A simple Makefile
#

######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt
PATSLIB=$(PATSHOME)/ccomp/atslib/lib

######

all::
regress::
cleanall::

######

all:: queen-puzzle
regress:: queen-puzzle; ./$<
cleanall:: ; $(RMF) queen-puzzle

all:: queen-puzzle2
regress:: queen-puzzle2; ./$<
cleanall:: ; $(RMF) queen-puzzle2

######

%: %.dats ; \
$(PATSCC) -O2 -D_GNU_SOURCE -DATS_MEMALLOC_LIBC -o $@ $<

#######

testall:: all
testall:: regress
testall:: cleanall

#######

RMF=rm -f

#######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *_?ats.c
clean:: ; $(RMF) *_?ats.o

######

cleanall:: clean

####### end of [Makefile] ######
