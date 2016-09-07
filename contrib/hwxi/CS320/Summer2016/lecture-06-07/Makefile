#
# A simple Makefile
#
PATSCC=$(PATSHOME)/bin/patscc
#
all:: \
Perfect
#
Perfect: \
Perfect_dats.c; \
  $(PATSCC) -O2 \
    -D_GNU_SOURCE \
    -DATS_MEMALLOC_LIBC -o $@ $<
#
Perfect_dats.c: \
  Perfect.dats; $(PATSCC) -ccats $<
#
regress:: Perfect; ./Perfect
#
testall:: all
testall:: regress
testall:: cleanall
#
RMF= rm -f
#
clean:: ; $(RMF) *~
clean:: ; $(RMF) *_?ats.c
#
cleanall:: clean
cleanall:: ; $(RMF) Perfect
#
###### end of [Makefile] ######
