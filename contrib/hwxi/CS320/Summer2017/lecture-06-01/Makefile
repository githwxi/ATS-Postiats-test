######
#
# A Simple Makefile
#
######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt

######

all:: mylist0_funs
all:: mylist0_permute

######

regress:: \
mylist0_funs; ./mylist0_funs
regress:: \
mylist0_permute; ./mylist0_permute

######
#
mylist0_funs: \
mylist0_funs.dats; \
$(PATSCC) -DATS_MEMALLOC_LIBC -o $@ $<
#
mylist0_permute: \
mylist0_permute.dats; \
$(PATSCC) -DATS_MEMALLOC_LIBC -o $@ $<
#
######

testall:: all
testall:: regress
testall:: cleanall

######

clean:: ; rm -f *~
clean:: ; rm -f *_?ats.o
clean:: ; rm -f *_?ats.c

cleanall:: clean
cleanall:: ; rm -f mylist0_funs mylist0_permute

###### end of [Makefile] ######
