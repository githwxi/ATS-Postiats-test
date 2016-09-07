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
from ats2pypre_integer_cats import *
from ats2pypre_bool_cats import *
######
from ats2pypre_list_dats import *
######
######
#ATSextcode_end()
######

def _ats2pypre_ML_list0_patsfun_20__closurerize(env0):
  def _ats2pypre_ML_list0_patsfun_20__cfun(cenv, arg0): return _ats2pypre_ML_list0_patsfun_20(cenv[1], arg0)
  return (_ats2pypre_ML_list0_patsfun_20__cfun, env0)

def _ats2pypre_ML_list0_patsfun_23__closurerize(env0):
  def _ats2pypre_ML_list0_patsfun_23__cfun(cenv, arg0): return _ats2pypre_ML_list0_patsfun_23(cenv[1], arg0)
  return (_ats2pypre_ML_list0_patsfun_23__cfun, env0)

def _ats2pypre_ML_list0_patsfun_26__closurerize(env0):
  def _ats2pypre_ML_list0_patsfun_26__cfun(cenv, arg0): return _ats2pypre_ML_list0_patsfun_26(cenv[1], arg0)
  return (_ats2pypre_ML_list0_patsfun_26__cfun, env0)

def _ats2pypre_ML_list0_patsfun_29__closurerize(env0):
  def _ats2pypre_ML_list0_patsfun_29__cfun(cenv, arg0): return _ats2pypre_ML_list0_patsfun_29(cenv[1], arg0)
  return (_ats2pypre_ML_list0_patsfun_29__cfun, env0)

def _ats2pypre_ML_list0_patsfun_33__closurerize(env0):
  def _ats2pypre_ML_list0_patsfun_33__cfun(cenv, arg0): return _ats2pypre_ML_list0_patsfun_33(cenv[1], arg0)
  return (_ats2pypre_ML_list0_patsfun_33__cfun, env0)

def _ats2pypre_ML_list0_patsfun_36__closurerize(env0):
  def _ats2pypre_ML_list0_patsfun_36__cfun(cenv, arg0): return _ats2pypre_ML_list0_patsfun_36(cenv[1], arg0)
  return (_ats2pypre_ML_list0_patsfun_36__cfun, env0)

def _ats2pypre_ML_list0_patsfun_39__closurerize(env0):
  def _ats2pypre_ML_list0_patsfun_39__cfun(cenv, arg0): return _ats2pypre_ML_list0_patsfun_39(cenv[1], arg0)
  return (_ats2pypre_ML_list0_patsfun_39__cfun, env0)

def _ats2pypre_ML_list0_patsfun_42__closurerize(env0):
  def _ats2pypre_ML_list0_patsfun_42__cfun(cenv, arg0): return _ats2pypre_ML_list0_patsfun_42(cenv[1], arg0)
  return (_ats2pypre_ML_list0_patsfun_42__cfun, env0)

def _ats2pypre_ML_list0_patsfun_45__closurerize(env0):
  def _ats2pypre_ML_list0_patsfun_45__cfun(cenv, arg0): return _ats2pypre_ML_list0_patsfun_45(cenv[1], arg0)
  return (_ats2pypre_ML_list0_patsfun_45__cfun, env0)

def ats2pypre_ML_list0_length(arg0):
  tmpret2 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list0_length
  tmpret2 = ats2pypre_list_length(arg0)
  return tmpret2


def ats2pypre_ML_list0_last_opt(arg0):
  tmpret3 = None
  tmp7 = None
  tmp8 = None
  tmp9 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  def __atstmplab10():
    nonlocal arg0
    nonlocal tmpret3, tmp7, tmp8, tmp9
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    if(ATSCKptriscons(arg0)): tmplab_py = 4 ; return#__atstmplab13
    __atstmplab11()
    return
  def __atstmplab11():
    nonlocal arg0
    nonlocal tmpret3, tmp7, tmp8, tmp9
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmpret3 = None
    return
  def __atstmplab12():
    nonlocal arg0
    nonlocal tmpret3, tmp7, tmp8, tmp9
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    __atstmplab13()
    return
  def __atstmplab13():
    nonlocal arg0
    nonlocal tmpret3, tmp7, tmp8, tmp9
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmp7 = arg0[0]
    tmp8 = arg0[1]
    tmp9 = _ats2pypre_ML_list0_loop_4(tmp7, tmp8)
    tmpret3 = (tmp9, )
    return
  mbranch_1 = { 1: __atstmplab10, 2: __atstmplab11, 3: __atstmplab12, 4: __atstmplab13 }
  #__patsflab_list0_last_opt
  #ATScaseofseq_beg
  tmplab_py = 1
  while(1):
    mbranch_1.get(tmplab_py)()
    if (tmplab_py == 0): break
  #ATScaseofseq_end
  return tmpret3


