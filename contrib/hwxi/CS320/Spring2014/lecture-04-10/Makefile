#
# A simple Makefile
#
include $(PATSHOME)/share/atsmake-pre.mk
#
all::\
coinchange
coinchange: \
coinchange.dats ; \
  $(PATSCC2) $(MALLOCFLAG) -o $@ $^ $(LDFLAGS)
regress:: coinchange; ./$<
cleanall:: ; $(RMF) coinchange
#
all::\
montecarlo
montecarlo: \
montecarlo.dats ; \
  $(PATSCC2) $(MALLOCFLAG) -o $@ $^ $(LDFLAGS) -lm
regress:: montecarlo; ./$<
cleanall:: ; $(RMF) montecarlo
#
include $(PATSHOME)/share/atsmake-post.mk
#
testall:: all
testall:: regress
testall:: cleanall
#
cleanall:: ; $(RMF) coinchange_?ats.c
cleanall:: ; $(RMF) montecarlo_?ats.c
#
###### end of [Makefile] ######
