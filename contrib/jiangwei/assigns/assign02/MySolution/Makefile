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

assign02_sol_dats: \
assign02_sol.dats; $(PATSCC) -DATS_MEMALLOC_LIBC -o $@ $<
assign02_dats: \
assign02.dats; $(PATSCC) -DATS_MEMALLOC_LIBC -o $@ $<

######

clean:: ; rm -f *~
clean:: ; rm -f *_?ats.c
clean:: ; rm -f *_?ats.o

cleanall:: clean
cleanall:: ; rm -f assign02_sol_dats
cleanall:: ; rm -f assign02_dats
###### end of [Makefile] ######
