#
# A simple Makefile
#

######

PATSCC=$(PATSHOME)/bin/patscc

######

all:: \
word-connecting
word-connecting: \
  word-connecting.dats \
  word-connecting-wordmap_dats.o ; \
  $(PATSCC) -DATS_MEMALLOC_LIBC -o $@ $^
cleanall:: ; rm -f word-connecting

######

%_dats.o: %.dats ; $(PATSCC) -c -o $@ $<

######

testall:: all
testall:: cleanall

######

clean:: ; rm -f *~
clean:: ; rm -f *_?ats.c
clean:: ; rm -f *_?ats.o

######

cleanall:: clean

####### end of [Makefile] ######