def _ats2pypre_ML_list0_loop_4(arg0, arg1):
  apy0 = None
  apy1 = None
  tmpret4 = None
  tmp5 = None
  tmp6 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  def __atstmplab6():
    nonlocal arg0, arg1
    nonlocal apy0, apy1, tmpret4, tmp5, tmp6
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    if(ATSCKptriscons(arg1)): tmplab_py = 4 ; return#__atstmplab9
    __atstmplab7()
    return
  def __atstmplab7():
    nonlocal arg0, arg1
    nonlocal apy0, apy1, tmpret4, tmp5, tmp6
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmpret4 = arg0
    return
  def __atstmplab8():
    nonlocal arg0, arg1
    nonlocal apy0, apy1, tmpret4, tmp5, tmp6
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    __atstmplab9()
    return
  def __atstmplab9():
    nonlocal arg0, arg1
    nonlocal apy0, apy1, tmpret4, tmp5, tmp6
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmp5 = arg1[0]
    tmp6 = arg1[1]
    #ATStailcalseq_beg
    apy0 = tmp5
    apy1 = tmp6
    arg0 = apy0
    arg1 = apy1
    funlab_py = 1 #__patsflab__ats2pypre_ML_list0_loop_4
    #ATStailcalseq_end
    return
  mbranch_1 = { 1: __atstmplab6, 2: __atstmplab7, 3: __atstmplab8, 4: __atstmplab9 }
  while(1):
    funlab_py = 0
    #__patsflab__ats2pypre_ML_list0_loop_4
    #ATScaseofseq_beg
    tmplab_py = 1
    while(1):
      mbranch_1.get(tmplab_py)()
      if (tmplab_py == 0): break
    #ATScaseofseq_end
    if (funlab_py == 0): break
  return tmpret4


def ats2pypre_ML_list0_get_at_opt(arg0, arg1):
  apy0 = None
  apy1 = None
  tmpret10 = None
  tmp11 = None
  tmp12 = None
  tmp13 = None
  tmp14 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  def __atstmplab14():
    nonlocal arg0, arg1
    nonlocal apy0, apy1, tmpret10, tmp11, tmp12, tmp13, tmp14
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    if(ATSCKptriscons(arg0)): tmplab_py = 4 ; return#__atstmplab17
    __atstmplab15()
    return
  def __atstmplab15():
    nonlocal arg0, arg1
    nonlocal apy0, apy1, tmpret10, tmp11, tmp12, tmp13, tmp14
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmpret10 = None
    return
  def __atstmplab16():
    nonlocal arg0, arg1
    nonlocal apy0, apy1, tmpret10, tmp11, tmp12, tmp13, tmp14
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    __atstmplab17()
    return
  def __atstmplab17():
    nonlocal arg0, arg1
    nonlocal apy0, apy1, tmpret10, tmp11, tmp12, tmp13, tmp14
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmp11 = arg0[0]
    tmp12 = arg0[1]
    tmp13 = ats2pypre_gt_int1_int1(arg1, 0)
    if (tmp13):
      tmp14 = ats2pypre_sub_int1_int1(arg1, 1)
      #ATStailcalseq_beg
      apy0 = tmp12
      apy1 = tmp14
      arg0 = apy0
      arg1 = apy1
      funlab_py = 1 #__patsflab_list0_get_at_opt
      #ATStailcalseq_end
    else:
      tmpret10 = (tmp11, )
    #endif
    return
  mbranch_1 = { 1: __atstmplab14, 2: __atstmplab15, 3: __atstmplab16, 4: __atstmplab17 }
  while(1):
    funlab_py = 0
    #__patsflab_list0_get_at_opt
    #ATScaseofseq_beg
    tmplab_py = 1
    while(1):
      mbranch_1.get(tmplab_py)()
      if (tmplab_py == 0): break
    #ATScaseofseq_end
    if (funlab_py == 0): break
  return tmpret10


