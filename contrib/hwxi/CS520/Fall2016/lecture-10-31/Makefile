#
# A simple Makefile
#
# ###### beg of [Makefile] ######
#
PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt
#
######

all:: \
depth-first
depth-first: \
depth-first.dats; $(PATSCC) -tcats $<

all:: \
breadth-first
breadth-first: \
breadth-first.dats; $(PATSCC) -tcats $<

######

testall:: all

######
#
testall:: ; \
make -C Bacon.js -f Makefile testall
#
######

clean:: ; rm -f *~
clean:: ; rm -f *_?ats.o
clean:: ; rm -f *_?ats.c

cleanall:: clean

# ###### end of [Makefile] ######
