######
#
# A simple Makefile
#
######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt
ATSCC2JS=$(PATSHOME)/bin/atscc2js

######

all::

######
#
all:: \
theCounter3_baconjs_dats.js
theCounter3_baconjs_dats.js: \
theCounter3_baconjs.dats \
theShow_update.dats theStateStream.dats; \
$(PATSCC) -ccats $<; $(ATSCC2JS) -o $@ -i theCounter3_baconjs_dats.c
#
######

clean:: ; rm -f *~
clean:: ; rm -f *_?ats.c

######

cleanall:: clean
cleanall:: ; rm -f *_?ats.js

###### end of [Makefile] ######
