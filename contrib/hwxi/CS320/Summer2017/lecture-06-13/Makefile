######
#
# A Simple Makefile
#
######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt

######

all:: Ramanujan
all:: Ramanujan2

######

regress:: Ramanujan; ./Ramanujan
regress:: Ramanujan2; ./Ramanujan2

######

Ramanujan: \
Ramanujan.dats; $(PATSCC) -DATS_MEMALLOC_LIBC -o $@ $<

Ramanujan2: \
Ramanujan2.dats; $(PATSCC) -DATS_MEMALLOC_LIBC -o $@ $<

######

testall:: all
testall:: regress
testall:: cleanall

######

clean:: ; rm -f *~
clean:: ; rm -f *_?ats.o
clean:: ; rm -f *_?ats.c

cleanall:: clean
cleanall:: ; rm -f Ramanujan
cleanall:: ; rm -f Ramanujan2

###### end of [Makefile] ######
