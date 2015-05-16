######

PATSCC=$(PATSHOME)/bin/patscc

######

all:: \
factorial
factorial: \
factorial.c \
factorial.dats; $(PATSCC) -o $@ $^

######

regress:: factorial; ./$<
cleanall:: ; rm -f factorial

######

testall:: all
testall:: regress
testall:: cleanall

######

clean:: ; rm -f *~
clean:: ; rm -f *.o
clean:: ; rm -f *_?ats.c

cleanall:: clean

###### end of [Makefile] ######