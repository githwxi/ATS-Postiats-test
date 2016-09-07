######
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
#
all:: \
Wormlike_main_dats.py
#
Wormlike_main_dats.c: \
Wormlike.sats Wormlike_main.dats; \
$(PATSCC) -ccats Wormlike_main.dats
Wormlike_main_dats.py: Wormlike_main_dats.c; $(ATSCC2PY) -o $@ -i $<
#
# regress:: \
# Wormlike_main_dats.py; $(PYTHON) $<
#
# test_game:: \
# Wormlike_main_dats.py; $(PYTHON) $< &
#
cleanall:: ; $(RMF) Wormlike_main_dats.py
#
######

testall:: all
testall:: cleanall

######

RMF=rm -f

######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *_dats.c

######

cleanall:: clean
cleanall:: ; $(RMF) *_dats.py

###### end of [Makefile] ######
