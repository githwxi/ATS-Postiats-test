#
# A simple Makefile
#

######

PATSCC=patscc

######

all::
regress::
cleanall::

######

all:: mylist0_subseq
regress:: mylist0_subseq; ./$<
cleanall:: ; $(RMF) mylist0_subseq

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
