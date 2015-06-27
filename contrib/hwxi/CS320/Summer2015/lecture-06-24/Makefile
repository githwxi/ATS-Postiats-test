#
# A simple Makefile
#
include $(PATSHOME)/share/atsmake-pre.mk
#
include $(PATSHOME)/share/atsmake-post.mk
#
ATSCC2JS=$(PATSHOME)/bin/atscc2js
#
all:: \
queens_js_sol.js
queens_js_sol.js: \
queens_js_sol.dats ; \
$(PATSCC2) -DATS_MEMALLOC_LIBC -ccats -o $@ $< && $(ATSCC2JS) -i queens_js_sol_dats.c > $@
#
testall:: all
testall:: cleanall
#
cleanats:: ; $(RMF) *~
cleanats:: ; $(RMF) *_?ats.c
#
cleanall:: cleanats
cleanall:: ; $(RMF) queens_js_sol.js
#
###### end of [Makefile] ######
