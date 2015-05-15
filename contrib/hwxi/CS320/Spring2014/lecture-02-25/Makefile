#
# A simple Makefile
#
include $(PATSHOME)/share/atsmake-pre.mk
#
all:: \
exception
exception: \
  exception.dats ; \
  $(PATSCC2) -D_GNU_SOURCE $(MALLOCFLAG) -o $@ $^
#
regress:: exception; ./$<
cleanall:: ; $(RMF) exception
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
