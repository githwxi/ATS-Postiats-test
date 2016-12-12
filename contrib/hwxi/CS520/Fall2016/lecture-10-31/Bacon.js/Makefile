######
#
# A simple Makefile
#
######

PATSCC=$(PATSHOME)/bin/patscc
ATSCC2JS=$(PATSHOME)/bin/atscc2js

######

all::

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

RMF=rm -f

######

testall:: all
testall:: cleanall

######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *_dats.c

######

cleanall:: clean
cleanall:: ; $(RMF) *_dats.js

###### end of [Makefile] ######
