#
# A simple Makefile
#
include $(PATSHOME)/share/atsmake-pre.mk
#
all::\
Pi.exe
Pi.exe: \
Pi.dats \
EulerTrans_dats.c ; \
  $(PATSCC2) $(MALLOCFLAG) -o $@ $^ $(LDFLAGS)
regress:: Pi.exe; ./$<
cleanall:: ; $(RMF) Pi.exe
#
all::\
ctrlstream
ctrlstream: \
ctrlstream.dats ; $(PATSCC2) $(MALLOCFLAG) -o $@ $^ $(LDFLAGS)
# regress:: ctrlstream; ./$<
cleanall:: ; $(RMF) ctrlstream
#
include $(PATSHOME)/share/atsmake-post.mk
#
testall:: all
testall:: regress
testall:: cleanall
#
cleanall:: ; $(RMF) Pi_?ats.c
cleanall:: ; $(RMF) ctrlstream_?ats.c
#
###### end of [Makefile] ######
