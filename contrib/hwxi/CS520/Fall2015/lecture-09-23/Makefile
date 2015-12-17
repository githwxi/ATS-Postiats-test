#
# A simple Makefile
#

######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt

######
#
testall:: ; \
$(PATSCC) -tcats \
LEM.dats ConjCommute.dats DisjCommute.dats
#
testall:: ; $(PATSCC) -tcats isPerfect.dats
#
######

clean:: ; rm -f *~

######

cleanall:: clean

###### end of [Makefile] ######
