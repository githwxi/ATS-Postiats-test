#
# For lecture-09-02
#

######

%: %.dats; patscc -o $@ $<

######

all:: fact
regress:: fact; ./fact
cleanall:: ; $(RMF) fact

all:: hello
regress:: hello; ./hello
cleanall:: ; $(RMF) hello

######

RMF=rm -f

######

testall:: all
testall:: regress
testall:: cleanall

######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *_?ats.c

cleanall:: clean

###### end of [Makefile] ######
