######
#
# A Simple Makefile
#
######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt

######

all:: fact
all:: fact2

######

regress:: fact; ./fact 10
regress:: fact2; ./fact2 10

######

fact: fact.dats; $(PATSCC) -o $@ $<
fact2: fact2.dats; $(PATSCC) -o $@ $<

######

testall:: all
testall:: regress
testall:: cleanall

######

clean:: ; rm -f *~
clean:: ; rm -f *_?ats.o
clean:: ; rm -f *_?ats.c

cleanall:: clean
cleanall:: ; rm -f fact fact2

###### end of [Makefile] ######
