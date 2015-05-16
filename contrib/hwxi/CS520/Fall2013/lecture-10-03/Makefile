#
# A simple Makefile
#

######

.PHONY: all

######

PATSCC=$(PATSHOME)/bin/patscc

######

all:: \
HanoiTowers
HanoiTowers: \
HanoiTowers.dats ; $(PATSCC) -DATS_MEMALLOC_LIBC -o $@ $<
regress:: HanoiTowers; ./$<
cleanall:: ; $(RMF) HanoiTowers

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
