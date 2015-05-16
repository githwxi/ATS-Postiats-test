#
# A simple Makefile
#

######

MAKE=make

######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt

######

all:: \
fact_extern
fact_extern: \
fact_extern.dats; $(PATSCC) -o $@ $<
regress:: fact_extern; ./$<
cleanall:: ; rm -f fact_extern

######

testall:: all
testall:: regress
testall:: cleanall

######

clean:: ; rm -f *~
clean:: ; rm -f *_dats.c

######

cleanall:: clean

###### end of [Makefile] ######
