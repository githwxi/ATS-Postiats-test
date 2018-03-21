######
#
# A simple Makefile
#
######

MYATSCC=$(PATSHOME)/bin/myatscc

######

all:: fib_dats
all:: binrev_dats
all:: count_ones_dats
all:: assign01_sol_dats
all:: assign02_sol_dats
all:: assign03_sol_dats
all:: assign04_sol_dats
all:: CUSIP_dats
all:: Simple_database_dats
all:: Call-ATS-from-C_dats
regress:: fib_dats; binrev_dats; count_ones_dats; assign01_sol_dats; assign02_sol_dats; assign03_sol_dats; assign04_sol_dats; CUSIP_dats; Simple_database_dats; Call-ATS-from-C_dats ./$<

######

clean:: ; rm -f *~
clean:: ; rm -f *_dats.o
clean:: ; rm -f *_dats.c

cleanall:: clean
cleanall:: ; rm -f fib_dats binrev_dats count_ones_dats assign01_sol_dats assign02_sol_dats assign03_sol_dats assign04_sol_dats CUSIP_dats Simple_database_dats Call-ATS-from-C_dats

######

testall:: all
testall:: regress
testall:: cleanall

######

%_dats: %.dats; $(MYATSCC) $<

###### end of [Makefile] ######
