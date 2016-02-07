#
# For lecture-10-21
#

######
#
PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt
#
PATSOLVE=$(PATSHOME)/bin/patsolve_z3
#
######

all:: array_v

######
#
array_v: \
array_v.dats ; $(PATSCC) -tcats $<
#
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

###### end of [Makefile] ######
