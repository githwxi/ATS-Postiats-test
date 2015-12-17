#
# For lecture-09-30
#

######
#
PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt
#
PATSOLVE=$(PATSHOME)/bin/patsolve_z3
#
######

all:: fact

######

all:: word_count
regress:: word_count; $(CAT) ./word_count.dats | ./$< 
cleanall:: ; $(RMF) word_count

######

fact: ; $(PATSCC) -tcats fact.dats

######

fact2:: \
fact2.dats; \
$(PATSOPT) -tc --constraint-export -d $< | $(PATSOLVE) -i

######
#
word_count: \
word_count.dats \
word_count_mylib.dats \
theGetter_sats.o ; \
$(PATSCC) -D_GNU_SOURCE -DATS_MEMALLOC_LIBC -O2 -o $@ $^
#
theGetter_sats.o: ; \
  $(PATSCC) -c -o $@ $(PATSHOME)/libats/SATS/theGetters.sats
#
######

CAT=cat
RMF=rm -f

######

testall:: all
testall:: regress
testall:: cleanall

######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *_?ats.c
clean:: ; $(RMF) *_?ats.o

cleanall:: clean

###### end of [Makefile] ######
