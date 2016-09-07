######
##
## The Python3 code
## is generated from ATS source by atscc2py3
## The starting compilation time is: 2016-7-27: 16h:43m
##
######

######
#ATSextcode_beg()
######
######
from ats2pypre_basics_cats import *
######
from ats2pypre_bool_cats import *
from ats2pypre_integer_cats import *
######
from ats2pypre_reference_dats import *
######
######
#ATSextcode_end()
######

#ATSassume(_057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2py3_057_SATS_057_qlistref_056_sats__qlistref_type)

def _057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2py3_057_SATS_057_qlistref_056_sats__qlistref_length(arg0):
  tmpret0 = None
  tmp1 = None
  tmp2 = None
  tmp3 = None
  tmp4 = None
  tmp5 = None
  tmp6 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_qlistref_length
  tmp1 = arg0[0]
  tmp2 = arg0[1]
  tmp4 = ats2pypre_ref_get_elt(tmp1)
  tmp3 = ats2pypre_list_length(tmp4)
  tmp6 = ats2pypre_ref_get_elt(tmp2)
  tmp5 = ats2pypre_list_length(tmp6)
  tmpret0 = ats2pypre_add_int1_int1(tmp3, tmp5)
  return tmpret0


def _057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2py3_057_SATS_057_qlistref_056_sats__qlistref_enque(arg0, arg1):
  tmp8 = None
  tmp9 = None
  tmp10 = None
  tmp11 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_qlistref_enque
  tmp8 = arg0[0]
  tmp9 = arg0[1]
  tmp11 = ats2pypre_ref_get_elt(tmp8)
  tmp10 = (arg1, tmp11)
  ats2pypre_ref_set_elt(tmp8, tmp10)
  return#_void


def _057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2py3_057_SATS_057_qlistref_056_sats__qlistref_deque_opt(arg0):
  tmpret12 = None
  tmp13 = None
  tmp14 = None
  tmp15 = None
  tmp16 = None
  tmp17 = None
  tmp18 = None
  tmp20 = None
  tmp21 = None
  tmp22 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  mbranch_2 = None
  def __atstmplab0():
    nonlocal arg0
    nonlocal tmpret12, tmp13, tmp14, tmp15, tmp16, tmp17, tmp18, tmp20, tmp21, tmp22
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1, mbranch_2
    tmplab_py = 0
    if(ATSCKptriscons(tmp15)): tmplab_py = 4 ; return#__atstmplab3
    __atstmplab1()
    return
  def __atstmplab1():
    nonlocal arg0
    nonlocal tmpret12, tmp13, tmp14, tmp15, tmp16, tmp17, tmp18, tmp20, tmp21, tmp22
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1, mbranch_2
    tmplab_py = 0
    tmp18 = ats2pypre_ref_get_elt(tmp13)
    tmp20 = None
    ats2pypre_ref_set_elt(tmp13, tmp20)
    #ATScaseofseq_beg
    tmplab_py = 1
    while(1):
      mbranch_2.get(tmplab_py)()
      if (tmplab_py == 0): break
    #ATScaseofseq_end
    return
  def __atstmplab2():
    nonlocal arg0
    nonlocal tmpret12, tmp13, tmp14, tmp15, tmp16, tmp17, tmp18, tmp20, tmp21, tmp22
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1, mbranch_2
    tmplab_py = 0
    __atstmplab3()
    return
  def __atstmplab3():
    nonlocal arg0
    nonlocal tmpret12, tmp13, tmp14, tmp15, tmp16, tmp17, tmp18, tmp20, tmp21, tmp22
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1, mbranch_2
    tmplab_py = 0
    tmp16 = tmp15[0]
    tmp17 = tmp15[1]
    ats2pypre_ref_set_elt(tmp14, tmp17)
    tmpret12 = (tmp16, )
    return
  def __atstmplab4():
    nonlocal arg0
    nonlocal tmpret12, tmp13, tmp14, tmp15, tmp16, tmp17, tmp18, tmp20, tmp21, tmp22
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1, mbranch_2
    tmplab_py = 0
    if(ATSCKptriscons(tmp18)): tmplab_py = 4 ; return#__atstmplab7
    __atstmplab5()
    return
  def __atstmplab5():
    nonlocal arg0
    nonlocal tmpret12, tmp13, tmp14, tmp15, tmp16, tmp17, tmp18, tmp20, tmp21, tmp22
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1, mbranch_2
    tmplab_py = 0
    tmpret12 = None
    return
  def __atstmplab6():
    nonlocal arg0
    nonlocal tmpret12, tmp13, tmp14, tmp15, tmp16, tmp17, tmp18, tmp20, tmp21, tmp22
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1, mbranch_2
    tmplab_py = 0
    __atstmplab7()
    return
  def __atstmplab7():
    nonlocal arg0
    nonlocal tmpret12, tmp13, tmp14, tmp15, tmp16, tmp17, tmp18, tmp20, tmp21, tmp22
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1, mbranch_2
    tmplab_py = 0
    tmp21 = tmp18[0]
    tmp22 = tmp18[1]
    ats2pypre_ref_set_elt(tmp14, tmp22)
    tmpret12 = (tmp21, )
    return
  mbranch_1 = { 1: __atstmplab0, 2: __atstmplab1, 3: __atstmplab2, 4: __atstmplab3 }
  mbranch_2 = { 1: __atstmplab4, 2: __atstmplab5, 3: __atstmplab6, 4: __atstmplab7 }
  #__patsflab_qlistref_deque_opt
  tmp13 = arg0[0]
  tmp14 = arg0[1]
  tmp15 = ats2pypre_ref_get_elt(tmp14)
  #ATScaseofseq_beg
  tmplab_py = 1
  while(1):
    mbranch_1.get(tmplab_py)()
    if (tmplab_py == 0): break
  #ATScaseofseq_end
  return tmpret12


