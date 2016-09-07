#
# A simple Makefile
#

######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt

######

all:: list
regress:: list; ./list
cleanall:: ; rm -f list

######

all:: intbin
regress:: intbin; ./intbin
cleanall:: ; rm -f intbin

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
