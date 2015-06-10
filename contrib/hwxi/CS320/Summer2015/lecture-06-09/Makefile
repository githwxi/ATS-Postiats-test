#
# PATSHOME is already available
#

######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt
PATSLIB=$(PATSHOME)/ccomp/atslib/lib

######

all:: \
list0_find
list0_find: \
list0_find.dats; \
$(PATSCC) -D_GNU_SOURCE -DATS_MEMALLOC_LIBC -o $@ $<
regress:: list0_find; ./list0_find
cleanall:: ; rm -f list0_find

######

all:: \
tree0_test
tree0_test: \
tree0_test.dats; \
$(PATSCC) -D_GNU_SOURCE -DATS_MEMALLOC_LIBC -o $@ $<
regress:: tree0_test; ./tree0_test
cleanall:: ; rm -f tree0_test

######

all:: \
word-counting
word-counting: \
word-counting.dats; $(PATSCC) -tcats $<

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
