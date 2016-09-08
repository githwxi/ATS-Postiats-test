#
# A simple Makefile
#

######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt

######

all::

######

SOURCES=\
  lambda.sats \
  lambda_term.dats \
  lambda_vnam.dats \

######

all:: lambda_term_dats.c
all:: lambda_vnam_dats.c

######

%_dats.c : %.dats ; $(PATSCC) -ccats $<

######
#
-include .depend
#
depend:: ; \
$(PATSOPT) --output-a .depend --depgen -s lambda.sats
depend:: ; \
$(PATSOPT) --output-a .depend --depgen -d lambda_term.dats
depend:: ; \
$(PATSOPT) --output-a .depend --depgen -d lambda_vnam.dats
#
######

testall:: all
testall:: cleanall

######

RMF=rm -f

######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *_?ats.c
clean:: ; $(RMF) *_?ats.o

######

cleanall:: clean
cleanall:: ; $(RMF) .depend

###### end of [Makefile] ######
