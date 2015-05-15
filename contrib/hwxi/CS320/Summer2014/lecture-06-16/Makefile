#
# A simple Makefile
#

######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt
PATSLIB=$(PATSHOME)/ccomp/atslib/lib

######

all::
regress::
cleanall::

######

all:: fibStream
regress:: fibStream; ./$<
cleanall:: ; $(RMF) fibStream

all:: sleepStream
# regress:: sleepStream; ./$<
cleanall:: ; $(RMF) sleepStream

all:: strokeStream
# regress:: strokeStream; ./$<
cleanall:: ; $(RMF) strokeStream

######
#
%: %.dats ; \
$(PATSCC) -D_GNU_SOURCE \
  -DATS_MEMALLOC_LIBC -O2 -o $@ $< -L$(PATSLIB) -latslib
#
#######

testall:: all
testall:: regress
testall:: cleanall

######

RMF=rm -f

######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *_?ats.c
clean:: ; $(RMF) *_?ats.o

######

cleanall:: clean

####### end of [Makefile] ######
