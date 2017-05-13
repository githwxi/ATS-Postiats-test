#######
#
# For lecture-01-26
#
#######

PATSCC=\
$(PATSHOME)/bin/patscc
PATSOPT=\
$(PATSHOME)/bin/patsopt

#######

all::

#######

all:: \
mystream
mystream: \
mystream.dats; $(PATSCC) -tcats $<

#######

testall:: all

#######

clean:: ; rm -f *~
clean:: ; rm -f *_dats.c
clean:: ; rm -f *_dats.o

#######

cleanall:: clean

###### end of [Makefile] ######
