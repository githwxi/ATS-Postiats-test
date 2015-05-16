#
# A simple Makefile
#

######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt

######

all:: hello
hello: hello.dats ; $(PATSCC) -o $@ $<
regress:: hello; ./$<
cleanall:: ; rm -f hello

all:: fact
cleanall:: ; rm -f fact
regress:: fact; ./$<
fact: fact.dats ; $(PATSCC) -o $@ $<

all:: loop
loop: loop.dats ; $(PATSCC) -o $@ $<
regress:: loop; ./$<
cleanall:: ; rm -f loop

######

testall:: all
testall:: regress
testall:: cleanall

######

clean:: ; rm -f *~
clean:: ; rm -f *_?ats.o
clean:: ; rm -f *_?ats.c

######

cleanall:: clean

###### end of [Makefile] ######
