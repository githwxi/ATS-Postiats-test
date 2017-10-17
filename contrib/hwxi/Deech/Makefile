PATSHOMEQ="$(PATSHOME)"

PATSCC=$(PATSHOMEQ)/bin/patscc
PATSOPT=$(PATSHOMEQ)/bin/patsopt
PATSCCFLAGS = -g

######

all: \
for_loop \
unsafe_swap \
possible_bug \
stream list array_allocate \
factorial factorial_array factorial_list

regress:: list; ./$<
regress:: stream; ./$<
regress:: for_loop; ./$<
regress:: unsafe_swap; ./$<
regress:: array_allocate; ./$<
regress:: factorial_list; ./$<
regress:: factorial_array; ./$<

for_loop: for_loop.dats; \
	$(PATSCC) $(PATSCCFLAGS) -D_GNU_SOURCE -DATS_MEMALLOC_LIBC -g -I${PATSHOME}/contrib -o $@ $< -latslib
factorial_list: factorial_list.dats; \
	$(PATSCC) $(PATSCCFLAGS) -D_GNU_SOURCE -DATS_MEMALLOC_LIBC -g -I${PATSHOME}/contrib -o $@ $< -latslib
factorial_array: factorial_array.dats; \
  $(PATSCC) $(PATSCCFLAGS) -D_GNU_SOURCE -DATS_MEMALLOC_LIBC -g -I${PATSHOME}/contrib -o $@ $< -latslib
possible_bug: possible_bug.dats; \
  $(PATSCC) $(PATSCCFLAGS) -D_GNU_SOURCE -DATS_MEMALLOC_LIBC -g -I${PATSHOME}/contrib -o $@ $< -latslib
unsafe_swap: unsafe_swap.dats; \
  $(PATSCC) $(PATSCCFLAGS) -D_GNU_SOURCE -DATS_MEMALLOC_LIBC -g -I${PATSHOME}/contrib -o $@ $< -latslib
array_allocate: array_allocate.dats; \
  $(PATSCC) $(PATSCCFLAGS) -D_GNU_SOURCE -DATS_MEMALLOC_LIBC -g -I${PATSHOME}/contrib -o $@ $< -latslib
factorial: factorial.dats; \
  $(PATSCC) $(PATSCCFLAGS) -D_GNU_SOURCE -DATS_MEMALLOC_LIBC -g -I${PATSHOME}/contrib -o $@ $< -latslib
stream: stream.dats; \
  $(PATSCC) $(PATSCCFLAGS) -D_GNU_SOURCE -DATS_MEMALLOC_LIBC -g -I${PATSHOME}/contrib -o $@ $< -latslib
list: list.dats; \
  $(PATSCC) $(PATSCCFLAGS) -D_GNU_SOURCE -DATS_MEMALLOC_LIBC -g -I${PATSHOME}/contrib -o $@ $< -latslib

######

RMF=rm -f

######

testall:: all
testall:: regress
testall:: cleanall

######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *.o
clean:: ; $(RMF) *.c
clean:: ; $(RMF) array_allocate
clean:: ; $(RMF) factorial
clean:: ; $(RMF) stream
clean:: ; $(RMF) list
clean:: ; $(RMF) safe_swap
clean:: ; $(RMF) swap_from_ats
clean:: ; $(RMF) swap
clean:: ; $(RMF) unsafe_swap
clean:: ; $(RMF) possible_bug
clean:: ; $(RMF) factorial_array
clean:: ; $(RMF) factorial_array_extend
clean:: ; $(RMF) factorial_array
clean:: ; $(RMF) factorial_list
clean:: ; $(RMF) for_loop

cleanall:: clean
