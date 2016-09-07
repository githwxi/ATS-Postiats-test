#
# A simple Makefile
#

######

PATSCC=$(PATSHOME)/bin/patscc
PATSOPT=$(PATSHOME)/bin/patsopt

######

all:: rpc_server
regress:: rpc_server; ./rpc_server
cleanall:: ; rm -f rpc_server

######

all:: rpc_client
regress:: rpc_client; ./rpc_client
cleanall:: ; rm -f rpc_client

######

all:: array_v_split
regress:: array_v_split; ./array_v_split
cleanall:: ; rm -f array_v_split

######

testall:: all
testall:: regress
testall:: cleanall

######
#
%: %.dats; $(PATSCC) -o $@ $< -DATS_MEMALLOC_LIBC
#
######

clean:: ; rm -f *~
clean:: ; rm -f myfib.o
clean:: ; rm -f *_dats.o
clean:: ; rm -f *_dats.c

cleanall:: clean

###### end of [Makefile] ######
