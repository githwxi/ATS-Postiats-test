######
#
# Cleaning Makefile
#
######

NPM=npm

######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt
PATSLIB=$(PATSHOME)/ccomp/atslib

######

all:: paths_dats
regress:: paths_dats; ./$<
cleanall:: ; rm -f paths_dats

######

testall:: npm-install
testall:: all regress cleanall

######

%_dats: \
%.dats; \
$(PATSCC) -O2 \
-I./node_modules \
-DATS_MEMALLOC_GCBDW -o $@ $< -latslib -lgmp -lgc

######

clean:: ; rm -f *~
clean:: ; rm -f *_?ats.o
clean:: ; rm -f *_?ats.c

cleanall:: clean
cleanall:: ; rm -rf node_modules
cleanall:: ; rm -f package-lock.json

######

npm-update:: ; $(NPM) update
npm-install:: ; $(NPM) install

###### end of [Makefile] ######
