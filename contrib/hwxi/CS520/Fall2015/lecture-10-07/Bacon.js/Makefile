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
Counter_bus_dats.js
#
Counter_bus_dats.c: Counter_bus.dats; $(PATSCC) -ccats $<
Counter_bus_dats.js: Counter_bus_dats.c; $(ATSCC2JS) -o $@ -i $<
#
######
#
all:: \
Counter_poll_dats.js
#
Counter_poll_dats.c: Counter_poll.dats; $(PATSCC) -ccats $<
Counter_poll_dats.js: Counter_poll_dats.c; $(ATSCC2JS) -o $@ -i $<
#
######
#
all:: \
FibStream_dats.js
#
FibStream_dats.c: FibStream.dats; $(PATSCC) -ccats $<
FibStream_dats.js: FibStream_dats.c; $(ATSCC2JS) -o $@ -i $<
#
######
#
all:: \
FibStream2_dats.js
#
FibStream2_dats.c: FibStream2.dats; $(PATSCC) -ccats $<
FibStream2_dats.js: FibStream2_dats.c; $(ATSCC2JS) -o $@ -i $<
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
