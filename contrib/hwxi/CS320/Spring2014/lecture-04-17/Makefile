#
# A simple Makefile
#
include $(PATSHOME)/share/atsmake-pre.mk
#
all::\
tally
tally: \
tally.dats ; \
  $(PATSCC2) $(MALLOCFLAG) -o $@ $^ $(LDFLAGS)
regress:: tally; ./$<
cleanall:: ; $(RMF) tally
#
include $(PATSHOME)/share/atsmake-post.mk
#
testall:: all
testall:: regress
testall:: cleanall
#
cleanall:: ; $(RMF) tally_?ats.c
#
###### end of [Makefile] ######
