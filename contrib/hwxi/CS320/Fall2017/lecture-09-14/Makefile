######
#
# A simple Makefile
#
######

all:: \
lab01_dats
lab01_dats: \
lab01.dats; myatscc lab01.dats

######

all:: \
combinators_dats
combinators_dats: \
combinators.dats; myatscc combinators.dats

######

regress:: \
lab01_dats; ./$<
regress:: \
combinators_dats; ./$<

######

testall:: all
testall:: regress
testall:: cleanall

######

clean:: ; rm -f *~

######

cleanall:: clean
cleanall:: ; rm -f lab01_dats
cleanall:: ; rm -f combinators_dats

###### end of [Makefile] ######
