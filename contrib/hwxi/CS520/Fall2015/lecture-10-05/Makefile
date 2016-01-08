#
# For lecture-10-05
#

######
#
PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt
#
PATSOLVE=$(PATSHOME)/bin/patsolve_z3
#
######

all:: fibats
regress:: fibats; ./fibats
cleanall:: ; $(RMF) fibats

######

all:: mystream
regress:: mystream; ./mystream
cleanall:: ; $(RMF) mystream

######

all:: word_count
regress:: \
word_count; \
cat word_count.dats | ./word_count
cleanall:: ; $(RMF) word_count

######
#
fibats: \
fibats.dats ; $(PATSCC) -O2 -o $@ $<
#
mystream: \
mystream.dats ; \
$(PATSCC) -DATS_MEMALLOC_LIBC -O2 -o $@ $<
#
######
#
word_count: \
word_count.dats ; \
$(PATSCC) -D_GNU_SOURCE -DATS_MEMALLOC_LIBC -O2 -o $@ $<
#
######

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
