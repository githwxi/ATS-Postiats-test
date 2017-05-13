######

all:: fact
all:: fact2

######

fact: \
fact.dats; \
patscc -o fact fact.dats
regress:: fact; ./$<

fact2: \
fact2.dats; \
patscc -o fact2 fact2.dats
regress:: fact2; ./$<

######

testall:: all
testall:: regress
testall:: cleanall

######

clean:: ; rm -f *~
clean:: ; rm -f *_?ats.c
cleanall:: clean
cleanall:: ; rm -f fact
cleanall:: ; rm -f fact2

###### end of [Makefile] ######
