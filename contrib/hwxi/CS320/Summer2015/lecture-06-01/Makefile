#
# PATSHOME is already available
#

######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt
PATSLIB=$(PATSHOME)/ccomp/atslib/lib

######

all:: \
option
option: \
option.dats; \
$(PATSCC) -DATS_MEMALLOC_LIBC -o $@ $<
regress:: option; ./option
cleanall:: ; rm -f option

######

all:: \
string
string: \
string.dats; \
$(PATSCC) -DATS_MEMALLOC_LIBC -o $@ $<
regress:: string; ./string
cleanall:: ; rm -f string

######

all:: \
filebas
filebas: \
filebas.dats; \
$(PATSCC) -DATS_MEMALLOC_LIBC -o $@ $< -L$(PATSLIB) -latslib
regress:: filebas; cat filebas.dats | ./filebas
cleanall:: ; rm -f filebas

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
