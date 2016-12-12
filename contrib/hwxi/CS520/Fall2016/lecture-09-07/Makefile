#
# For lecture-09-07
#

######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt
PATSOLVE=$(PATSHOME)/bin/patsolve_z3

######
#
all:: \
Fibonacci
Fibonacci :: \
Fibonacci.dats; \
$(PATSCC) -o $@ $<
#
regress:: Fibonacci; ./$<
cleanall:: ; $(RMF) Fibonacci
#
######

# all:: \
# ConcurrentMedians
ConcurrentMedians:: \
ConcurrentMedians.dats; \
$(PATSOPT) -tc --constraint-export -d $< | $(PATSOLVE) -i -

######

# all:: \
# ConcurrentAltitudes-1
ConcurrentAltitudes-1:: \
ConcurrentAltitudes-1.dats; \
$(PATSOPT) -tc --constraint-export -d $< | $(PATSOLVE) -i -

# all:: \
# ConcurrentAltitudes-2
ConcurrentAltitudes-2:: \
ConcurrentAltitudes-2.dats; \
$(PATSOPT) -tc --constraint-export -d $< | $(PATSOLVE) -i -

######


######

RMF=rm -f

######

testall:: all
testall:: regress
testall:: cleanall

######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *_?ats.c

cleanall:: clean

###### end of [Makefile] ######
