#
# A simple Makefile
#

######

MAKE=make

######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt
PATSLIB=$(PATSHOME)/ccomp/atslib/lib

######

all::
regress::
cleanall::

######
#
all:: list
regress:: list; ./$<
cleanall:: ; $(RMF) list
#
######
#
%: %.dats ; \
$(PATSCC) -D_GNU_SOURCE -DATS_MEMALLOC_LIBC -O2 -o $@ $<
#
#######
#
testall:: all
testall:: regress
testall:: cleanall
#
#######

RMF=rm -f

#######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *_?ats.c
clean:: ; $(RMF) *_?ats.o

#######

cleanall:: clean

####### end of [Makefile] ######
