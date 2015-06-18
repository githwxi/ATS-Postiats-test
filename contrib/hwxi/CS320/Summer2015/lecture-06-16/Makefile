#
# PATSHOME is already available
#

######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt
PATSLIB=$(PATSHOME)/ccomp/atslib/lib

######

all:: \
gtree-search-tree
gtree-search-tree: \
gtree-search-tree.dats; \
$(PATSCC) -D_GNU_SOURCE -DATS_MEMALLOC_LIBC -o $@ $<
regress:: gtree-search-tree; ./gtree-search-tree
cleanall:: ; rm -f gtree-search-tree

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
