#
# For lecture-10-07
#

######

MAKE=make

######
#
PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt
#
PATSOLVE=$(PATSHOME)/bin/patsolve_z3
#
######

all:: \
BaconJs
BaconJs:: ; $(MAKE) -C Bacon.js testall

######

all:: \
stream_con
stream_con:: ; $(PATSCC) -tcats stream_con.dats

######

RMF=rm -f

######

testall:: all
testall:: cleanall

######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *_?ats.c
clean:: ; $(RMF) *_?ats.o

cleanall:: clean
cleanall:: ; $(MAKE) -C Bacon.js cleanall

###### end of [Makefile] ######
