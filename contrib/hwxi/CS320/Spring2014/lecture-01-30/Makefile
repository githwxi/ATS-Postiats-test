#
# A simple Makefile
#
include $(PATSHOME)/share/atsmake-pre.mk
#
SOURCES_SATS += intarray.sats
SOURCES_DATS += intarray.dats
SOURCES_DATS += intarray_util.dats
SOURCES_DATS += intarray_sort.dats
#
SOURCES_SATS += intarray2.sats
SOURCES_DATS += intarray2.dats
SOURCES_DATS += intarray2_util.dats
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
include $(PATSHOME)/share/atsmake-post.mk
#
testall:: all
testall:: regress
testall:: cleanall
#
cleanall:: ; $(RMF) *_?ats.c
#
###### end of [Makefile] ######
