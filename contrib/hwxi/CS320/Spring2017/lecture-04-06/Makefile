#
# A simple Makefile
#

######

NPM=npm

######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt
PATSLIB=$(PATSHOME)/ccomp/atslib/lib

######

PATSCC2=\
$(PATSCC) -O2 \
-D_GNU_SOURCE -DATS_MEMALLOC_LIBC

######
#
export \
PATSHOMELOCS=\
./node_modules:./../../node_modules
#
######

all::
regress::
cleanall::

######
#
npm-install:: ; \
$(NPM) i atscntrb-bucs320-graphsearch
#
######
#
all:: \
triangles
triangles: \
triangles.dats; $(PATSCC2) -o $@ $<
#
######

#
all:: \
stream_getdup
stream_getdup: \
stream_getdup.dats; $(PATSCC2) -o $@ $<
#
######

testall:: all
testall:: cleanall
testall:: ; make -C Ramanujan/DATS_JS testall

######

RMF=rm -f

######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *_?ats.c

######
#
cleanall:: clean
cleanall:: ; rm -f triangles
cleanall:: ; rm -f stream_getdup
#
# cleanall:: ; $(RMF) -r node_modules
#
######

###### end of [Makefile] ######
