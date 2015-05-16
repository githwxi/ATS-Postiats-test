#
# A simple Makefile
#

######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt

######

all:: fact

######

fact: fact.dats myatoi.c ; $(PATSCC) -o $@ $^
regress:: fact; ./$<
cleanall:: ; rm -f fact

######

testall:: all
testall:: regress
testall:: cleanall

######

clean:: ; rm -f *~
clean:: ; rm -f *.o
clean:: ; rm -f *_?ats.c

######

cleanall:: clean

###### end of [Makefile] ######
