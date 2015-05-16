######
#
# A simple Makefile
#
######

PATSCC=$(PATSHOME)/bin/patscc

######
#
all:: utlc
#
utlc: \
utlc_dats.c; \
$(PATSCC) -DATS_MEMALLOC_LIBC -o $@ $<
#
utlc_dats.c: utlc.dats; $(PATSCC) -ccats $<
#
regress:: \
utlc;./utlc > /dev/null
#
cleanall:: ; $(RMF) utlc
#
######

testall:: all
testall:: regress
testall:: cleanall

######

RMF=rm -f

######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *_dats.c

######

cleanall:: clean
cleanall:: ; $(RMF) utlc

###### end of [Makefile] ######