def ats2pypre_ML_list0_make_intrange_2(arg0, arg1):
  tmpret15 = None
  tmp16 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list0_make_intrange_2
  tmp16 = ats2pypre_list_make_intrange_2(arg0, arg1)
  tmpret15 = tmp16
  return tmpret15


def ats2pypre_ML_list0_make_intrange_3(arg0, arg1, arg2):
  tmpret17 = None
  tmp18 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list0_make_intrange_3
  tmp18 = ats2pypre_list_make_intrange_3(arg0, arg1, arg2)
  tmpret17 = tmp18
  return tmpret17


def ats2pypre_ML_list0_snoc(arg0, arg1):
  tmpret30 = None
  tmp31 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list0_snoc
  tmp31 = ats2pypre_list_snoc(arg0, arg1)
  tmpret30 = tmp31
  return tmpret30


def ats2pypre_ML_list0_extend(arg0, arg1):
  tmpret32 = None
  tmp33 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list0_extend
  tmp33 = ats2pypre_list_extend(arg0, arg1)
  tmpret32 = tmp33
  return tmpret32


def ats2pypre_ML_list0_append(arg0, arg1):
  tmpret34 = None
  tmp35 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list0_append
  tmp35 = ats2pypre_list_append(arg0, arg1)
  tmpret34 = tmp35
  return tmpret34


def ats2pypre_ML_list0_reverse(arg0):
  tmpret36 = None
  tmp37 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list0_reverse
  tmp37 = ats2pypre_list_reverse(arg0)
  tmpret36 = tmp37
  return tmpret36


def ats2pypre_ML_list0_reverse_append(arg0, arg1):
  tmpret38 = None
  tmp39 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list0_reverse_append
  tmp39 = ats2pypre_list_reverse_append(arg0, arg1)
  tmpret38 = tmp39
  return tmpret38


def ats2pypre_ML_list0_exists(arg0, arg1):
  tmpret40 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list0_exists
  tmpret40 = ats2pypre_list_exists(arg0, arg1)
  return tmpret40


def ats2pypre_ML_list0_exists_method(arg0):
  tmpret41 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list0_exists_method
  tmpret41 = _ats2pypre_ML_list0_patsfun_20__closurerize(arg0)
  return tmpret41


def _ats2pypre_ML_list0_patsfun_20(env0, arg0):
  tmpret42 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab__ats2pypre_ML_list0_patsfun_20
  tmpret42 = ats2pypre_ML_list0_exists(env0, arg0)
  return tmpret42


def ats2pypre_ML_list0_iexists(arg0, arg1):
  tmpret43 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list0_iexists
  tmpret43 = ats2pypre_list_iexists(arg0, arg1)
  return tmpret43


def ats2pypre_ML_list0_iexists_method(arg0):
  tmpret44 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list0_iexists_method
  tmpret44 = _ats2pypre_ML_list0_patsfun_23__closurerize(arg0)
  return tmpret44


def _ats2pypre_ML_list0_patsfun_23(env0, arg0):
  tmpret45 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab__ats2pypre_ML_list0_patsfun_23
  tmpret45 = ats2pypre_ML_list0_iexists(env0, arg0)
  return tmpret45


def ats2pypre_ML_list0_forall(arg0, arg1):
  tmpret46 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list0_forall
  tmpret46 = ats2pypre_list_forall(arg0, arg1)
  return tmpret46


def ats2pypre_ML_list0_forall_method(arg0):
  tmpret47 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list0_forall_method
  tmpret47 = _ats2pypre_ML_list0_patsfun_26__closurerize(arg0)
  return tmpret47


def _ats2pypre_ML_list0_patsfun_26(env0, arg0):
  tmpret48 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab__ats2pypre_ML_list0_patsfun_26
  tmpret48 = ats2pypre_ML_list0_forall(env0, arg0)
  return tmpret48


def ats2pypre_ML_list0_iforall(arg0, arg1):
  tmpret49 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list0_iforall
  tmpret49 = ats2pypre_list_iforall(arg0, arg1)
  return tmpret49


