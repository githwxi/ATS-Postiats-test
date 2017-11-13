######
#
# A Simple Makefile
#
######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt

######

all:: \
matmul
matmul: \
matmul.dats; \
$(PATSCC) -tcats matmul.dats

######

regress::

######

testall:: all
testall:: regress
testall:: cleanall

######

clean:: ; rm -f *~

######

cleanall:: clean

###### end of [Makefile] ######
