#
# A simple Makefile
#

######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt

######

all::
regress::
cleanall::

######

all:: fact
fact: fact.dats; $(PATSCC) -o $@ $<
regress:: fact; ./$<
cleanall:: ; $(RMF) fact

######

all:: hello
hello: hello.dats; $(PATSCC) -o $@ $<
regress:: hello; ./$<
cleanall:: ; $(RMF) hello

######

all:: \
sumdiv
sumdiv: \
sumdiv.dats f_mod.c ; $(PATSCC) -o $@ $^
regress:: sumdiv; ./$<
cleanall:: ; $(RMF) sumdiv

all:: \
sumdiv_loop
sumdiv_loop: sumdiv_loop.c ; $(PATSCC) -o $@ $^
regress:: sumdiv_loop; ./$<
cleanall:: ; $(RMF) sumdiv_loop

######

all:: \
Sierpinski
Sierpinski: \
Sierpinski.dats; $(PATSCC) -tcats -o $@ $<

######

testall:: all
testall:: regress
testall:: cleanall

######

RMF=rm -f

######

clean:: ; rm -f *~
clean:: ; rm -f *_?ats.c
clean:: ; rm -f *_?ats.o

######

cleanall:: clean

###### end of [Makefile] ######
