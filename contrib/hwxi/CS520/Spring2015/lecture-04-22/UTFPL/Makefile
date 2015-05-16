#
# A simple Makefile 
#

######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt

######

all:: \
utfpl
utfpl: \
utfpl.sats \
utfpl.dats \
utfpl_var.dats \
utfpl_cst.dats \
utfpl_term.dats \
utfpl_value.dats \
utfpl_comp.dats \
utfpl_eval.dats \
utfpl_mylib.dats \
utfpl_mytest.dats ; \
$(PATSCC) -DATS_MEMALLOC_LIBC -o $@ $^
#
regress:: \
utfpl; ./$< > /dev/null
#
cleanall:: ; rm -f utfpl
#
######

testall:: all
testall:: regress
testall:: cleanall

######

clean:: ; rm -f *~
clean:: ; rm -f *_?ats.c
clean:: ; rm -f *_?ats.o

######

cleanall:: clean

###### end of [Makefile] ######
