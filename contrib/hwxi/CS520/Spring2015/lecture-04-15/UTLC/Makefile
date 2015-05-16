#
# A simple Makefile 
#

######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt

######

all:: \
utlc
utlc: \
utlc.dats \
utlc_var.dats \
utlc_term.dats \
utlc_eval.dats \
utlc_test.dats; \
$(PATSCC) -DATS_MEMALLOC_LIBC -o $@ $^

######

all:: \
utlc_all
utlc_all: \
utlc_all.dats; \
$(PATSCC) -DATS_MEMALLOC_LIBC -o $@ $<

######
#
regress:: utlc; ./utlc > /dev/null
regress:: utlc_all; ./utlc_all > /dev/null
#
cleanall:: ; rm -f utlc
cleanall:: ; rm -f utlc_all
#
######

testall:: all
testall:: regress
testall:: cleanall

######

clean:: ; rm -f *~
clean:: ; rm -f *_?ats.c
clean:: ; rm -f *_?ats.o

cleanall:: clean

###### end of [Makefile] ######
