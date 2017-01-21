#
# A simple Makefile
#
include \
$(PATSHOME)/share/atsmake-pre.mk
#
include \
$(PATSHOME)/share/atsmake-post.mk
#
SOURCES_SATS += intlist.sats
SOURCES_DATS += intlist.dats
SOURCES_DATS += intlist_util.dats
SOURCES_DATS += intlist_sort.dats
SOURCES_DATS += intlist_sort2.dats
#
all:: test
#
test: test.dats \
  $(SOURCES_SATS) \
  $(SOURCES_DATS) ; \
  $(PATSCC2) $(MALLOCFLAG) -o $@ $^
#
regress:: test; ./$<
cleanall:: ; $(RMF) test
#
testall:: all
testall:: regress
testall:: cleanall
#
cleanall:: ; $(RMF) *_?ats.c
#
###### end of [Makefile] ######
