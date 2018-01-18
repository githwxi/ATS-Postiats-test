######
#
# A simple Makefile
#
######

all:: \
fact_dats
fact_dats: \
fact.dats; myatscc $<

######

regress:: \
fact_dats; ./fact_dats

######

testall:: all
testall:: regress
testall:: cleanall

######

clean:: ; rm -f *~

######

cleanall:: clean
cleanall:: ; rm -f fact_dats

###### end of [Makefile] ######
