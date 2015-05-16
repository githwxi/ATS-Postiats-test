#
# A simple Makefile
#

#######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt

######

CFLAGS=-DATS_MEMALLOC_LIBC -D_GNU_SOURCE
LDFLAGS=-L$(PATSHOME)/ccomp/atslib/lib -latslib

######
#
all:: \
dungeon
dungeon: \
dungeon_sats.c \
dungeon_dats.c ; $(PATSCC) $(CFLAGS) -o $@ $^ $(LDFLAGS)
#
cleanall:: ; rm -f dungeon
#
######

dungeon_sats.c: dungeon.sats; $(PATSCC) -ccats $<
dungeon_dats.c: dungeon.dats; $(PATSCC) -ccats $<

######

testall:: all
testall:: cleanall

######

clean:: ; rm -f *~
clean:: ; rm -f *_?ats.o
clean:: ; rm -f *_?ats.c

######

cleanall:: clean

###### end of [Makefile] ######