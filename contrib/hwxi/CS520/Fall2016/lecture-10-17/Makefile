#
# For lecture-09-14
#

######
#
PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt
#
PATSOLVE=$(PATSHOME)/bin/patsolve_z3
#
######
#
all:: zipwith
zipwith: zipwith.dats; $(PATSOPT) -tc -d $<
#
######
#
all:: permute
permute: permute.dats; $(PATSOPT) --constraint-ignore -tc -d $<
#
######
#
all:: brauntree
brauntree: brauntree.dats; $(PATSOPT) -tc -d $<
#
######

RMF=rm -f

######

testall:: all

######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *_?ats.c

cleanall:: clean

###### end of [Makefile] ######
