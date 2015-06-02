#
# PATSHOME is already available
#

######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt

######

all:: \
listfuns
listfuns: \
listfuns.dats; \
$(PATSCC) -DATS_MEMALLOC_LIBC -o $@ $<
regress:: listfuns; ./listfuns
cleanall:: ; rm -f listfuns

######

all:: \
listfuns2
listfuns2: \
listfuns2.dats; \
$(PATSCC) -DATS_MEMALLOC_LIBC -o $@ $<
regress:: listfuns2; ./listfuns2
cleanall:: ; rm -f listfuns2

######

testall:: all
testall:: regress
testall:: cleanall

######

clean:: ; rm -f *~
clean:: ; rm -f *_?ats.o
clean:: ; rm -f *_?ats.c

cleanall:: clean

###### end of [Makefile] ######
