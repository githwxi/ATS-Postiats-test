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

assign01_sol_dats: \
assign01_sol.dats; $(PATSCC) -DATS_MEMALLOC_LIBC -o $@ $<
assign01_dats: \
assign01.dats; $(PATSCC) -DATS_MEMALLOC_LIBC -o $@ $<

######

clean:: ; rm -f *~
clean:: ; rm -f *_?ats.c
clean:: ; rm -f *_?ats.o

cleanall:: clean
cleanall:: ; rm -f assign01_sol_dats
cleanall:: ; rm -f assign01_dats
###### end of [Makefile] ######
