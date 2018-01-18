######
#
# A simple Makefile
#
######

all:: \
list_quant_dats
list_quant_dats: \
list_quant.dats; myatscc $<

all:: \
list_ifold_dats
list_ifold_dats: \
list_ifold.dats; myatscc $<

######

regress:: \
list_quant_dats; ./list_quant_dats

regress:: \
list_ifold_dats; ./list_ifold_dats

######

testall:: all
testall:: regress
testall:: cleanall

######

clean:: ; rm -f *~

######

cleanall:: clean
cleanall:: ; rm -f list_quant_dats
cleanall:: ; rm -f list_ifold_dats

###### end of [Makefile] ######
