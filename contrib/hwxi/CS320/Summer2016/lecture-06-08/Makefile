#
# A simple Makefile
#
PATSCC=$(PATSHOME)/bin/patscc
#
all:: \
stream
stream: \
stream_dats.c; \
  $(PATSCC) -O2 \
    -D_GNU_SOURCE \
    -DATS_MEMALLOC_LIBC -o $@ $<
#
stream_dats.c: \
  stream.dats; $(PATSCC) -ccats $<
#
regress:: stream; ./stream
#
all:: \
mystream
mystream: \
mystream_dats.c; \
  $(PATSCC) -O2 \
    -D_GNU_SOURCE \
    -DATS_MEMALLOC_LIBC -o $@ $<
#
mystream_dats.c: \
  mystream.dats; $(PATSCC) -ccats $<
#
regress:: mystream; ./mystream
#
all:: \
intrange
#
intrange: \
intrange_dats.c; \
  $(PATSCC) -O2 \
    -D_GNU_SOURCE \
    -DATS_MEMALLOC_LIBC -o $@ $<
#
intrange_dats.c: \
  intrange.dats; $(PATSCC) -ccats $<
#
regress:: intrange; ./intrange
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
cleanall:: ; $(RMF) stream
cleanall:: ; $(RMF) mystream
cleanall:: ; $(RMF) intrange
#
###### end of [Makefile] ######
