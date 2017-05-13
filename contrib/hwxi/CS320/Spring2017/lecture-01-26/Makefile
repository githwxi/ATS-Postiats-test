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
all:: fact
all:: test1
all:: test2

#######

regress:: fact; ./fact
regress:: test1; ./test1
regress:: test2; ./test2

#######

fact: fact.dats; $(PATSCC) -o $@ $< 

#######

test1: \
test-for-loop.dats; \
$(PATSCC) -DATS_MEMALLOC_LIBC -o $@ $< for-loop.dats

#######

test2: \
test-while-loop.dats; \
$(PATSCC) -DATS_MEMALLOC_LIBC -o $@ $< while-loop.dats

#######

testall:: all
testall:: regress
testall:: cleanall

#######

clean:: ; rm -f *~
clean:: ; rm -f *_dats.c
clean:: ; rm -f *_dats.o

cleanall:: clean
cleanall:: ; rm -f fact
cleanall:: ; rm -f test1
cleanall:: ; rm -f test2

###### end of [Makefile] ######
