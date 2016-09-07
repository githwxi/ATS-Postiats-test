#
# A simple Makefile
#
include $(PATSHOME)/share/atsmake-pre.mk
#
include $(PATSHOME)/share/atsmake-post.mk
#
all:: \
WordCounting
#
WordCounting: \
WordCounting_dats.c; \
  $(PATSCC2) -O2 -DATS_MEMALLOC_GCBDW -o $@ $< -lgc
#
WordCounting_dats.c: WordCounting.dats; $(PATSCC2) -ccats $<
#
# regress:: WordCounting; \
# wget -qO - http://www.gutenberg.org/files/2701/2701.txt | ./WordCounting
#
cleanall:: ; $(RMF) WordCounting
#
testall:: all
testall:: cleanall
#
cleanats:: ; $(RMF) *~
cleanats:: ; $(RMF) *_?ats.c
#
cleanall:: cleanats
#
###### end of [Makefile] ######
