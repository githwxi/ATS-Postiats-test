######
#
# A Simple Makefile
#
######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt

######

all:: hello
hello: hello.dats; $(PATSCC) -o $@ hello.dats

######

regress:: hello; ./hello

######

testall:: all
testall:: regress
testall:: cleanall

######

clean:: ; rm -f *~
clean:: ; rm -f *_?ats.o
clean:: ; rm -f *_?ats.c

cleanall:: clean
cleanall:: ; rm -f hello

###### end of [Makefile] ######
