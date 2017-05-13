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
all:: test

#######

regress:: test; ./test

#######

test: \
time-complexity.dats; \
$(PATSCC) -DATS_MEMALLOC_LIBC -o $@ $<

#######

testall:: all
testall:: regress
testall:: cleanall

#######

clean:: ; rm -f *~
clean:: ; rm -f *_dats.c
clean:: ; rm -f *_dats.o

cleanall:: clean
cleanall:: ; rm -f test

###### end of [Makefile] ######
