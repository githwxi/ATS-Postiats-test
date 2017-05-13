#######
#
# For lecture-01-26
#
#######

PATSCC=\
$(PATSHOME)/bin/patscc
PATSOPT=\
$(PATSHOME)/bin/patsopt

#######

all::

#######

all:: \
mylist
mylist: \
mylist.dats; \
$(PATSCC) -DATS_MEMALLOC_LIBC -o $@ $<
regress:: mylist; ./$<
cleanall:: ; rm -f mylist

#######

all:: \
mylist2
mylist2: \
mylist2.dats; \
$(PATSCC) -DATS_MEMALLOC_LIBC -o $@ $<
regress:: mylist2; ./$<
cleanall:: ; rm -f mylist2

#######

testall:: all
testall:: regress
testall:: cleanall

#######

clean:: ; rm -f *~
clean:: ; rm -f *_dats.c
clean:: ; rm -f *_dats.o

#######

cleanall:: clean

###### end of [Makefile] ######
