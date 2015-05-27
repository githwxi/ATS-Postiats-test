#
# A simple Makefile
#
include $(PATSHOME)/share/atsmake-pre.mk
#
include $(PATSHOME)/share/atsmake-post.mk
#
all:: \
fact
fact: \
fact.dats ; $(PATSCC2) -o $@ $<
regress:: fact; ./$<
cleanall:: ; $(RMF) fact
#
all:: \
hello
hello: \
hello.dats ; $(PATSCC2) -o $@ $<
regress:: hello; ./$<
cleanall:: ; $(RMF) hello
#
testall:: all
testall:: regress
testall:: cleanall
#
cleanats:: ; $(RMF) *~
cleanats:: ; $(RMF) *_?ats.c
#
cleanall:: cleanats
#
###### end of [Makefile] ######