def ats2pypre_ML_list0_iforall_method(arg0):
  tmpret50 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list0_iforall_method
  tmpret50 = _ats2pypre_ML_list0_patsfun_29__closurerize(arg0)
  return tmpret50


def _ats2pypre_ML_list0_patsfun_29(env0, arg0):
  tmpret51 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab__ats2pypre_ML_list0_patsfun_29
  tmpret51 = ats2pypre_ML_list0_iforall(env0, arg0)
  return tmpret51


def ats2pypre_ML_list0_app(arg0, arg1):
  funlab_py = None
  tmplab_py = None
  #__patsflab_list0_app
  ats2pypre_ML_list0_foreach(arg0, arg1)
  return#_void


def ats2pypre_ML_list0_foreach(arg0, arg1):
  funlab_py = None
  tmplab_py = None
  #__patsflab_list0_foreach
  ats2pypre_list_foreach(arg0, arg1)
  return#_void


def ats2pypre_ML_list0_foreach_method(arg0):
  tmpret54 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list0_foreach_method
  tmpret54 = _ats2pypre_ML_list0_patsfun_33__closurerize(arg0)
  return tmpret54


def _ats2pypre_ML_list0_patsfun_33(env0, arg0):
  funlab_py = None
  tmplab_py = None
  #__patsflab__ats2pypre_ML_list0_patsfun_33
  ats2pypre_ML_list0_foreach(env0, arg0)
  return#_void


def ats2pypre_ML_list0_iforeach(arg0, arg1):
  funlab_py = None
  tmplab_py = None
  #__patsflab_list0_iforeach
  ats2pypre_list_iforeach(arg0, arg1)
  return#_void


def ats2pypre_ML_list0_iforeach_method(arg0):
  tmpret57 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list0_iforeach_method
  tmpret57 = _ats2pypre_ML_list0_patsfun_36__closurerize(arg0)
  return tmpret57


def _ats2pypre_ML_list0_patsfun_36(env0, arg0):
  funlab_py = None
  tmplab_py = None
  #__patsflab__ats2pypre_ML_list0_patsfun_36
  ats2pypre_ML_list0_iforeach(env0, arg0)
  return#_void


def ats2pypre_ML_list0_rforeach(arg0, arg1):
  funlab_py = None
  tmplab_py = None
  #__patsflab_list0_rforeach
  ats2pypre_list_rforeach(arg0, arg1)
  return#_void


def ats2pypre_ML_list0_rforeach_method(arg0):
  tmpret60 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list0_rforeach_method
  tmpret60 = _ats2pypre_ML_list0_patsfun_39__closurerize(arg0)
  return tmpret60


def _ats2pypre_ML_list0_patsfun_39(env0, arg0):
  funlab_py = None
  tmplab_py = None
  #__patsflab__ats2pypre_ML_list0_patsfun_39
  ats2pypre_ML_list0_rforeach(env0, arg0)
  return#_void


def ats2pypre_ML_list0_filter(arg0, arg1):
  tmpret62 = None
  tmp63 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list0_filter
  tmp63 = ats2pypre_list_filter(arg0, arg1)
  tmpret62 = tmp63
  return tmpret62


def ats2pypre_ML_list0_filter_method(arg0):
  tmpret64 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list0_filter_method
  tmpret64 = _ats2pypre_ML_list0_patsfun_42__closurerize(arg0)
  return tmpret64


def _ats2pypre_ML_list0_patsfun_42(env0, arg0):
  tmpret65 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab__ats2pypre_ML_list0_patsfun_42
  tmpret65 = ats2pypre_ML_list0_filter(env0, arg0)
  return tmpret65


def ats2pypre_ML_list0_map(arg0, arg1):
  tmpret66 = None
  tmp67 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list0_map
  tmp67 = ats2pypre_list_map(arg0, arg1)
  tmpret66 = tmp67
  return tmpret66


def ats2pypre_ML_list0_map_method(arg0, arg1):
  tmpret68 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list0_map_method
  tmpret68 = _ats2pypre_ML_list0_patsfun_45__closurerize(arg0)
  return tmpret68


def _ats2pypre_ML_list0_patsfun_45(env0, arg0):
  tmpret69 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab__ats2pypre_ML_list0_patsfun_45
  tmpret69 = ats2pypre_ML_list0_map(env0, arg0)
  return tmpret69


