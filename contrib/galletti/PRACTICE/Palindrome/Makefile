######
#
# Cleaning Makefile
#
######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt

######

all:: drome_dats
regress:: drome_dats; ./$<
cleanall:: ; rm -f drome_dats

######

testall:: all regress cleanall

######

clean:: ; rm -f *~
clean:: ; rm -f *_dats.o
clean:: ; rm -f *_dats.c

cleanall:: clean
cleanall:: ; rm -f drome_dats

######

%_dats: %.dats; $(PATSCC) -D_GNU_SOURCE -DATS_MEMALLOC_LIBC -o $@ $<

###### end of [Makefile] ######
