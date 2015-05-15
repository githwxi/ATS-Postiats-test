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

all:: fact
regress:: fact; ./$<
cleanall:: ; $(RMF) fact

######
#
%: %.dats ; \
$(PATSCC) -D_GNU_SOURCE -DATS_MEMALLOC_GCBDW -O2 -o $@ $< -lgc
#
#######
#
testall:: all
testall:: regress
testall:: cleanall
#
testall:: ; $(MAKE) -C gtree -f Makefile testall
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
