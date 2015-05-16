######
#
# A simple Makefile
#
######

PATSCC=$(PATSHOME)/bin/patscc
ATSCC2JS=$(PATSHOME)/bin/atscc2js

######
#
all:: \
game_dats.js
#
game_dats.c: \
game.sats game.dats; $(PATSCC) -ccats game.dats
game_dats.js: game_dats.c; $(ATSCC2JS) -o $@ -i $<
#
cleanall:: ; $(RMF) *_dats.js
#
######

testall:: all
testall:: cleanall

######

RMF=rm -f

######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *_dats.c

######

cleanall:: clean

###### end of [Makefile] ######
