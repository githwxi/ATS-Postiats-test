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

all:: \
FPL-lambda_dats.js

######
#
FPL-lambda_dats.c: \
  FPL-lambda.dats; $(PATSCC) -ccats FPL-lambda.dats
FPL-lambda_dats.js: \
  FPL-lambda_dats.c; $(ATSCC2JS) -o $@ -i FPL-lambda_dats.c
#
cleanall:: ; $(RMF) FPL-lambda_dats.js
#
######

testall:: all
testall:: cleanall

######

RMF=rm -f

######
#
%_dats.o: \
%.dats lambda.sats; $(PATSCC) -o $@ -c $<
#
######

testall:: all
#testall:: regress
testall:: cleanall

######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *_?ats.c
clean:: ; $(RMF) *_?ats.o

######

cleanall:: clean

###### end of [Makefile] ######
