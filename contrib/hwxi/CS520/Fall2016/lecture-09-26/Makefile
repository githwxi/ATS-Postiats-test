#
# For lecture-09-14
#

######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt

######
#
all:: \
mystream
mystream :: \
mystream.dats; \
$(PATSCC) -DATS_MEMALLOC_LIBC -o $@ $<
#
regress:: mystream; ./$<
cleanall:: ; $(RMF) mystream
#
######
#
all:: \
mystream_vt
mystream_vt :: \
mystream_vt.dats; \
$(PATSCC) -DATS_MEMALLOC_LIBC -o $@ $<
#
regress:: mystream_vt; ./$<
cleanall:: ; $(RMF) mystream_vt
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

cleanall:: clean

###### end of [Makefile] ######
