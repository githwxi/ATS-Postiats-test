#
# For lecture-10-11
#

######
#
PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt
#
# PATSOLVE=$(PATSHOME)/bin/patsolve_z3
#
######
#
all:: fact
fact: fact.dats; \
$(PATSCC) --constraint-ignore -o $@ $<
#
regress:: fact; ./fact
cleanall:: ; $(RMF) fact
#
######

RMF=rm -f

######

testall:: all
testall:: regress
testall:: cleanall

######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *_?ats.c

cleanall:: clean

###### end of [Makefile] ######
