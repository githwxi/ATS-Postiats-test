#
# A simple Makefile
#

######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt

######

all:: intlst
intlst: intlst.dats ; \
$(PATSCC) -DATS_MEMALLOC_LIBC -o $@ $<
regress:: intlst; ./$<
cleanall:: ; rm -f intlst

######

testall:: all
testall:: regress
testall:: cleanall

######

clean:: ; rm -f *~
clean:: ; rm -f *_?ats.o
clean:: ; rm -f *_?ats.c

######

cleanall:: clean

###### end of [Makefile] ######
