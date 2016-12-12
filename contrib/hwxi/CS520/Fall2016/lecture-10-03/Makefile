#
# For lecture-09-14
#

######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt

######
#
all:: \
deptype
deptype :: \
deptype.dats; \
$(PATSCC) -o $@ $<
#
regress:: deptype; ./$<
cleanall:: ; $(RMF) deptype
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