def ats2pypre_ML_list0_foldleft(arg0, arg1, arg2):
  tmpret70 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list0_foldleft
  tmpret70 = _ats2pypre_ML_list0_aux_47(arg2, arg1, arg0)
  return tmpret70


def _ats2pypre_ML_list0_aux_47(env0, arg0, arg1):
  apy0 = None
  apy1 = None
  tmpret71 = None
  tmp72 = None
  tmp73 = None
  tmp74 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  def __atstmplab22():
    nonlocal env0, arg0, arg1
    nonlocal apy0, apy1, tmpret71, tmp72, tmp73, tmp74
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    if(ATSCKptriscons(arg1)): tmplab_py = 4 ; return#__atstmplab25
    __atstmplab23()
    return
  def __atstmplab23():
    nonlocal env0, arg0, arg1
    nonlocal apy0, apy1, tmpret71, tmp72, tmp73, tmp74
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmpret71 = arg0
    return
  def __atstmplab24():
    nonlocal env0, arg0, arg1
    nonlocal apy0, apy1, tmpret71, tmp72, tmp73, tmp74
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    __atstmplab25()
    return
  def __atstmplab25():
    nonlocal env0, arg0, arg1
    nonlocal apy0, apy1, tmpret71, tmp72, tmp73, tmp74
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmp72 = arg1[0]
    tmp73 = arg1[1]
    tmp74 = env0[0](env0, arg0, tmp72)
    #ATStailcalseq_beg
    apy0 = tmp74
    apy1 = tmp73
    arg0 = apy0
    arg1 = apy1
    funlab_py = 1 #__patsflab__ats2pypre_ML_list0_aux_47
    #ATStailcalseq_end
    return
  mbranch_1 = { 1: __atstmplab22, 2: __atstmplab23, 3: __atstmplab24, 4: __atstmplab25 }
  while(1):
    funlab_py = 0
    #__patsflab__ats2pypre_ML_list0_aux_47
    #ATScaseofseq_beg
    tmplab_py = 1
    while(1):
      mbranch_1.get(tmplab_py)()
      if (tmplab_py == 0): break
    #ATScaseofseq_end
    if (funlab_py == 0): break
  return tmpret71


def ats2pypre_ML_list0_foldright(arg0, arg1, arg2):
  tmpret75 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list0_foldright
  tmpret75 = _ats2pypre_ML_list0_aux_49(arg1, arg2, arg0, arg2)
  return tmpret75


def _ats2pypre_ML_list0_aux_49(env0, env1, arg0, arg1):
  tmpret76 = None
  tmp77 = None
  tmp78 = None
  tmp79 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  def __atstmplab26():
    nonlocal env0, env1, arg0, arg1
    nonlocal tmpret76, tmp77, tmp78, tmp79
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    if(ATSCKptriscons(arg0)): tmplab_py = 4 ; return#__atstmplab29
    __atstmplab27()
    return
  def __atstmplab27():
    nonlocal env0, env1, arg0, arg1
    nonlocal tmpret76, tmp77, tmp78, tmp79
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmpret76 = arg1
    return
  def __atstmplab28():
    nonlocal env0, env1, arg0, arg1
    nonlocal tmpret76, tmp77, tmp78, tmp79
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    __atstmplab29()
    return
  def __atstmplab29():
    nonlocal env0, env1, arg0, arg1
    nonlocal tmpret76, tmp77, tmp78, tmp79
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmp77 = arg0[0]
    tmp78 = arg0[1]
    tmp79 = _ats2pypre_ML_list0_aux_49(env0, env1, tmp78, env1)
    tmpret76 = env0[0](env0, tmp77, tmp79)
    return
  mbranch_1 = { 1: __atstmplab26, 2: __atstmplab27, 3: __atstmplab28, 4: __atstmplab29 }
  #__patsflab__ats2pypre_ML_list0_aux_49
  #ATScaseofseq_beg
  tmplab_py = 1
  while(1):
    mbranch_1.get(tmplab_py)()
    if (tmplab_py == 0): break
  #ATScaseofseq_end
  return tmpret76

######
##
## end-of-compilation-unit
##
######
