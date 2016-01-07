#
# A Simple Makefile
#

######

include \
$(PATSHOME)/share/atsmake-pre.mk

######

CFLAGS += -O2

######
#
MALLOCFLAG := -DATS_MEMALLOC_LIBC
#
# MALLOCFLAG := -DATS_MEMALLOC_GCBDW
#
######

ifeq ($(MALLOCFLAG), -DATS_MEMALLOC_GCBDW)
LDFLAGS += -lgc
endif # end of [ifeq]

######

SOURCES_SATS += \
  lambda.sats \

SOURCES_DATS += \
  lambda_vnam.dats \
  lambda_cnam.dats \
  lambda_term.dats \
  lambda_value.dats \
  lambda_eval.dats \
  lambda_envmap.dats \
  lambda_libenv.dats \
  lambda_test.dats \
  lambda_main.dats \

######

MYTARGET=lambda

######

include $(PATSHOME)/share/atsmake-post.mk

######

testall:: all
testall:: regress
testall:: cleanall

######

regress:: lambda; ./lambda

######

cleanats:: ; $(RMF) *~
cleanats:: ; $(RMF) *_?ats.o
cleanats:: ; $(RMF) *_?ats.c

######

cleanall:: cleanats
cleanall:: ; $(RMF) lambda

######

###### end of [Makefile] ######
