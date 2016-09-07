#
# A simple Makefile
#
######
#
PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt
#
######

all:: lists
lists: lists.dats; \
$(PATSCC) -DATS_MEMALLOC_LIBC -o $@ lists.dats
regress:: lists; ./lists
cleanall:: ; rm -f lists

######

all:: insort
insort: insort.dats; \
$(PATSCC) -DATS_MEMALLOC_LIBC -o $@ insort.dats
regress:: insort; ./insort
cleanall:: ; rm -f insort

######

testall:: all
testall:: regress
testall:: cleanall

######

CAT=cat
RMF=rm -f

######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *_?ats.c

######
#
cleanall:: clean
#
###### end of [Makefile] ######
