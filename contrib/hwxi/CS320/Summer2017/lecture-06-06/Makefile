######
#
# A Simple Makefile
#
######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt

######

all:: mystream
all:: mystream-funs

######

regress:: mystream; ./mystream 10
regress:: mystream-funs; ./mystream-funs 10

######

mystream: \
mystream.dats; $(PATSCC) -DATS_MEMALLOC_LIBC -o $@ $<
mystream-funs: \
mystream-funs.dats; $(PATSCC) -DATS_MEMALLOC_LIBC -o $@ $<

######

testall:: all
testall:: regress
testall:: cleanall

######

clean:: ; rm -f *~
clean:: ; rm -f *_?ats.o
clean:: ; rm -f *_?ats.c

cleanall:: clean
cleanall:: ; rm -f mystream mystream-funs

###### end of [Makefile] ######
