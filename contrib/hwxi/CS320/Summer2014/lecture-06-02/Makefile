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

all:: closure
regress:: closure; ./$<
cleanall:: ; $(RMF) closure

######

all:: mywhich
regress:: mywhich; ./$<
cleanall:: ; $(RMF) mywhich

######

all:: mergesort
regress:: mergesort; ./$<
cleanall:: ; $(RMF) mergesort

all:: \
mergesort_blueprint
regress:: mergesort_blueprint; ./$<
cleanall:: ; $(RMF) mergesort_blueprint

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
