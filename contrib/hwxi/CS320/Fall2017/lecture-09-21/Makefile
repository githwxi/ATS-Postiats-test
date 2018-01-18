######
#
# A simple Makefile
#
######

all:: \
mylist_dats
mylist_dats: \
mylist.dats; myatscc $<

all:: \
intlist_dats
intlist_dats: \
intlist.dats; myatscc $<

all:: \
weekday_dats
weekday_dats: \
weekday.dats; myatscc $<

######

regress:: \
mylist_dats; ./mylist_dats

regress:: \
intlist_dats; ./intlist_dats

regress:: \
weekday_dats; ./weekday_dats

######

testall:: all
testall:: regress
testall:: cleanall

######

clean:: ; rm -f *~

######

cleanall:: clean
cleanall:: ; rm -f mylist_dats
cleanall:: ; rm -f intlist_dats
cleanall:: ; rm -f weekday_dats

###### end of [Makefile] ######
