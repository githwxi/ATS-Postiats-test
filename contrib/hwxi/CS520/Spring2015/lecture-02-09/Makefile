#
# A simple Makefile
#

######

MAKE=make

######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt
PATSLIB=$(PATSHOME)/ccomp/atslib/lib

######

all::
regress::
cleanall::

######
#
all:: ; $(PATSCC) -tcats LEM.dats
all:: ; $(PATSCC) -tcats Peirce.dats
#
######
#
%: %.dats ; \
$(PATSCC) -D_GNU_SOURCE -DATS_MEMALLOC_LIBC -O2 -o $@ $<
#
#######
#
testall:: all
#
#######

RMF=rm -f

#######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *_?ats.c
clean:: ; $(RMF) *_?ats.o

#######

cleanall:: clean

####### end of [Makefile] ######
