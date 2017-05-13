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
mylist0_opers
mylist0_opers: \
mylist0_opers.dats; \
$(PATSCC) -DATS_MEMALLOC_LIBC -o $@ $<
regress:: mylist0_opers; ./$<
cleanall:: ; rm -f mylist0_opers

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
