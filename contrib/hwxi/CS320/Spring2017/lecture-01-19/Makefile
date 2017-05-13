######

all:: fact
all:: hello

######

fact: \
fact.dats; \
patscc -o fact fact.dats
regress:: fact; ./$<

hello: \
hello.dats; \
patscc -o hello hello.dats
regress:: hello; ./$<

######

testall:: all
testall:: regress
testall:: cleanall

######

clean:: ; rm -f *~
clean:: ; rm -f *_?ats.c
cleanall:: clean
cleanall:: ; rm -f fact
cleanall:: ; rm -f hello

###### end of [Makefile] ######
