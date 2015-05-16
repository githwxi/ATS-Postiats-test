######

PATSCC=$(PATSHOME)/bin/patscc

######

CFLAGS=-O2
MALLOCFLAG=-DATS_MEMALLOC_LIBC

######

MAKE=make

######

RMF=rm -f

######

all:: \
wordcnt3
wordcnt3: \
wordcnt3.dats ; \
$(PATSCC) -D_GNU_SOURCE $(MALLOCFLAG) $(CFLAGS) -o $@ $<
regress:: wordcnt3 ; ./$< < wordcnt3.dats > /dev/null
cleanall:: ; $(RMF) wordcnt3

######

testall:: all
testall:: regress
testall:: cleanall
testall:: ; $(MAKE) -C DiningPhil testall

######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *_?ats.o
clean:: ; $(RMF) *_?ats.c

######

cleanall:: clean

###### end of [Makefile] ######
