##
##
## A simple Makefile
##
##

######

PATSHOMEQ="$(PATSHOME)"

######

PATSCC=$(PATSHOMEQ)/bin/patscc
PATSOPT=$(PATSHOMEQ)/bin/patsopt
PATSLIB=$(PATSHOMEQ)/ccomp/atslib/lib

######

#
# HX: Please uncomment the one you want, or skip it entirely
#
ATSCCFLAGS=
ATSCCFLAGS=-O2
#
# '-flto' enables link-time optimization such as inlining lib functions
#
#ATSCCFLAGS=-O2 -flto
#

######

all:: test

######

cleanall::

######

SOURCESsta := \
  lambda.sats \

SOURCESdyn := \
  lambda.dats \
  lambda_size.dats \
  lambda_print.dats \
  lambda_context.dats \
  lambda_subst.dats \
  lambda_eval.dats \
  lambda_environ.dats \
  lambda_eval2.dats \

######

OBJECTS := \
  $(SOURCESsta) \
  $(SOURCESdyn) \

OBJECTS := $(patsubst %.dats, %_dats.o, $(OBJECTS))

######

test: \
$(OBJECTS) ; \
  $(PATSCC) $(ATSCCFLAGS) -o $@ $^ -L$(PATSLIB) -latslib
regress:: test; ./$<
cleanall:: ; $(RMF) test

######

#
# You may find these rules useful
#

lambda_sats.o: lambda.sats ; \
  $(PATSCC) -D_BSD_SOURCE -DATS_MEMALLOC_LIBC $(ATSCCFLAGS) -c $<
%_dats.o: %.dats lambda.sats ; \
  $(PATSCC) -D_BSD_SOURCE -DATS_MEMALLOC_LIBC $(ATSCCFLAGS) -c $<

######

depend:: ; $(PATSOPT) -o .depend1 --depgen -s $(SOURCESsta)
depend:: ; $(PATSOPT) -o .depend2 --depgen -d $(SOURCESdyn)

######

-include .depend1
-include .depend2

######

testall:: test
testall:: regress
testall:: cleanall

######

RMF=rm -f

######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *_?ats.o
clean:: ; $(RMF) *_?ats.c

cleanall:: clean
cleanall:: ; $(RMF) .depend1
cleanall:: ; $(RMF) .depend2

###### end of [Makefile] ######
