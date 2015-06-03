#
# PATSHOME is already available
#

######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt
PATSLIB=$(PATSHOME)/ccomp/atslib/lib

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
quiz-by-aren
quiz-by-aren: \
quiz-by-aren.dats; \
$(PATSCC) -DATS_MEMALLOC_LIBC -o $@ $<
regress:: quiz-by-aren; ./quiz-by-aren
cleanall:: ; rm -f quiz-by-aren

######

all:: \
quiz-by-hwxi
quiz-by-hwxi: \
quiz-by-hwxi.dats; \
$(PATSCC) -DATS_MEMALLOC_LIBC -o $@ $<
regress:: quiz-by-hwxi; ./quiz-by-hwxi
cleanall:: ; rm -f quiz-by-hwxi

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
