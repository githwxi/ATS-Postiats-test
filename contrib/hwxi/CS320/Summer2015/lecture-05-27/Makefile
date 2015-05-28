#
# PATSHOME is already available
#

######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt

######

all:: \
power
power: \
power.dats; \
$(PATSCC) -DATS_MEMALLOC_LIBC -o $@ $<
regress:: power; ./power
cleanall:: ; rm -f power

######

all:: \
mylist
mylist: \
mylist.dats; \
$(PATSCC) -DATS_MEMALLOC_LIBC -o $@ $<
regress:: mylist; ./mylist
cleanall:: ; rm -f mylist

######

all:: \
higher-order
higher-order: \
higher-order.dats; \
$(PATSCC) -DATS_MEMALLOC_LIBC -o $@ $<
regress:: higher-order; ./higher-order
cleanall:: ; rm -f higher-order

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
