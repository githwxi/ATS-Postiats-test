#
# A simple Makefile
#
include $(PATSHOME)/share/atsmake-pre.mk
#
include $(PATSHOME)/share/atsmake-post.mk
#
GTKFLAGS=`pkg-config gtk+-3.0 --cflags --libs`
#
all::\
QueenPuzzle-depth
QueenPuzzle-depth: \
  tree-search.dats \
  depth-first.dats \
  gtkcairotimer_toplevel.dats \
  QueenPuzzle-depth.dats ; \
  $(PATSCC2) -D_GNU_SOURCE -DATS_MEMALLOC_LIBC -o $@ $^ $(GTKFLAGS) -lm -lrt
regress:: QueenPuzzle-depth; ./$<
cleanall:: ; $(RMF) QueenPuzzle-depth
#
all::\
QueenPuzzle-depth-all
QueenPuzzle-depth-all: \
  QueenPuzzle-depth-all.dats ; \
  $(PATSCC2) -D_GNU_SOURCE -DATS_MEMALLOC_LIBC -o $@ $^ $(GTKFLAGS) -lm -lrt
regress:: QueenPuzzle-depth-all; ./$<
cleanall:: ; $(RMF) QueenPuzzle-depth-all
#
all::\
QueenPuzzle-breadth
QueenPuzzle-breadth: \
  tree-search.dats \
  breadth-first.dats \
  gtkcairotimer_toplevel.dats \
  QueenPuzzle-breadth.dats ; \
  $(PATSCC2) -D_GNU_SOURCE -DATS_MEMALLOC_LIBC -o $@ $^ $(GTKFLAGS) -lm -lrt
regress:: QueenPuzzle-breadth; ./$<
cleanall:: ; $(RMF) QueenPuzzle-breadth
#
all::\
QueenPuzzle-breadth-all
QueenPuzzle-breadth-all: \
  QueenPuzzle-breadth-all.dats ; \
  $(PATSCC2) -D_GNU_SOURCE -DATS_MEMALLOC_LIBC -o $@ $^ $(GTKFLAGS) -lm -lrt
regress:: QueenPuzzle-breadth-all; ./$<
cleanall:: ; $(RMF) QueenPuzzle-breadth-all
#
testall:: all
# testall:: regress
testall:: cleanall
#
cleanats:: ; $(RMF) *_?ats.c
#
###### end of [Makefile] ######
