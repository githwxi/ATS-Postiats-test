#
# PATSHOME is already available
#

######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt

######

######

all:: intlist
intlist: \
intlist.dats; \
$(PATSCC) -DATS_MEMALLOC_LIBC -o $@ $<
regress:: intlist; ./intlist
cleanall:: ; rm -f intlist

######

all:: intlist_sort
intlist_sort: \
intlist_sort.dats; \
$(PATSCC) -DATS_MEMALLOC_GCBDW -o $@ $< -lgc
regress:: intlist_sort; ./intlist_sort
cleanall:: ; rm -f intlist_sort

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
