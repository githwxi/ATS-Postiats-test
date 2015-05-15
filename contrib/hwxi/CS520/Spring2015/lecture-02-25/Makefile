#
# A simple Makefile
#

######

PHP=php

######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt
ATSCC2JS=$(PATSHOME)/bin/atscc2js

######

all::

######

all:: \
light-demo.js
light-demo.js: light-demo_dats.c; $(ATSCC2JS) -o $@ -i $<
light-demo_dats.c: light-demo.dats; $(PATSOPT) -o $@ -d $<

######

testall:: all
testall:: cleanall

######

RMF=rm -f

######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *_?ats.c

######

cleanall:: clean
cleanall:: ; $(RMF) light-demo.js

######

###### end of [Makefile] ######
