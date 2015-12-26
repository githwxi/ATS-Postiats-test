#
# A simple Makefile
#

######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt

######

all:: funtemp
regress:: funtemp; ./funtemp
cleanall:: ; rm -f funtemp

######

all:: mylist-poly
regress:: mylist-poly; ./mylist-poly
cleanall:: ; rm -f mylist-poly

######

all:: list_length
regress:: list_length; ./list_length
cleanall:: ; rm -f list_length

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
