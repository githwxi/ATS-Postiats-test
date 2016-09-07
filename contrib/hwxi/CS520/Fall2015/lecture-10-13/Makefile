#
# A simple Makefile
#

######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt

######

all:: kfact
regress:: kfact; ./kfact
cleanall:: ; rm -f kfact

######

testall:: all
testall:: regress
testall:: cleanall

######
#
%: %.dats; $(PATSCC) -o $@ $< -DATS_MEMALLOC_LIBC
#
######

clean:: ; rm -f *~
clean:: ; rm -f myfib.o
clean:: ; rm -f *_dats.o
clean:: ; rm -f *_dats.c

cleanall:: clean

###### end of [Makefile] ######
