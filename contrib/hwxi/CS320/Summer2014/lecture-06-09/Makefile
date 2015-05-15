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

all:: list0_cross
regress:: list0_cross; ./$<
cleanall:: ; $(RMF) list0_cross

######

all:: array0_sum
regress:: array0_sum; ./$<
cleanall:: ; $(RMF) array0_sum

all:: array0_sum2
regress:: array0_sum2; ./$<
cleanall:: ; $(RMF) array0_sum2

######

all:: array0_insort
regress:: array0_insort; ./$<
cleanall:: ; $(RMF) array0_insort

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
