#
# PATSHOME is already available
#

######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt
PATSLIB=$(PATSHOME)/ccomp/atslib/lib

######

all:: \
fact
fact: \
fact.dats fact.c; \
$(PATSCC) -D_GNU_SOURCE -DATS_MEMALLOC_LIBC -o $@ $^
regress:: fact; ./fact 10
cleanall:: ; rm -f fact

######

all:: \
fact2
fact2: \
fact2.dats fact2.c; \
$(PATSCC) -D_GNU_SOURCE -DATS_MEMALLOC_LIBC -o $@ $^
regress:: fact2; ./fact2 12
cleanall:: ; rm -f fact2

######

all:: \
gfact
gfact: \
gfact.dats; \
$(PATSCC) -I${PATSHOMERELOC}/contrib -D_GNU_SOURCE -DATS_MEMALLOC_LIBC -o $@ $< -lgmp
regress:: gfact; ./gfact 12
cleanall:: ; rm -f gfact

######

all:: \
qsort
qsort: \
qsort.dats; \
$(PATSCC) -D_GNU_SOURCE -DATS_MEMALLOC_LIBC -o $@ $<
regress:: qsort; ./qsort 12
cleanall:: ; rm -f qsort

######

all:: \
msort
msort: \
msort.dats; \
$(PATSCC) -D_GNU_SOURCE -DATS_MEMALLOC_LIBC -o $@ $<
regress:: msort; ./msort 12
cleanall:: ; rm -f msort

######

testall:: all
testall:: regress
testall:: cleanall

######

clean:: ; rm -f *~
clean:: ; rm -f fact.o
clean:: ; rm -f *_?ats.o
clean:: ; rm -f *_?ats.c

cleanall:: clean

###### end of [Makefile] ######
