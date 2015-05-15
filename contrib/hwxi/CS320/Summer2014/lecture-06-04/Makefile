#
# A simple Makefile
#

######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt

######

all::
regress::
cleanall::

######

all:: bstree
regress:: bstree; ./$<
cleanall:: ; $(RMF) bstree

######

all:: option
regress:: option; ./$<
cleanall:: ; $(RMF) option

######

all:: counter
regress:: counter; ./$<
cleanall:: ; $(RMF) counter

######

all:: factref
regress:: factref; ./$<
cleanall:: ; $(RMF) factref

######

######
#
# This rule is for compiling single-file programs
#
%: %.dats ; $(PATSCC) -O2 -D_GNU_SOURCE -DATS_MEMALLOC_LIBC -o $@ $<
#
######

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

######	end of [Makefile] ######
