#
# A simple Makefile
#

######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt

######

all:: tally
tally: tally.dats; $(PATSCC) -o $@ $<
regress:: tally; ./$<
cleanall:: ; rm -f tally

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