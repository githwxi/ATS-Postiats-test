######

PATSCC=$(PATSHOME)/bin/patscc

######

all::

######

all:: \
kfact
kfact: \
kfact.dats; \
$(PATSCC) -DATS_MEMALLOC_LIBC -o $@ $<
regress:: kfact; ./$<
cleanall:: ; rm -f kfact

######

all:: \
mergesort
mergesort: \
mergesort.dats; \
$(PATSCC) -DATS_MEMALLOC_LIBC -o $@ $<
regress:: mergesort; ./$<
cleanall:: ; rm -f mergesort

######

# all:: \
# mergesort-p
# mergesort-p: \
# mergesort-p.dats; \
# $(PATSCC) -D_GNU_SOURCE -DATS_MEMALLOC_LIBC -o $@ $< -lpthread
# regress:: mergesort-p; ./$<
# cleanall:: ; rm -f mergesort-p

######

testall:: all
testall:: regress
testall:: cleanall

######

clean:: ; rm -f *~ *_?ats.o *_?ats.c

######

cleanall:: clean

###### end of [Makefile] ######
