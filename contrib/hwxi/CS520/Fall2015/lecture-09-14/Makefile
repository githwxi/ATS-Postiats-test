#
# A simple Makefile
#

######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt

######

all:: higher-order
regress:: higher-order; ./higher-order
cleanall:: ; rm -f higher-order

######

all:: mylist-mono
regress:: mylist-mono; ./mylist-mono
cleanall:: ; rm -f mylist-mono

######

all:: mylist-poly
regress:: mylist-poly; ./mylist-poly
cleanall:: ; rm -f mylist-poly

######

testall:: all
testall:: regress
testall:: cleanall

######
#
%: %.dats; $(PATSCC) -o $@ $< -DATS_MEMALLOC_LIBC
#
######

clean:: ; rm -f *~
clean:: ; rm -f myfib.o
clean:: ; rm -f *_dats.o
clean:: ; rm -f *_dats.c

cleanall:: clean

###### end of [Makefile] ######
