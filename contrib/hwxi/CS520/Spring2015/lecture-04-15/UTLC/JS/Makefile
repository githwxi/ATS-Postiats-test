#
# A simple Makefile 
#

######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt

######

ATSCC2JS=$(PATSHOME)/bin/atscc2js

######
#
all:: \
utlc_all_dats.js
#
utlc_all_dats.c: utlc_all.dats; $(PATSCC) -ccats $<
utlc_all_dats.js: utlc_all_dats.c; $(ATSCC2JS) -o $@ -i $<
#
######

testall:: all
testall:: cleanall

######

clean:: ; rm -f *~
clean:: ; rm -f *_?ats.c
clean:: ; rm -f *_?ats.o

cleanall:: clean
cleanall:: ; rm -f utlc_all_dats.js

###### end of [Makefile] ######
