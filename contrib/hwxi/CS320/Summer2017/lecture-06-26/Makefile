######
#
# A Simple Makefile
#
######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt

######

all:: fact
all:: factref
all:: myarray
all:: mymatrix

######

regress:: fact; ./fact
regress:: factref; ./factref
regress:: myarray; ./myarray
regress:: mymatrix; ./mymatrix

######

fact: \
fact.dats; $(PATSCC) -DATS_MEMALLOC_LIBC -o $@ $<

factref: \
factref.dats; $(PATSCC) -DATS_MEMALLOC_LIBC -o $@ $<

myarray: \
myarray.dats; $(PATSCC) -DATS_MEMALLOC_LIBC -o $@ $<
mymatrix: \
mymatrix.dats; $(PATSCC) -DATS_MEMALLOC_LIBC -o $@ $<

######

testall:: all
testall:: regress
testall:: cleanall

######

clean:: ; rm -f *~
clean:: ; rm -f *_?ats.o
clean:: ; rm -f *_?ats.c

cleanall:: clean
cleanall:: ; rm -f fact
cleanall:: ; rm -f factref
cleanall:: ; rm -f myarray
cleanall:: ; rm -f mymatrix

###### end of [Makefile] ######
