######
#
# A Simple Makefile
#
######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt

######

all:: mylist0

######

regress:: mylist0; ./mylist0

######
#
mylist0: \
mylist0.dats; \
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
cleanall:: ; rm -f mylist0

###### end of [Makefile] ######
