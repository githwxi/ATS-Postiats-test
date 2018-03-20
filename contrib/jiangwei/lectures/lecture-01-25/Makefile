######
#
# A simple Makefile
#
######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt

######

MYATSCC=$(PATSHOME)/bin/myatscc

######

expr_dats: \
expr.dats; $(PATSCC) -DATS_MEMALLOC_LIBC -o $@ $<

######

clean:: ; rm -f *~
clean:: ; rm -f *_?ats.c
clean:: ; rm -f *_?ats.o

cleanall:: clean
cleanall:: ; rm -f expr_dats

###### end of [Makefile] ######
