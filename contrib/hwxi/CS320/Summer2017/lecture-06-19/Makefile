######
#
# A Simple Makefile
#
######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt

######

all:: mul_list
all:: mytree_is_braun

######

regress:: mul_list; ./mul_list
regress:: mytree_is_braun; ./mytree_is_braun

######

mul_list: \
mul_list.dats; \
$(PATSCC) -D_GNU_SOURCE -DATS_MEMALLOC_LIBC -o $@ $<

mytree_is_braun: \
mytree_is_braun.dats; \
$(PATSCC) -D_GNU_SOURCE -DATS_MEMALLOC_LIBC -o $@ $<

######

testall:: all
testall:: regress
testall:: cleanall

######

clean:: ; rm -f *~
clean:: ; rm -f *_?ats.o
clean:: ; rm -f *_?ats.c

cleanall:: clean
cleanall:: ; rm -f mul_list
cleanall:: ; rm -f mytree_is_braun

###### end of [Makefile] ######
