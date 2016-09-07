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
LIBATSCC2PY=./../../mylib/libatscc2py3
#
######

all:: loops
loops: loops.dats; $(PATSCC) -o $@ $<
regress:: loops; ./$<
cleanall:: ; rm -f loops

######
#
all:: \
pygame_test02_dats.py
pygame_test02_dats.c: pygame_test02.dats; $(PATSOPT) -o $@ -d $<
pygame_test02_dats.py: pygame_test02_dats.c; $(ATSCC2PY) -o $@ -i $<
#
# regress:: \
# pygame_test02_dats.py; $(PYTHON) $<
#
# test_test02: \
# pygame_test02_dats.py; $(PYTHON) $<
#
cleanall:: ; $(RMF) pygame_test02_dats.py
#
######
#
all:: \
pygame_sierpinski_dats.py
pygame_sierpinski_dats.c: pygame_sierpinski.dats; $(PATSOPT) -o $@ -d $<
pygame_sierpinski_dats.py: pygame_sierpinski_dats.c; $(ATSCC2PY) -o $@ -i $<
#
# regress:: \
# pygame_sierpinski_dats.py; $(PYTHON) $<
#
# test_sierpinski: \
# pygame_sierpinski_dats.py; $(PYTHON) $<
#
cleanall:: ; $(RMF) pygame_sierpinski_dats.py
#
######

testall:: all
testall:: regress
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
