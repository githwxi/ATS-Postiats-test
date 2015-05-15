#
# A simple Makefile
#

######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt

######

all::

######

all:: hanoi
hanoi: hanoi.dats; $(PATSCC) -o $@ $<
regress:: hanoi; ./$<
cleanall:: ; $(RMF) hanoi

######

all:: \
intlist
intlist: \
intlist.dats; $(PATSCC) -O2 -DATS_MEMALLOC_LIBC -o $@ $<
regress:: intlist; ./$<
cleanall:: ; $(RMF) intlist

######

testall:: all
testall:: regress
testall:: cleanall

######

RMF=rm -f

######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *_?ats.c
clean:: ; $(RMF) *_?ats.o

######

cleanall:: clean

###### end of [Makefile] ######
