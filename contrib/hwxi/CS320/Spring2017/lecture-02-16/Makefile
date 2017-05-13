#######
#
# For lecture-01-26
#
#######

PATSCC=\
$(PATSHOME)/bin/patscc
PATSOPT=\
$(PATSHOME)/bin/patsopt

#######

all::

#######

all:: \
list0_exists
list0_exists: \
list0_exists.dats; $(PATSCC) -tcats $<

#######

all:: \
list0_forall
list0_forall: \
list0_forall.dats; $(PATSCC) -tcats $<

#######

all:: \
list0_find_opt
list0_find_opt: \
list0_find_opt.dats; $(PATSCC) -tcats $<

#######

all:: \
list0_mult_exn
list0_mult_exn: \
list0_mult_exn.dats; $(PATSCC) -tcats $<

#######

testall:: all

#######

clean:: ; rm -f *~
clean:: ; rm -f *_dats.c
clean:: ; rm -f *_dats.o

#######

cleanall:: clean

###### end of [Makefile] ######
