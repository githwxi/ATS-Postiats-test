#
# PATSHOME is already available
#

######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt
PATSLIB=$(PATSHOME)/ccomp/atslib/lib

######

CAT=cat

######

all:: \
word-counting
word-counting: \
word-counting.dats; \
$(PATSCC) -D_GNU_SOURCE -DATS_MEMALLOC_LIBC -o $@ $<
regress:: word-counting; $(CAT) Makefile | ./word-counting
cleanall:: ; rm -f word-counting

######

all:: \
word-counting2
word-counting2: \
word-counting2.dats; \
$(PATSCC) -D_GNU_SOURCE -DATS_MEMALLOC_LIBC -o $@ $<
regress:: word-counting2; $(CAT) Makefile | ./word-counting2
cleanall:: ; rm -f word-counting2

######

testall:: all
testall:: regress
testall:: cleanall

######

clean:: ; rm -f *~
clean:: ; rm -f *_?ats.o
clean:: ; rm -f *_?ats.c

cleanall:: clean

###### end of [Makefile] ######
