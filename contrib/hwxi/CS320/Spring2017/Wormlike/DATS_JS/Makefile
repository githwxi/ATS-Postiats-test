######
#
# A simple Makefile
#
######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt
ATSCC2JS=$(PATSHOME)/bin/atscc2js

######
#
export \
PATSHOMELOCS=\
./node_modules:./../../node_modules
#
######

all::

######
#
all:: \
main_dats.js
main_dats.js: main.dats \
theWorm.dats theBoard.dats theControl.dats; \
$(PATSCC) -ccats $<; $(ATSCC2JS) -o $@ -i main_dats.c
#
######
#
all:: \
theCounter3_baconjs_dats.js
theCounter3_baconjs_dats.js: \
theCounter3_baconjs.dats ; \
$(PATSCC) -ccats $<; $(ATSCC2JS) -o $@ -i theCounter3_baconjs_dats.c
#
######

clean:: ; rm -f *~
clean:: ; rm -f *_?ats.c

######

cleanall:: clean
cleanall:: ; rm -f *_?ats.js

###### end of [Makefile] ######
