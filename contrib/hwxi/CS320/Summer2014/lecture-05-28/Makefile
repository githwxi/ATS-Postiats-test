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

all:: mylist0_3
regress:: mylist0_3; ./$<
cleanall:: ; $(RMF) mylist0_3

all:: higher-order
regress:: higher-order; ./$<
cleanall:: ; $(RMF) higher-order

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
