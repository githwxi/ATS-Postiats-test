#
# A simple Makefile
#
include $(PATSHOME)/share/atsmake-pre.mk
#
all:: intlist
intlist: intlist.dats ; $(PATSCC2) -tcats $@ $<
all:: intlist2
intlist2: intlist2.dats ; $(PATSCC2) -tcats $@ $<
all:: inttree
inttree: inttree.dats ; $(PATSCC2) -tcats $@ $<
#
all:: \
quicksort
quicksort: \
quicksort.dats ; $(PATSCC2) $(MALLOCFLAG) -o $@ $^
regress:: quicksort; ./$<
cleanall:: ; $(RMF) quicksort
#
include $(PATSHOME)/share/atsmake-post.mk
#
testall:: all
testall:: regress
testall:: cleanall
#
cleanall:: ; $(RMF) *_?ats.c
#
###### end of [Makefile] ######
