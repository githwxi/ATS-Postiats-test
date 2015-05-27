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
fact2
fact2: \
fact2.dats ; $(PATSCC2) -o $@ $<
regress:: fact2; ./$<
cleanall:: ; $(RMF) fact2
#
all:: \
Sierpinski
Sierpinski: \
Sierpinski.dats ; $(PATSCC2) -tcats $<
#
all:: \
Sierpinski2
Sierpinski2: \
Sierpinski2.dats ; $(PATSCC2) -tcats $<
all:: \
Sierpinski2_point
Sierpinski2_point: \
Sierpinski2_point.dats ; $(PATSCC2) -tcats $<
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
