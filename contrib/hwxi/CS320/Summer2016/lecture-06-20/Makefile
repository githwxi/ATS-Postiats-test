#
# A simple Makefile
#
######

PYTHON=python3
export PYTHONPATH=$(LIBATSCC2PY)/.

######
#
PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt
#
ATSCC2PY=$(PATSHOME)/bin/atscc2py3
LIBATSCC2PY=./../mylib/libatscc2py3
#
######
#
all:: \
queens_dats.py
queens_dats.c: queens.dats; $(PATSOPT) -o $@ -d $<
queens_dats.py: queens_dats.c; $(ATSCC2PY) -o $@ -i $<
#
# regress:: \
# queens_dats.py; $(PYTHON) $<
#
# test_queens: \
# queens_dats.py; $(PYTHON) $< &
#
cleanall:: ; $(RMF) queens_dats.py
#
######
#
all:: \
estream_dats.py
estream_dats.c: estream.dats; $(PATSOPT) -o $@ -d $<
estream_dats.py: estream_dats.c; $(ATSCC2PY) -o $@ -i $<
#
# regress:: \
# estream_dats.py; $(PYTHON) $<
#
# test_estream: \
# estream_dats.py; $(PYTHON) $<
#
cleanall:: ; $(RMF) estream_dats.py
#
######

testall:: all
testall:: cleanall

######

CAT=cat
RMF=rm -f

######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *_?ats.c

######
#
cleanall:: clean
#
###### end of [Makefile] ######
