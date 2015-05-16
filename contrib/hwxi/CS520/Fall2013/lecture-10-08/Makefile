#
# A simple Makefile
#

######

.PHONY: all

######

PATSCC=$(PATSHOME)/bin/patscc

######

all:: \
matlist
matlist: \
matlist.dats ; \
$(PATSCC) -DATS_MEMALLOC_LIBC -o $@ $<
regress:: matlist; ./$<
cleanall:: ; $(RMF) matlist

######

testall:: all
testall:: regress
testall:: cleanall

######

RMF=rm -f

######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *.o
clean:: ; $(RMF) *.c

cleanall:: clean

###### end of [Makefile] ######
