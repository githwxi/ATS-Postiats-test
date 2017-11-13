######
#
# A Simple Makefile
#
######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt
ATSCC2JS=$(PATSHOME)/bin/atscc2js

######

all:: mystream_dats.js

######

mystream_dats.js: mystream.dats; $(PATSOPT) -d $< | $(ATSCC2JS) -i - > $@

######

regress::

######

testall:: all
testall:: regress
testall:: cleanall

######

clean:: ; rm -f *~
clean:: ; rm -f *_?ats.o
clean:: ; rm -f *_?ats.c

cleanall:: clean
cleanall:: ; rm -f mystream_dats.js

###### end of [Makefile] ######