def _057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2py3_057_SATS_057_qlistref_056_sats__qlistref_foldleft(arg0, arg1, arg2):
  tmpret25 = None
  tmp26 = None
  tmp27 = None
  tmp36 = None
  tmp37 = None
  tmp38 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_qlistref_foldleft
  tmp26 = arg0[0]
  tmp27 = arg0[1]
  tmp36 = ats2pypre_ref_get_elt(tmp26)
  tmp38 = ats2pypre_ref_get_elt(tmp27)
  tmp37 = _ats2pypre_qlistref_auxl_4(arg2, arg1, tmp38)
  tmpret25 = _ats2pypre_qlistref_auxr_5(arg2, tmp36, tmp37)
  return tmpret25


def _ats2pypre_qlistref_auxl_4(env0, arg0, arg1):
  apy0 = None
  apy1 = None
  tmpret28 = None
  tmp29 = None
  tmp30 = None
  tmp31 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  def __atstmplab8():
    nonlocal env0, arg0, arg1
    nonlocal apy0, apy1, tmpret28, tmp29, tmp30, tmp31
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    if(ATSCKptriscons(arg1)): tmplab_py = 4 ; return#__atstmplab11
    __atstmplab9()
    return
  def __atstmplab9():
    nonlocal env0, arg0, arg1
    nonlocal apy0, apy1, tmpret28, tmp29, tmp30, tmp31
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmpret28 = arg0
    return
  def __atstmplab10():
    nonlocal env0, arg0, arg1
    nonlocal apy0, apy1, tmpret28, tmp29, tmp30, tmp31
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    __atstmplab11()
    return
  def __atstmplab11():
    nonlocal env0, arg0, arg1
    nonlocal apy0, apy1, tmpret28, tmp29, tmp30, tmp31
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmp29 = arg1[0]
    tmp30 = arg1[1]
    tmp31 = env0[0](env0, arg0, tmp29)
    #ATStailcalseq_beg
    apy0 = tmp31
    apy1 = tmp30
    arg0 = apy0
    arg1 = apy1
    funlab_py = 1 #__patsflab__ats2pypre_qlistref_auxl_4
    #ATStailcalseq_end
    return
  mbranch_1 = { 1: __atstmplab8, 2: __atstmplab9, 3: __atstmplab10, 4: __atstmplab11 }
  while(1):
    funlab_py = 0
    #__patsflab__ats2pypre_qlistref_auxl_4
    #ATScaseofseq_beg
    tmplab_py = 1
    while(1):
      mbranch_1.get(tmplab_py)()
      if (tmplab_py == 0): break
    #ATScaseofseq_end
    if (funlab_py == 0): break
  return tmpret28


def _ats2pypre_qlistref_auxr_5(env0, arg0, arg1):
  tmpret32 = None
  tmp33 = None
  tmp34 = None
  tmp35 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  def __atstmplab12():
    nonlocal env0, arg0, arg1
    nonlocal tmpret32, tmp33, tmp34, tmp35
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    if(ATSCKptriscons(arg0)): tmplab_py = 4 ; return#__atstmplab15
    __atstmplab13()
    return
  def __atstmplab13():
    nonlocal env0, arg0, arg1
    nonlocal tmpret32, tmp33, tmp34, tmp35
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmpret32 = arg1
    return
  def __atstmplab14():
    nonlocal env0, arg0, arg1
    nonlocal tmpret32, tmp33, tmp34, tmp35
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    __atstmplab15()
    return
  def __atstmplab15():
    nonlocal env0, arg0, arg1
    nonlocal tmpret32, tmp33, tmp34, tmp35
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmp33 = arg0[0]
    tmp34 = arg0[1]
    tmp35 = _ats2pypre_qlistref_auxr_5(env0, tmp34, arg1)
    tmpret32 = env0[0](env0, tmp35, tmp33)
    return
  mbranch_1 = { 1: __atstmplab12, 2: __atstmplab13, 3: __atstmplab14, 4: __atstmplab15 }
  #__patsflab__ats2pypre_qlistref_auxr_5
  #ATScaseofseq_beg
  tmplab_py = 1
  while(1):
    mbranch_1.get(tmplab_py)()
    if (tmplab_py == 0): break
  #ATScaseofseq_end
  return tmpret32


