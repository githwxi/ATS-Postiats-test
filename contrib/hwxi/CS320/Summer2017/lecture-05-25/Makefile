######
#
# A Simple Makefile
#
######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt

######

all:: tuple
all:: fibonacci
all:: Sierpinski

######

regress:: tuple; ./tuple
regress:: fibonacci; ./fibonacci

######
#
tuple: \
tuple.dats; \
$(PATSCC) -DATS_MEMALLOC_LIBC -o $@ $<
#
fibonacci: fibonacci.dats; $(PATSCC) -o $@ $<
#
Sierpinski: Sierpinski.dats; $(PATSCC) -tcats $@
#
######

testall:: all
testall:: regress
testall:: cleanall

######

clean:: ; rm -f *~
clean:: ; rm -f *_?ats.o
clean:: ; rm -f *_?ats.c

cleanall:: clean
cleanall:: ; rm -f tuple fibonacci

###### end of [Makefile] ######
