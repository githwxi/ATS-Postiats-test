######
#
# A simple Makefile
#
######

all:: \
option_dats
option_dats: \
option.dats; myatscc $<

all:: \
listfold_dats
listfold_dats: \
listfold.dats; myatscc $<

######

regress:: \
option_dats; ./option_dats

regress:: \
listfold_dats; ./listfold_dats

######

testall:: all
testall:: regress
testall:: cleanall

######

clean:: ; rm -f *~

######

cleanall:: clean
cleanall:: ; rm -f option_dats
cleanall:: ; rm -f listfold_dats

###### end of [Makefile] ######
