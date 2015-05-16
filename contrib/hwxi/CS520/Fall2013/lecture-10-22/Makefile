#
# A simple Makefile
#

######

.PHONY: all

######

PATSCC=$(PATSHOME)/bin/patscc

######

all:: \
ProduceConsume
ProduceConsume: \
ProduceConsume.dats ; $(PATSCC) -tcats -o $@ $<

######

testall:: all

######

RMF=rm -f

######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *.o
clean:: ; $(RMF) *.c

cleanall:: clean

###### end of [Makefile] ######
