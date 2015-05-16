#
# A simple Makefile
#

######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt

######

all:: \
permute
permute: \
permute.dats; $(PATSCC) -tcats -o $@ $<

######

testall:: all

######

clean:: ; rm -f *~
clean:: ; rm -f *_dats.c

######

cleanall:: clean

###### end of [Makefile] ######
