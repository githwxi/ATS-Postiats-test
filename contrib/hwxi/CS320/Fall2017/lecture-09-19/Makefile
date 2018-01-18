######
#
# A simple Makefile
#
######

all:: \
int_foldleft_dats
int_foldleft_dats: \
int_foldleft.dats; myatscc $<

######

regress:: \
int_foldleft_dats; ./int_foldleft_dats

######

testall:: all
testall:: regress
testall:: cleanall

######

clean:: ; rm -f *~

######

cleanall:: clean
cleanall:: ; rm -f int_foldleft_dats

###### end of [Makefile] ######
