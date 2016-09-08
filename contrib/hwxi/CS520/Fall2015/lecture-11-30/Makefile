#
# A simple Makefile
#

######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt

######

all:: lambda

######

SOURCES=\
  lambda.sats \
  lambda_term.dats \
  lambda_vnam.dats \
  lambda_main.dats \

######

lambda:: \
lambda_term_dats.c \
lambda_vnam_dats.c \
lambda_main_dats.c ; \
$(PATSCC) -DATS_MEMALLOC_GCBDW -o $@ $^ -lgc

######

regress:: lambda; ./lambda

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
depend:: ; \
$(PATSOPT) --output-a .depend --depgen -d lambda_main.dats
#
######

testall:: all
testall:: regress
testall:: cleanall

######

RMF=rm -f

######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *_?ats.c
clean:: ; $(RMF) *_?ats.o

######

cleanall:: clean
cleanall:: ; $(RMF) lambda
cleanall:: ; $(RMF) .depend

###### end of [Makefile] ######
