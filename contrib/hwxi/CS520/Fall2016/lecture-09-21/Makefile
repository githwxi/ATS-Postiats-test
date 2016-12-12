#
# For lecture-09-14
#

######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt

######
#
all:: \
prop-logic
prop-logic :: \
prop-logic.dats; \
$(PATSCC) -o $@ $<
#
regress:: prop-logic; ./$<
cleanall:: ; $(RMF) prop-logic
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
