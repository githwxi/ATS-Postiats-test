#
# A simple Makefile
#

######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt
PATSLIB=$(PATSHOME)/ccomp/atslib/lib

######

all:: kfib
regress:: kfib; ./$<
cleanall:: ; rm -f kfib

######

all:: kfact2
regress:: kfact2; ./$<
cleanall:: ; rm -f kfact2

######

all:: evenodd
regress:: evenodd; ./$<
cleanall:: ; rm -f evenodd

######

all:: coin_change
regress:: coin_change; ./$<
cleanall:: ; rm -f coin_change

######
#
%: %.dats ; \
$(PATSCC) -D_GNU_SOURCE -DATS_MEMALLOC_GCBDW -O2 -o $@ $< -lgc
#
#######

testall:: all
testall:: regress
testall:: cleanall

#######

clean:: ; rm -f *~
clean:: ; rm -f *_?ats.c
clean:: ; rm -f *_?ats.o

#######

cleanall:: clean

####### end of [Makefile] ######
