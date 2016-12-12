#
# For FPL-lambdaCal
#

######
#
PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt
#
######
#
PATSOLVE=$(PATSHOME)/bin/patsolve_z3
#
######
#
ATSCC2JS=$(PATSHOME)/bin/atscc2js
#
######

all::

######

all:: lambda_term_dats.o

######

testing: \
testing.dats \
lambda_term_dats.o ; \
$(PATSCC) -DATS_MEMALLOC_LIBC -o $@ $^
#
regress:: testing; ./$<
cleanall:: ; $(RMF) testing
#
######

RMF=rm -f

######
#
%_dats.o: \
%.dats lambda.sats; $(PATSCC) -o $@ -c $<
#
######

testall:: all
testall:: regress
testall:: cleanall

######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *_?ats.c
clean:: ; $(RMF) *_?ats.o

######

cleanall:: clean

###### end of [Makefile] ######
