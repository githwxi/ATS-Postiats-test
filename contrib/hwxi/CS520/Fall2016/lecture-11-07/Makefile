#
# For lecture-11-07
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
all:: lambda
lambda: lambda.dats; \
$(PATSCC) -DATS_MEMALLOC_LIBC -o $@ $<
#
######
#
all:: testing
testing: testing.dats; \
$(PATSCC) -DATS_MEMALLOC_LIBC -o $@ $<
#
regress:: testing; ./$<
cleanall:: ; $(RMF) testing
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