def _057_home_057_hwxi_057_Research_057_ATS_055_Postiats_055_contrib_057_contrib_057_libatscc_057_libatscc2py3_057_SATS_057_qlistref_056_sats__qlistref_foldright(arg0, arg1, arg2):
  tmpret39 = None
  tmp40 = None
  tmp41 = None
  tmp50 = None
  tmp51 = None
  tmp52 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_qlistref_foldright
  tmp40 = arg0[0]
  tmp41 = arg0[1]
  tmp50 = ats2pypre_ref_get_elt(tmp41)
  tmp52 = ats2pypre_ref_get_elt(tmp40)
  tmp51 = _ats2pypre_qlistref_auxl_7(arg1, arg2, tmp52)
  tmpret39 = _ats2pypre_qlistref_auxr_8(arg1, tmp50, tmp51)
  return tmpret39


def _ats2pypre_qlistref_auxl_7(env0, arg0, arg1):
  apy0 = None
  apy1 = None
  tmpret42 = None
  tmp43 = None
  tmp44 = None
  tmp45 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  def __atstmplab16():
    nonlocal env0, arg0, arg1
    nonlocal apy0, apy1, tmpret42, tmp43, tmp44, tmp45
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    if(ATSCKptriscons(arg1)): tmplab_py = 4 ; return#__atstmplab19
    __atstmplab17()
    return
  def __atstmplab17():
    nonlocal env0, arg0, arg1
    nonlocal apy0, apy1, tmpret42, tmp43, tmp44, tmp45
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmpret42 = arg0
    return
  def __atstmplab18():
    nonlocal env0, arg0, arg1
    nonlocal apy0, apy1, tmpret42, tmp43, tmp44, tmp45
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    __atstmplab19()
    return
  def __atstmplab19():
    nonlocal env0, arg0, arg1
    nonlocal apy0, apy1, tmpret42, tmp43, tmp44, tmp45
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmp43 = arg1[0]
    tmp44 = arg1[1]
    tmp45 = env0[0](env0, tmp43, arg0)
    #ATStailcalseq_beg
    apy0 = tmp45
    apy1 = tmp44
    arg0 = apy0
    arg1 = apy1
    funlab_py = 1 #__patsflab__ats2pypre_qlistref_auxl_7
    #ATStailcalseq_end
    return
  mbranch_1 = { 1: __atstmplab16, 2: __atstmplab17, 3: __atstmplab18, 4: __atstmplab19 }
  while(1):
    funlab_py = 0
    #__patsflab__ats2pypre_qlistref_auxl_7
    #ATScaseofseq_beg
    tmplab_py = 1
    while(1):
      mbranch_1.get(tmplab_py)()
      if (tmplab_py == 0): break
    #ATScaseofseq_end
    if (funlab_py == 0): break
  return tmpret42


def _ats2pypre_qlistref_auxr_8(env0, arg0, arg1):
  tmpret46 = None
  tmp47 = None
  tmp48 = None
  tmp49 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  def __atstmplab20():
    nonlocal env0, arg0, arg1
    nonlocal tmpret46, tmp47, tmp48, tmp49
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    if(ATSCKptriscons(arg0)): tmplab_py = 4 ; return#__atstmplab23
    __atstmplab21()
    return
  def __atstmplab21():
    nonlocal env0, arg0, arg1
    nonlocal tmpret46, tmp47, tmp48, tmp49
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmpret46 = arg1
    return
  def __atstmplab22():
    nonlocal env0, arg0, arg1
    nonlocal tmpret46, tmp47, tmp48, tmp49
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    __atstmplab23()
    return
  def __atstmplab23():
    nonlocal env0, arg0, arg1
    nonlocal tmpret46, tmp47, tmp48, tmp49
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmp47 = arg0[0]
    tmp48 = arg0[1]
    tmp49 = _ats2pypre_qlistref_auxr_8(env0, tmp48, arg1)
    tmpret46 = env0[0](env0, tmp47, tmp49)
    return
  mbranch_1 = { 1: __atstmplab20, 2: __atstmplab21, 3: __atstmplab22, 4: __atstmplab23 }
  #__patsflab__ats2pypre_qlistref_auxr_8
  #ATScaseofseq_beg
  tmplab_py = 1
  while(1):
    mbranch_1.get(tmplab_py)()
    if (tmplab_py == 0): break
  #ATScaseofseq_end
  return tmpret46

######
##
## end-of-compilation-unit
##
######
