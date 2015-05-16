######

PATSCC=$(PATSHOME)/bin/patscc

######

CFLAGS=-O2
MALLOCFLAG=-DATS_MEMALLOC_LIBC

######

RMF=rm -f

######

all:: \
yield3
yield3: \
yield3.dats ; $(PATSCC) -o $@ $<
regress:: yield3; ./$<
cleanall:: ; $(RMF) yield3

######

all:: \
wordcnt2
wordcnt2: \
wordcnt2.dats ; \
$(PATSCC) $(MALLOCFLAG) $(CFLAGS) -o $@ $<
regress:: wordcnt2 ; ./$< < wordcnt2.dats > /dev/null
cleanall:: ; $(RMF) wordcnt2

######

testall:: all
testall:: regress
testall:: cleanall

######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *_?ats.o
clean:: ; $(RMF) *_?ats.c

######

cleanall:: clean

###### end of [Makefile] ######
