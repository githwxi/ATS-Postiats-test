######
#
# A Simple Makefile
#
######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt

######

all:: \
flatten
flatten: \
flatten.dats; \
$(PATSCC) -DATS_MEMALLOC_LIBC -o $@ flatten.dats

######

regress:: flatten; ./flatten

######

testall:: all
testall:: regress
testall:: cleanall

######

clean:: ; rm -f *~
clean:: ; rm -f *_?ats.o
clean:: ; rm -f *_?ats.c

cleanall:: clean
cleanall:: ; rm -f flatten

###### end of [Makefile] ######
