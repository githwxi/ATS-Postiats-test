######
#
# A simple Makefile
#
######

all:: \
fact_dats
fact_dats: \
fact.dats; myatscc $<

all:: \
evenodd_dats
evenodd_dats: \
evenodd.dats; myatscc $<

all:: \
higher-order_dats
higher-order_dats: \
higher-order.dats; myatscc $<

######

regress:: \
fact_dats; ./fact_dats

regress:: \
evenodd_dats; ./evenodd_dats

regress:: \
higher-order_dats; ./higher-order_dats

######

testall:: all
testall:: regress
testall:: cleanall

######

clean:: ; rm -f *~

######

cleanall:: clean
cleanall:: ; rm -f fact_dats
cleanall:: ; rm -f evenodd_dats
cleanall:: ; rm -f higher-order_dats

###### end of [Makefile] ######
