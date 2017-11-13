######
#
# A simple Makefile
#
######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt

######

all::

######

all:: \
mutrec
mutrec: \
mutrec.dats; \
myatscc mutrec.dats
regress:: mutrec; ./mutrec_dats

all:: \
mylist
mylist: \
mylist.dats; \
myatscc mylist.dats
regress:: mylist; ./mylist_dats

all:: \
for_loop
for_loop: \
for_loop.dats; \
myatscc for_loop.dats
regress:: for_loop; ./for_loop_dats

######

testall:: all
testall:: regress
testall:: cleanall

######

clean:: ; rm -f *~
clean:: ; rm -f *_?ats.c

######

cleanall:: clean
cleanall:: ; rm -f mutrec_dats
cleanall:: ; rm -f mylist_dats
cleanall:: ; rm -f for_loop_dats

###### end of [Makefile] ######
