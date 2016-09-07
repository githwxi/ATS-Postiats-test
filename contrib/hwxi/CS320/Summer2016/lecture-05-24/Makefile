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

all:: fact
fact: fact.dats; $(PATSCC) -o $@ fact.dats
regress:: fact; ./fact
cleanall:: ; rm -f fact

######

all:: quiz
quiz: quiz.dats; $(PATSCC) -o $@ quiz.dats
regress:: quiz; ./quiz
cleanall:: ; rm -f quiz

######
#
all:: \
pygame_test01_dats.py
pygame_test01_dats.c: pygame_test01.dats; $(PATSOPT) -o $@ -d $<
pygame_test01_dats.py: pygame_test01_dats.c; $(ATSCC2PY) -o $@ -i $<
#
# regress:: \
# pygame_test01_dats.py; $(PYTHON) $<
#
cleanall:: ; $(RMF) pygame_test01_dats.py
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
