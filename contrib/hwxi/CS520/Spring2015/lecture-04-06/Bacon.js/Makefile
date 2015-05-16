######
#
# A simple Makefile
#
######

PATSCC=$(PATSHOME)/bin/patscc
ATSCC2JS=$(PATSHOME)/bin/atscc2js

######
#
all:: \
Counter_dats.js
#
Counter_dats.c: Counter.dats; $(PATSCC) -ccats $<
Counter_dats.js: Counter_dats.c; $(ATSCC2JS) -o $@ -i $<
#
######
#
all:: \
Counter2_dats.js
#
Counter2_dats.c: Counter2.dats; $(PATSCC) -ccats $<
Counter2_dats.js: Counter2_dats.c; $(ATSCC2JS) -o $@ -i $<
#
######
#
all:: \
KeyCode_dats.js
#
KeyCode_dats.c: KeyCode.dats; $(PATSCC) -ccats $<
KeyCode_dats.js: KeyCode_dats.c; $(ATSCC2JS) -o $@ -i $<
#
######

testall:: all
testall:: cleanall

######

RMF=rm -f

######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *_dats.c

######

cleanall:: clean
cleanall:: ; $(RMF) *_dats.js

###### end of [Makefile] ######
