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
######
#ATSextcode_end()
######

def _ats2pypre_list_patsfun_29__closurerize(env0):
  def _ats2pypre_list_patsfun_29__cfun(cenv, arg0): return _ats2pypre_list_patsfun_29(cenv[1], arg0)
  return (_ats2pypre_list_patsfun_29__cfun, env0)

def _ats2pypre_list_patsfun_33__closurerize(env0):
  def _ats2pypre_list_patsfun_33__cfun(cenv, arg0): return _ats2pypre_list_patsfun_33(cenv[1], arg0)
  return (_ats2pypre_list_patsfun_33__cfun, env0)

def _ats2pypre_list_patsfun_36__closurerize(env0):
  def _ats2pypre_list_patsfun_36__cfun(cenv, arg0): return _ats2pypre_list_patsfun_36(cenv[1], arg0)
  return (_ats2pypre_list_patsfun_36__cfun, env0)

def _ats2pypre_list_patsfun_40__closurerize(env0):
  def _ats2pypre_list_patsfun_40__cfun(cenv, arg0): return _ats2pypre_list_patsfun_40(cenv[1], arg0)
  return (_ats2pypre_list_patsfun_40__cfun, env0)

def _ats2pypre_list_patsfun_44__closurerize(env0):
  def _ats2pypre_list_patsfun_44__cfun(cenv, arg0): return _ats2pypre_list_patsfun_44(cenv[1], arg0)
  return (_ats2pypre_list_patsfun_44__cfun, env0)

def _ats2pypre_list_patsfun_48__closurerize(env0):
  def _ats2pypre_list_patsfun_48__cfun(cenv, arg0): return _ats2pypre_list_patsfun_48(cenv[1], arg0)
  return (_ats2pypre_list_patsfun_48__cfun, env0)

def _ats2pypre_list_patsfun_51__closurerize(env0):
  def _ats2pypre_list_patsfun_51__cfun(cenv, arg0): return _ats2pypre_list_patsfun_51(cenv[1], arg0)
  return (_ats2pypre_list_patsfun_51__cfun, env0)

def _ats2pypre_list_patsfun_55__closurerize(env0):
  def _ats2pypre_list_patsfun_55__cfun(cenv, arg0): return _ats2pypre_list_patsfun_55(cenv[1], arg0)
  return (_ats2pypre_list_patsfun_55__cfun, env0)

def _ats2pypre_list_patsfun_59__closurerize(env0):
  def _ats2pypre_list_patsfun_59__cfun(cenv, arg0): return _ats2pypre_list_patsfun_59(cenv[1], arg0)
  return (_ats2pypre_list_patsfun_59__cfun, env0)

def _ats2pypre_list_patsfun_63__closurerize(env0, env1):
  def _ats2pypre_list_patsfun_63__cfun(cenv, arg0): return _ats2pypre_list_patsfun_63(cenv[1], cenv[2], arg0)
  return (_ats2pypre_list_patsfun_63__cfun, env0, env1)

def _ats2pypre_list_patsfun_67__closurerize(env0, env1):
  def _ats2pypre_list_patsfun_67__cfun(cenv, arg0): return _ats2pypre_list_patsfun_67(cenv[1], cenv[2], arg0)
  return (_ats2pypre_list_patsfun_67__cfun, env0, env1)

def _ats2pypre_list_patsfun_71__closurerize(env0, env1):
  def _ats2pypre_list_patsfun_71__cfun(cenv, arg0): return _ats2pypre_list_patsfun_71(cenv[1], cenv[2], arg0)
  return (_ats2pypre_list_patsfun_71__cfun, env0, env1)

def _ats2pypre_list_patsfun_75__closurerize(env0, env1):
  def _ats2pypre_list_patsfun_75__cfun(cenv, arg0): return _ats2pypre_list_patsfun_75(cenv[1], cenv[2], arg0)
  return (_ats2pypre_list_patsfun_75__cfun, env0, env1)

def ats2pypre_list_make_intrange_2(arg0, arg1):
  tmpret2 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list_make_intrange_2
  tmpret2 = ats2pypre_list_make_intrange_3(arg0, arg1, 1)
  return tmpret2


def ats2pypre_list_make_intrange_3(arg0, arg1, arg2):
  tmpret3 = None
  tmp14 = None
  tmp15 = None
  tmp16 = None
  tmp17 = None
  tmp18 = None
  tmp19 = None
  tmp20 = None
  tmp21 = None
  tmp22 = None
  tmp23 = None
  tmp24 = None
  tmp25 = None
  tmp26 = None
  tmp27 = None
  tmp28 = None
  tmp29 = None
  tmp30 = None
  tmp31 = None
  tmp32 = None
  tmp33 = None
  tmp34 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  def __atstmplab6():
    nonlocal arg0, arg1, arg2
    nonlocal tmpret3, tmp14, tmp15, tmp16, tmp17, tmp18, tmp19, tmp20, tmp21, tmp22, tmp23, tmp24, tmp25, tmp26, tmp27, tmp28, tmp29, tmp30, tmp31, tmp32, tmp33, tmp34
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmp14 = ats2pypre_gt_int0_int0(arg2, 0)
    if not(ATSCKpat_bool(tmp14, True)): tmplab_py = 2 ; return#__atstmplab7
    tmp15 = ats2pypre_lt_int0_int0(arg0, arg1)
    if (tmp15):
      tmp19 = ats2pypre_sub_int0_int0(arg1, arg0)
      tmp18 = ats2pypre_add_int0_int0(tmp19, arg2)
      tmp17 = ats2pypre_sub_int0_int0(tmp18, 1)
      tmp16 = ats2pypre_div_int0_int0(tmp17, arg2)
      tmp22 = ats2pypre_sub_int0_int0(tmp16, 1)
      tmp21 = ats2pypre_mul_int0_int0(tmp22, arg2)
      tmp20 = ats2pypre_add_int0_int0(arg0, tmp21)
      tmp23 = None
      tmpret3 = _ats2pypre_list_loop1_4(tmp16, tmp20, arg2, tmp23)
    else:
      tmpret3 = None
    #endif
    return
  def __atstmplab7():
    nonlocal arg0, arg1, arg2
    nonlocal tmpret3, tmp14, tmp15, tmp16, tmp17, tmp18, tmp19, tmp20, tmp21, tmp22, tmp23, tmp24, tmp25, tmp26, tmp27, tmp28, tmp29, tmp30, tmp31, tmp32, tmp33, tmp34
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmp24 = ats2pypre_lt_int0_int0(arg2, 0)
    if not(ATSCKpat_bool(tmp24, True)): tmplab_py = 3 ; return#__atstmplab8
    tmp25 = ats2pypre_gt_int0_int0(arg0, arg1)
    if (tmp25):
      tmp26 = ats2pypre_neg_int0(arg2)
      tmp30 = ats2pypre_sub_int0_int0(arg0, arg1)
      tmp29 = ats2pypre_add_int0_int0(tmp30, tmp26)
      tmp28 = ats2pypre_sub_int0_int0(tmp29, 1)
      tmp27 = ats2pypre_div_int0_int0(tmp28, tmp26)
      tmp33 = ats2pypre_sub_int0_int0(tmp27, 1)
      tmp32 = ats2pypre_mul_int0_int0(tmp33, tmp26)
      tmp31 = ats2pypre_sub_int0_int0(arg0, tmp32)
      tmp34 = None
      tmpret3 = _ats2pypre_list_loop2_5(tmp27, tmp31, tmp26, tmp34)
    else:
      tmpret3 = None
    #endif
    return
  def __atstmplab8():
    nonlocal arg0, arg1, arg2
    nonlocal tmpret3, tmp14, tmp15, tmp16, tmp17, tmp18, tmp19, tmp20, tmp21, tmp22, tmp23, tmp24, tmp25, tmp26, tmp27, tmp28, tmp29, tmp30, tmp31, tmp32, tmp33, tmp34
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmpret3 = None
    return
  mbranch_1 = { 1: __atstmplab6, 2: __atstmplab7, 3: __atstmplab8 }
  #__patsflab_list_make_intrange_3
  #ATScaseofseq_beg
  tmplab_py = 1
  while(1):
    mbranch_1.get(tmplab_py)()
    if (tmplab_py == 0): break
  #ATScaseofseq_end
  return tmpret3


def _ats2pypre_list_loop1_4(arg0, arg1, arg2, arg3):
  apy0 = None
  apy1 = None
  apy2 = None
  apy3 = None
  tmpret4 = None
  tmp5 = None
  tmp6 = None
  tmp7 = None
  tmp8 = None
  funlab_py = None
  tmplab_py = None
  while(1):
    funlab_py = 0
    #__patsflab__ats2pypre_list_loop1_4
    tmp5 = ats2pypre_gt_int0_int0(arg0, 0)
    if (tmp5):
      tmp6 = ats2pypre_sub_int0_int0(arg0, 1)
      tmp7 = ats2pypre_sub_int0_int0(arg1, arg2)
      tmp8 = (arg1, arg3)
      #ATStailcalseq_beg
      apy0 = tmp6
      apy1 = tmp7
      apy2 = arg2
      apy3 = tmp8
      arg0 = apy0
      arg1 = apy1
      arg2 = apy2
      arg3 = apy3
      funlab_py = 1 #__patsflab__ats2pypre_list_loop1_4
      #ATStailcalseq_end
    else:
      tmpret4 = arg3
    #endif
    if (funlab_py == 0): break
  return tmpret4


def _ats2pypre_list_loop2_5(arg0, arg1, arg2, arg3):
  apy0 = None
  apy1 = None
  apy2 = None
  apy3 = None
  tmpret9 = None
  tmp10 = None
  tmp11 = None
  tmp12 = None
  tmp13 = None
  funlab_py = None
  tmplab_py = None
  while(1):
    funlab_py = 0
    #__patsflab__ats2pypre_list_loop2_5
    tmp10 = ats2pypre_gt_int0_int0(arg0, 0)
    if (tmp10):
      tmp11 = ats2pypre_sub_int0_int0(arg0, 1)
      tmp12 = ats2pypre_add_int0_int0(arg1, arg2)
      tmp13 = (arg1, arg3)
      #ATStailcalseq_beg
      apy0 = tmp11
      apy1 = tmp12
      apy2 = arg2
      apy3 = tmp13
      arg0 = apy0
      arg1 = apy1
      arg2 = apy2
      arg3 = apy3
      funlab_py = 1 #__patsflab__ats2pypre_list_loop2_5
      #ATStailcalseq_end
    else:
      tmpret9 = arg3
    #endif
    if (funlab_py == 0): break
  return tmpret9


def ats2pypre_list_length(arg0):
  tmpret46 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list_length
  tmpret46 = _ats2pypre_list_loop_12(arg0, 0)
  return tmpret46


def _ats2pypre_list_loop_12(arg0, arg1):
  apy0 = None
  apy1 = None
  tmpret47 = None
  tmp49 = None
  tmp50 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  def __atstmplab13():
    nonlocal arg0, arg1
    nonlocal apy0, apy1, tmpret47, tmp49, tmp50
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    if(ATSCKptriscons(arg0)): tmplab_py = 4 ; return#__atstmplab16
    __atstmplab14()
    return
  def __atstmplab14():
    nonlocal arg0, arg1
    nonlocal apy0, apy1, tmpret47, tmp49, tmp50
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmpret47 = arg1
    return
  def __atstmplab15():
    nonlocal arg0, arg1
    nonlocal apy0, apy1, tmpret47, tmp49, tmp50
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    __atstmplab16()
    return
  def __atstmplab16():
    nonlocal arg0, arg1
    nonlocal apy0, apy1, tmpret47, tmp49, tmp50
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmp49 = arg0[1]
    tmp50 = ats2pypre_add_int1_int1(arg1, 1)
    #ATStailcalseq_beg
    apy0 = tmp49
    apy1 = tmp50
    arg0 = apy0
    arg1 = apy1
    funlab_py = 1 #__patsflab__ats2pypre_list_loop_12
    #ATStailcalseq_end
    return
  mbranch_1 = { 1: __atstmplab13, 2: __atstmplab14, 3: __atstmplab15, 4: __atstmplab16 }
  while(1):
    funlab_py = 0
    #__patsflab__ats2pypre_list_loop_12
    #ATScaseofseq_beg
    tmplab_py = 1
    while(1):
      mbranch_1.get(tmplab_py)()
      if (tmplab_py == 0): break
    #ATScaseofseq_end
    if (funlab_py == 0): break
  return tmpret47


def ats2pypre_list_last(arg0):
  apy0 = None
  tmpret51 = None
  tmp52 = None
  tmp53 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  def __atstmplab17():
    nonlocal arg0
    nonlocal apy0, tmpret51, tmp52, tmp53
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    if(ATSCKptriscons(tmp53)): tmplab_py = 4 ; return#__atstmplab20
    __atstmplab18()
    return
  def __atstmplab18():
    nonlocal arg0
    nonlocal apy0, tmpret51, tmp52, tmp53
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmpret51 = tmp52
    return
  def __atstmplab19():
    nonlocal arg0
    nonlocal apy0, tmpret51, tmp52, tmp53
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    __atstmplab20()
    return
  def __atstmplab20():
    nonlocal arg0
    nonlocal apy0, tmpret51, tmp52, tmp53
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    #ATStailcalseq_beg
    apy0 = tmp53
    arg0 = apy0
    funlab_py = 1 #__patsflab_list_last
    #ATStailcalseq_end
    return
  mbranch_1 = { 1: __atstmplab17, 2: __atstmplab18, 3: __atstmplab19, 4: __atstmplab20 }
  while(1):
    funlab_py = 0
    #__patsflab_list_last
    tmp52 = arg0[0]
    tmp53 = arg0[1]
    #ATScaseofseq_beg
    tmplab_py = 1
    while(1):
      mbranch_1.get(tmplab_py)()
      if (tmplab_py == 0): break
    #ATScaseofseq_end
    if (funlab_py == 0): break
  return tmpret51


def ats2pypre_list_get_at(arg0, arg1):
  apy0 = None
  apy1 = None
  tmpret54 = None
  tmp55 = None
  tmp56 = None
  tmp57 = None
  tmp58 = None
  funlab_py = None
  tmplab_py = None
  while(1):
    funlab_py = 0
    #__patsflab_list_get_at
    tmp55 = ats2pypre_eq_int1_int1(arg1, 0)
    if (tmp55):
      tmp56 = arg0[0]
      tmpret54 = tmp56
    else:
      tmp57 = arg0[1]
      tmp58 = ats2pypre_sub_int1_int1(arg1, 1)
      #ATStailcalseq_beg
      apy0 = tmp57
      apy1 = tmp58
      arg0 = apy0
      arg1 = apy1
      funlab_py = 1 #__patsflab_list_get_at
      #ATStailcalseq_end
    #endif
    if (funlab_py == 0): break
  return tmpret54


def ats2pypre_list_snoc(arg0, arg1):
  tmpret59 = None
  tmp60 = None
  tmp61 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list_snoc
  tmp61 = None
  tmp60 = (arg1, tmp61)
  tmpret59 = ats2pypre_list_append(arg0, tmp60)
  return tmpret59


def ats2pypre_list_extend(arg0, arg1):
  tmpret62 = None
  tmp63 = None
  tmp64 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list_extend
  tmp64 = None
  tmp63 = (arg1, tmp64)
  tmpret62 = ats2pypre_list_append(arg0, tmp63)
  return tmpret62


def ats2pypre_list_append(arg0, arg1):
  tmpret65 = None
  tmp66 = None
  tmp67 = None
  tmp68 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  def __atstmplab21():
    nonlocal arg0, arg1
    nonlocal tmpret65, tmp66, tmp67, tmp68
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    if(ATSCKptriscons(arg0)): tmplab_py = 4 ; return#__atstmplab24
    __atstmplab22()
    return
  def __atstmplab22():
    nonlocal arg0, arg1
    nonlocal tmpret65, tmp66, tmp67, tmp68
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmpret65 = arg1
    return
  def __atstmplab23():
    nonlocal arg0, arg1
    nonlocal tmpret65, tmp66, tmp67, tmp68
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    __atstmplab24()
    return
  def __atstmplab24():
    nonlocal arg0, arg1
    nonlocal tmpret65, tmp66, tmp67, tmp68
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmp66 = arg0[0]
    tmp67 = arg0[1]
    tmp68 = ats2pypre_list_append(tmp67, arg1)
    tmpret65 = (tmp66, tmp68)
    return
  mbranch_1 = { 1: __atstmplab21, 2: __atstmplab22, 3: __atstmplab23, 4: __atstmplab24 }
  #__patsflab_list_append
  #ATScaseofseq_beg
  tmplab_py = 1
  while(1):
    mbranch_1.get(tmplab_py)()
    if (tmplab_py == 0): break
  #ATScaseofseq_end
  return tmpret65


def ats2pypre_list_reverse(arg0):
  tmpret69 = None
  tmp70 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list_reverse
  tmp70 = None
  tmpret69 = ats2pypre_list_reverse_append(arg0, tmp70)
  return tmpret69


def ats2pypre_list_reverse_append(arg0, arg1):
  tmpret71 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list_reverse_append
  tmpret71 = _ats2pypre_list_loop_20(arg0, arg1)
  return tmpret71


def _ats2pypre_list_loop_20(arg0, arg1):
  apy0 = None
  apy1 = None
  tmpret72 = None
  tmp73 = None
  tmp74 = None
  tmp75 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  def __atstmplab25():
    nonlocal arg0, arg1
    nonlocal apy0, apy1, tmpret72, tmp73, tmp74, tmp75
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    if(ATSCKptriscons(arg0)): tmplab_py = 4 ; return#__atstmplab28
    __atstmplab26()
    return
  def __atstmplab26():
    nonlocal arg0, arg1
    nonlocal apy0, apy1, tmpret72, tmp73, tmp74, tmp75
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmpret72 = arg1
    return
  def __atstmplab27():
    nonlocal arg0, arg1
    nonlocal apy0, apy1, tmpret72, tmp73, tmp74, tmp75
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    __atstmplab28()
    return
  def __atstmplab28():
    nonlocal arg0, arg1
    nonlocal apy0, apy1, tmpret72, tmp73, tmp74, tmp75
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmp73 = arg0[0]
    tmp74 = arg0[1]
    tmp75 = (tmp73, arg1)
    #ATStailcalseq_beg
    apy0 = tmp74
    apy1 = tmp75
    arg0 = apy0
    arg1 = apy1
    funlab_py = 1 #__patsflab__ats2pypre_list_loop_20
    #ATStailcalseq_end
    return
  mbranch_1 = { 1: __atstmplab25, 2: __atstmplab26, 3: __atstmplab27, 4: __atstmplab28 }
  while(1):
    funlab_py = 0
    #__patsflab__ats2pypre_list_loop_20
    #ATScaseofseq_beg
    tmplab_py = 1
    while(1):
      mbranch_1.get(tmplab_py)()
      if (tmplab_py == 0): break
    #ATScaseofseq_end
    if (funlab_py == 0): break
  return tmpret72


def ats2pypre_list_take(arg0, arg1):
  tmpret76 = None
  tmp77 = None
  tmp78 = None
  tmp79 = None
  tmp80 = None
  tmp81 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list_take
  tmp77 = ats2pypre_gt_int1_int1(arg1, 0)
  if (tmp77):
    tmp78 = arg0[0]
    tmp79 = arg0[1]
    tmp81 = ats2pypre_sub_int1_int1(arg1, 1)
    tmp80 = ats2pypre_list_take(tmp79, tmp81)
    tmpret76 = (tmp78, tmp80)
  else:
    tmpret76 = None
  #endif
  return tmpret76


def ats2pypre_list_drop(arg0, arg1):
  apy0 = None
  apy1 = None
  tmpret82 = None
  tmp83 = None
  tmp84 = None
  tmp85 = None
  funlab_py = None
  tmplab_py = None
  while(1):
    funlab_py = 0
    #__patsflab_list_drop
    tmp83 = ats2pypre_gt_int1_int1(arg1, 0)
    if (tmp83):
      tmp84 = arg0[1]
      tmp85 = ats2pypre_sub_int1_int1(arg1, 1)
      #ATStailcalseq_beg
      apy0 = tmp84
      apy1 = tmp85
      arg0 = apy0
      arg1 = apy1
      funlab_py = 1 #__patsflab_list_drop
      #ATStailcalseq_end
    else:
      tmpret82 = arg0
    #endif
    if (funlab_py == 0): break
  return tmpret82


def ats2pypre_list_split_at(arg0, arg1):
  tmpret86 = None
  tmp87 = None
  tmp88 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list_split_at
  tmp87 = ats2pypre_list_take(arg0, arg1)
  tmp88 = ats2pypre_list_drop(arg0, arg1)
  tmpret86 = (tmp87, tmp88)
  return tmpret86


def ats2pypre_list_insert_at(arg0, arg1, arg2):
  tmpret89 = None
  tmp90 = None
  tmp91 = None
  tmp92 = None
  tmp93 = None
  tmp94 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list_insert_at
  tmp90 = ats2pypre_gt_int1_int1(arg1, 0)
  if (tmp90):
    tmp91 = arg0[0]
    tmp92 = arg0[1]
    tmp94 = ats2pypre_sub_int1_int1(arg1, 1)
    tmp93 = ats2pypre_list_insert_at(tmp92, tmp94, arg2)
    tmpret89 = (tmp91, tmp93)
  else:
    tmpret89 = (arg2, arg0)
  #endif
  return tmpret89


def ats2pypre_list_remove_at(arg0, arg1):
  tmpret95 = None
  tmp96 = None
  tmp97 = None
  tmp98 = None
  tmp99 = None
  tmp100 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list_remove_at
  tmp96 = arg0[0]
  tmp97 = arg0[1]
  tmp98 = ats2pypre_gt_int1_int1(arg1, 0)
  if (tmp98):
    tmp100 = ats2pypre_sub_int1_int1(arg1, 1)
    tmp99 = ats2pypre_list_remove_at(tmp97, tmp100)
    tmpret95 = (tmp96, tmp99)
  else:
    tmpret95 = tmp97
  #endif
  return tmpret95


def ats2pypre_list_takeout_at(arg0, arg1):
  tmpret101 = None
  tmp102 = None
  tmp103 = None
  tmp104 = None
  tmp105 = None
  tmp106 = None
  tmp107 = None
  tmp108 = None
  tmp109 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list_takeout_at
  tmp102 = arg0[0]
  tmp103 = arg0[1]
  tmp104 = ats2pypre_gt_int1_int1(arg1, 0)
  if (tmp104):
    tmp106 = ats2pypre_sub_int1_int1(arg1, 1)
    tmp105 = ats2pypre_list_takeout_at(tmp103, tmp106)
    tmp107 = tmp105[0]
    tmp108 = tmp105[1]
    tmp109 = (tmp102, tmp108)
    tmpret101 = (tmp107, tmp109)
  else:
    tmpret101 = (tmp102, tmp103)
  #endif
  return tmpret101


def ats2pypre_list_exists(arg0, arg1):
  apy0 = None
  apy1 = None
  tmpret110 = None
  tmp111 = None
  tmp112 = None
  tmp113 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  def __atstmplab29():
    nonlocal arg0, arg1
    nonlocal apy0, apy1, tmpret110, tmp111, tmp112, tmp113
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    if(ATSCKptriscons(arg0)): tmplab_py = 4 ; return#__atstmplab32
    __atstmplab30()
    return
  def __atstmplab30():
    nonlocal arg0, arg1
    nonlocal apy0, apy1, tmpret110, tmp111, tmp112, tmp113
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmpret110 = False
    return
  def __atstmplab31():
    nonlocal arg0, arg1
    nonlocal apy0, apy1, tmpret110, tmp111, tmp112, tmp113
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    __atstmplab32()
    return
  def __atstmplab32():
    nonlocal arg0, arg1
    nonlocal apy0, apy1, tmpret110, tmp111, tmp112, tmp113
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmp111 = arg0[0]
    tmp112 = arg0[1]
    tmp113 = arg1[0](arg1, tmp111)
    if (tmp113):
      tmpret110 = True
    else:
      #ATStailcalseq_beg
      apy0 = tmp112
      apy1 = arg1
      arg0 = apy0
      arg1 = apy1
      funlab_py = 1 #__patsflab_list_exists
      #ATStailcalseq_end
    #endif
    return
  mbranch_1 = { 1: __atstmplab29, 2: __atstmplab30, 3: __atstmplab31, 4: __atstmplab32 }
  while(1):
    funlab_py = 0
    #__patsflab_list_exists
    #ATScaseofseq_beg
    tmplab_py = 1
    while(1):
      mbranch_1.get(tmplab_py)()
      if (tmplab_py == 0): break
    #ATScaseofseq_end
    if (funlab_py == 0): break
  return tmpret110


def ats2pypre_list_exists_method(arg0):
  tmpret114 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list_exists_method
  tmpret114 = _ats2pypre_list_patsfun_29__closurerize(arg0)
  return tmpret114


def _ats2pypre_list_patsfun_29(env0, arg0):
  tmpret115 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab__ats2pypre_list_patsfun_29
  tmpret115 = ats2pypre_list_exists(env0, arg0)
  return tmpret115


def ats2pypre_list_iexists(arg0, arg1):
  tmpret116 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list_iexists
  tmpret116 = _ats2pypre_list_loop_31(arg1, 0, arg0)
  return tmpret116


def _ats2pypre_list_loop_31(env0, arg0, arg1):
  apy0 = None
  apy1 = None
  tmpret117 = None
  tmp118 = None
  tmp119 = None
  tmp120 = None
  tmp121 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  def __atstmplab33():
    nonlocal env0, arg0, arg1
    nonlocal apy0, apy1, tmpret117, tmp118, tmp119, tmp120, tmp121
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    if(ATSCKptriscons(arg1)): tmplab_py = 4 ; return#__atstmplab36
    __atstmplab34()
    return
  def __atstmplab34():
    nonlocal env0, arg0, arg1
    nonlocal apy0, apy1, tmpret117, tmp118, tmp119, tmp120, tmp121
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmpret117 = False
    return
  def __atstmplab35():
    nonlocal env0, arg0, arg1
    nonlocal apy0, apy1, tmpret117, tmp118, tmp119, tmp120, tmp121
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    __atstmplab36()
    return
  def __atstmplab36():
    nonlocal env0, arg0, arg1
    nonlocal apy0, apy1, tmpret117, tmp118, tmp119, tmp120, tmp121
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmp118 = arg1[0]
    tmp119 = arg1[1]
    tmp120 = env0[0](env0, arg0, tmp118)
    if (tmp120):
      tmpret117 = True
    else:
      tmp121 = ats2pypre_add_int1_int1(arg0, 1)
      #ATStailcalseq_beg
      apy0 = tmp121
      apy1 = tmp119
      arg0 = apy0
      arg1 = apy1
      funlab_py = 1 #__patsflab__ats2pypre_list_loop_31
      #ATStailcalseq_end
    #endif
    return
  mbranch_1 = { 1: __atstmplab33, 2: __atstmplab34, 3: __atstmplab35, 4: __atstmplab36 }
  while(1):
    funlab_py = 0
    #__patsflab__ats2pypre_list_loop_31
    #ATScaseofseq_beg
    tmplab_py = 1
    while(1):
      mbranch_1.get(tmplab_py)()
      if (tmplab_py == 0): break
    #ATScaseofseq_end
    if (funlab_py == 0): break
  return tmpret117


def ats2pypre_list_iexists_method(arg0):
  tmpret122 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list_iexists_method
  tmpret122 = _ats2pypre_list_patsfun_33__closurerize(arg0)
  return tmpret122


def _ats2pypre_list_patsfun_33(env0, arg0):
  tmpret123 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab__ats2pypre_list_patsfun_33
  tmpret123 = ats2pypre_list_iexists(env0, arg0)
  return tmpret123


def ats2pypre_list_forall(arg0, arg1):
  apy0 = None
  apy1 = None
  tmpret124 = None
  tmp125 = None
  tmp126 = None
  tmp127 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  def __atstmplab37():
    nonlocal arg0, arg1
    nonlocal apy0, apy1, tmpret124, tmp125, tmp126, tmp127
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    if(ATSCKptriscons(arg0)): tmplab_py = 4 ; return#__atstmplab40
    __atstmplab38()
    return
  def __atstmplab38():
    nonlocal arg0, arg1
    nonlocal apy0, apy1, tmpret124, tmp125, tmp126, tmp127
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmpret124 = True
    return
  def __atstmplab39():
    nonlocal arg0, arg1
    nonlocal apy0, apy1, tmpret124, tmp125, tmp126, tmp127
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    __atstmplab40()
    return
  def __atstmplab40():
    nonlocal arg0, arg1
    nonlocal apy0, apy1, tmpret124, tmp125, tmp126, tmp127
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmp125 = arg0[0]
    tmp126 = arg0[1]
    tmp127 = arg1[0](arg1, tmp125)
    if (tmp127):
      #ATStailcalseq_beg
      apy0 = tmp126
      apy1 = arg1
      arg0 = apy0
      arg1 = apy1
      funlab_py = 1 #__patsflab_list_forall
      #ATStailcalseq_end
    else:
      tmpret124 = False
    #endif
    return
  mbranch_1 = { 1: __atstmplab37, 2: __atstmplab38, 3: __atstmplab39, 4: __atstmplab40 }
  while(1):
    funlab_py = 0
    #__patsflab_list_forall
    #ATScaseofseq_beg
    tmplab_py = 1
    while(1):
      mbranch_1.get(tmplab_py)()
      if (tmplab_py == 0): break
    #ATScaseofseq_end
    if (funlab_py == 0): break
  return tmpret124


def ats2pypre_list_forall_method(arg0):
  tmpret128 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list_forall_method
  tmpret128 = _ats2pypre_list_patsfun_36__closurerize(arg0)
  return tmpret128


def _ats2pypre_list_patsfun_36(env0, arg0):
  tmpret129 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab__ats2pypre_list_patsfun_36
  tmpret129 = ats2pypre_list_forall(env0, arg0)
  return tmpret129


def ats2pypre_list_iforall(arg0, arg1):
  tmpret130 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list_iforall
  tmpret130 = _ats2pypre_list_loop_38(arg1, 0, arg0)
  return tmpret130


def _ats2pypre_list_loop_38(env0, arg0, arg1):
  apy0 = None
  apy1 = None
  tmpret131 = None
  tmp132 = None
  tmp133 = None
  tmp134 = None
  tmp135 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  def __atstmplab41():
    nonlocal env0, arg0, arg1
    nonlocal apy0, apy1, tmpret131, tmp132, tmp133, tmp134, tmp135
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    if(ATSCKptriscons(arg1)): tmplab_py = 4 ; return#__atstmplab44
    __atstmplab42()
    return
  def __atstmplab42():
    nonlocal env0, arg0, arg1
    nonlocal apy0, apy1, tmpret131, tmp132, tmp133, tmp134, tmp135
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmpret131 = True
    return
  def __atstmplab43():
    nonlocal env0, arg0, arg1
    nonlocal apy0, apy1, tmpret131, tmp132, tmp133, tmp134, tmp135
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    __atstmplab44()
    return
  def __atstmplab44():
    nonlocal env0, arg0, arg1
    nonlocal apy0, apy1, tmpret131, tmp132, tmp133, tmp134, tmp135
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmp132 = arg1[0]
    tmp133 = arg1[1]
    tmp134 = env0[0](env0, arg0, tmp132)
    if (tmp134):
      tmp135 = ats2pypre_add_int1_int1(arg0, 1)
      #ATStailcalseq_beg
      apy0 = tmp135
      apy1 = tmp133
      arg0 = apy0
      arg1 = apy1
      funlab_py = 1 #__patsflab__ats2pypre_list_loop_38
      #ATStailcalseq_end
    else:
      tmpret131 = False
    #endif
    return
  mbranch_1 = { 1: __atstmplab41, 2: __atstmplab42, 3: __atstmplab43, 4: __atstmplab44 }
  while(1):
    funlab_py = 0
    #__patsflab__ats2pypre_list_loop_38
    #ATScaseofseq_beg
    tmplab_py = 1
    while(1):
      mbranch_1.get(tmplab_py)()
      if (tmplab_py == 0): break
    #ATScaseofseq_end
    if (funlab_py == 0): break
  return tmpret131


def ats2pypre_list_iforall_method(arg0):
  tmpret136 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list_iforall_method
  tmpret136 = _ats2pypre_list_patsfun_40__closurerize(arg0)
  return tmpret136


def _ats2pypre_list_patsfun_40(env0, arg0):
  tmpret137 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab__ats2pypre_list_patsfun_40
  tmpret137 = ats2pypre_list_iforall(env0, arg0)
  return tmpret137


def ats2pypre_list_app(arg0, arg1):
  funlab_py = None
  tmplab_py = None
  #__patsflab_list_app
  ats2pypre_list_foreach(arg0, arg1)
  return#_void


def ats2pypre_list_foreach(arg0, arg1):
  apy0 = None
  apy1 = None
  tmp140 = None
  tmp141 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  def __atstmplab45():
    nonlocal arg0, arg1
    nonlocal apy0, apy1, tmp140, tmp141
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    if(ATSCKptriscons(arg0)): tmplab_py = 4 ; return#__atstmplab48
    __atstmplab46()
    return
  def __atstmplab46():
    nonlocal arg0, arg1
    nonlocal apy0, apy1, tmp140, tmp141
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    None#ATSINSmove_void
    return
  def __atstmplab47():
    nonlocal arg0, arg1
    nonlocal apy0, apy1, tmp140, tmp141
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    __atstmplab48()
    return
  def __atstmplab48():
    nonlocal arg0, arg1
    nonlocal apy0, apy1, tmp140, tmp141
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmp140 = arg0[0]
    tmp141 = arg0[1]
    arg1[0](arg1, tmp140)
    #ATStailcalseq_beg
    apy0 = tmp141
    apy1 = arg1
    arg0 = apy0
    arg1 = apy1
    funlab_py = 1 #__patsflab_list_foreach
    #ATStailcalseq_end
    return
  mbranch_1 = { 1: __atstmplab45, 2: __atstmplab46, 3: __atstmplab47, 4: __atstmplab48 }
  while(1):
    funlab_py = 0
    #__patsflab_list_foreach
    #ATScaseofseq_beg
    tmplab_py = 1
    while(1):
      mbranch_1.get(tmplab_py)()
      if (tmplab_py == 0): break
    #ATScaseofseq_end
    if (funlab_py == 0): break
  return#_void


def ats2pypre_list_foreach_method(arg0):
  tmpret143 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list_foreach_method
  tmpret143 = _ats2pypre_list_patsfun_44__closurerize(arg0)
  return tmpret143


def _ats2pypre_list_patsfun_44(env0, arg0):
  funlab_py = None
  tmplab_py = None
  #__patsflab__ats2pypre_list_patsfun_44
  ats2pypre_list_foreach(env0, arg0)
  return#_void


def ats2pypre_list_iforeach(arg0, arg1):
  funlab_py = None
  tmplab_py = None
  #__patsflab_list_iforeach
  _ats2pypre_list_aux_46(arg1, 0, arg0)
  return#_void


def _ats2pypre_list_aux_46(env0, arg0, arg1):
  apy0 = None
  apy1 = None
  tmp147 = None
  tmp148 = None
  tmp150 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  def __atstmplab49():
    nonlocal env0, arg0, arg1
    nonlocal apy0, apy1, tmp147, tmp148, tmp150
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    if(ATSCKptriscons(arg1)): tmplab_py = 4 ; return#__atstmplab52
    __atstmplab50()
    return
  def __atstmplab50():
    nonlocal env0, arg0, arg1
    nonlocal apy0, apy1, tmp147, tmp148, tmp150
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    None#ATSINSmove_void
    return
  def __atstmplab51():
    nonlocal env0, arg0, arg1
    nonlocal apy0, apy1, tmp147, tmp148, tmp150
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    __atstmplab52()
    return
  def __atstmplab52():
    nonlocal env0, arg0, arg1
    nonlocal apy0, apy1, tmp147, tmp148, tmp150
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmp147 = arg1[0]
    tmp148 = arg1[1]
    env0[0](env0, arg0, tmp147)
    tmp150 = ats2pypre_add_int0_int0(arg0, 1)
    #ATStailcalseq_beg
    apy0 = tmp150
    apy1 = tmp148
    arg0 = apy0
    arg1 = apy1
    funlab_py = 1 #__patsflab__ats2pypre_list_aux_46
    #ATStailcalseq_end
    return
  mbranch_1 = { 1: __atstmplab49, 2: __atstmplab50, 3: __atstmplab51, 4: __atstmplab52 }
  while(1):
    funlab_py = 0
    #__patsflab__ats2pypre_list_aux_46
    #ATScaseofseq_beg
    tmplab_py = 1
    while(1):
      mbranch_1.get(tmplab_py)()
      if (tmplab_py == 0): break
    #ATScaseofseq_end
    if (funlab_py == 0): break
  return#_void


def ats2pypre_list_iforeach_method(arg0):
  tmpret151 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list_iforeach_method
  tmpret151 = _ats2pypre_list_patsfun_48__closurerize(arg0)
  return tmpret151


def _ats2pypre_list_patsfun_48(env0, arg0):
  funlab_py = None
  tmplab_py = None
  #__patsflab__ats2pypre_list_patsfun_48
  ats2pypre_list_iforeach(env0, arg0)
  return#_void


def ats2pypre_list_rforeach(arg0, arg1):
  tmp154 = None
  tmp155 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  def __atstmplab53():
    nonlocal arg0, arg1
    nonlocal tmp154, tmp155
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    if(ATSCKptriscons(arg0)): tmplab_py = 4 ; return#__atstmplab56
    __atstmplab54()
    return
  def __atstmplab54():
    nonlocal arg0, arg1
    nonlocal tmp154, tmp155
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    None#ATSINSmove_void
    return
  def __atstmplab55():
    nonlocal arg0, arg1
    nonlocal tmp154, tmp155
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    __atstmplab56()
    return
  def __atstmplab56():
    nonlocal arg0, arg1
    nonlocal tmp154, tmp155
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmp154 = arg0[0]
    tmp155 = arg0[1]
    ats2pypre_list_rforeach(tmp155, arg1)
    arg1[0](arg1, tmp154)
    return
  mbranch_1 = { 1: __atstmplab53, 2: __atstmplab54, 3: __atstmplab55, 4: __atstmplab56 }
  #__patsflab_list_rforeach
  #ATScaseofseq_beg
  tmplab_py = 1
  while(1):
    mbranch_1.get(tmplab_py)()
    if (tmplab_py == 0): break
  #ATScaseofseq_end
  return#_void


def ats2pypre_list_rforeach_method(arg0):
  tmpret157 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list_rforeach_method
  tmpret157 = _ats2pypre_list_patsfun_51__closurerize(arg0)
  return tmpret157


def _ats2pypre_list_patsfun_51(env0, arg0):
  funlab_py = None
  tmplab_py = None
  #__patsflab__ats2pypre_list_patsfun_51
  ats2pypre_list_rforeach(env0, arg0)
  return#_void


def ats2pypre_list_filter(arg0, arg1):
  tmpret159 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list_filter
  tmpret159 = _ats2pypre_list_aux_53(arg1, arg0)
  return tmpret159


def _ats2pypre_list_aux_53(env0, arg0):
  apy0 = None
  tmpret160 = None
  tmp161 = None
  tmp162 = None
  tmp163 = None
  tmp164 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  def __atstmplab57():
    nonlocal env0, arg0
    nonlocal apy0, tmpret160, tmp161, tmp162, tmp163, tmp164
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    if(ATSCKptriscons(arg0)): tmplab_py = 4 ; return#__atstmplab60
    __atstmplab58()
    return
  def __atstmplab58():
    nonlocal env0, arg0
    nonlocal apy0, tmpret160, tmp161, tmp162, tmp163, tmp164
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmpret160 = None
    return
  def __atstmplab59():
    nonlocal env0, arg0
    nonlocal apy0, tmpret160, tmp161, tmp162, tmp163, tmp164
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    __atstmplab60()
    return
  def __atstmplab60():
    nonlocal env0, arg0
    nonlocal apy0, tmpret160, tmp161, tmp162, tmp163, tmp164
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmp161 = arg0[0]
    tmp162 = arg0[1]
    tmp163 = env0[0](env0, tmp161)
    if (tmp163):
      tmp164 = _ats2pypre_list_aux_53(env0, tmp162)
      tmpret160 = (tmp161, tmp164)
    else:
      #ATStailcalseq_beg
      apy0 = tmp162
      arg0 = apy0
      funlab_py = 1 #__patsflab__ats2pypre_list_aux_53
      #ATStailcalseq_end
    #endif
    return
  mbranch_1 = { 1: __atstmplab57, 2: __atstmplab58, 3: __atstmplab59, 4: __atstmplab60 }
  while(1):
    funlab_py = 0
    #__patsflab__ats2pypre_list_aux_53
    #ATScaseofseq_beg
    tmplab_py = 1
    while(1):
      mbranch_1.get(tmplab_py)()
      if (tmplab_py == 0): break
    #ATScaseofseq_end
    if (funlab_py == 0): break
  return tmpret160


def ats2pypre_list_filter_method(arg0):
  tmpret165 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list_filter_method
  tmpret165 = _ats2pypre_list_patsfun_55__closurerize(arg0)
  return tmpret165


def _ats2pypre_list_patsfun_55(env0, arg0):
  tmpret166 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab__ats2pypre_list_patsfun_55
  tmpret166 = ats2pypre_list_filter(env0, arg0)
  return tmpret166


def ats2pypre_list_map(arg0, arg1):
  tmpret167 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list_map
  tmpret167 = _ats2pypre_list_aux_57(arg1, arg0)
  return tmpret167


def _ats2pypre_list_aux_57(env0, arg0):
  tmpret168 = None
  tmp169 = None
  tmp170 = None
  tmp171 = None
  tmp172 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  def __atstmplab61():
    nonlocal env0, arg0
    nonlocal tmpret168, tmp169, tmp170, tmp171, tmp172
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    if(ATSCKptriscons(arg0)): tmplab_py = 4 ; return#__atstmplab64
    __atstmplab62()
    return
  def __atstmplab62():
    nonlocal env0, arg0
    nonlocal tmpret168, tmp169, tmp170, tmp171, tmp172
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmpret168 = None
    return
  def __atstmplab63():
    nonlocal env0, arg0
    nonlocal tmpret168, tmp169, tmp170, tmp171, tmp172
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    __atstmplab64()
    return
  def __atstmplab64():
    nonlocal env0, arg0
    nonlocal tmpret168, tmp169, tmp170, tmp171, tmp172
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmp169 = arg0[0]
    tmp170 = arg0[1]
    tmp171 = env0[0](env0, tmp169)
    tmp172 = _ats2pypre_list_aux_57(env0, tmp170)
    tmpret168 = (tmp171, tmp172)
    return
  mbranch_1 = { 1: __atstmplab61, 2: __atstmplab62, 3: __atstmplab63, 4: __atstmplab64 }
  #__patsflab__ats2pypre_list_aux_57
  #ATScaseofseq_beg
  tmplab_py = 1
  while(1):
    mbranch_1.get(tmplab_py)()
    if (tmplab_py == 0): break
  #ATScaseofseq_end
  return tmpret168


def ats2pypre_list_map_method(arg0, arg1):
  tmpret173 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list_map_method
  tmpret173 = _ats2pypre_list_patsfun_59__closurerize(arg0)
  return tmpret173


def _ats2pypre_list_patsfun_59(env0, arg0):
  tmpret174 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab__ats2pypre_list_patsfun_59
  tmpret174 = ats2pypre_list_map(env0, arg0)
  return tmpret174


def ats2pypre_list_foldleft(arg0, arg1, arg2):
  tmpret175 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list_foldleft
  tmpret175 = _ats2pypre_list_loop_61(arg2, arg1, arg0)
  return tmpret175


def _ats2pypre_list_loop_61(env0, arg0, arg1):
  apy0 = None
  apy1 = None
  tmpret176 = None
  tmp177 = None
  tmp178 = None
  tmp179 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  def __atstmplab65():
    nonlocal env0, arg0, arg1
    nonlocal apy0, apy1, tmpret176, tmp177, tmp178, tmp179
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    if(ATSCKptriscons(arg1)): tmplab_py = 4 ; return#__atstmplab68
    __atstmplab66()
    return
  def __atstmplab66():
    nonlocal env0, arg0, arg1
    nonlocal apy0, apy1, tmpret176, tmp177, tmp178, tmp179
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmpret176 = arg0
    return
  def __atstmplab67():
    nonlocal env0, arg0, arg1
    nonlocal apy0, apy1, tmpret176, tmp177, tmp178, tmp179
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    __atstmplab68()
    return
  def __atstmplab68():
    nonlocal env0, arg0, arg1
    nonlocal apy0, apy1, tmpret176, tmp177, tmp178, tmp179
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmp177 = arg1[0]
    tmp178 = arg1[1]
    tmp179 = env0[0](env0, arg0, tmp177)
    #ATStailcalseq_beg
    apy0 = tmp179
    apy1 = tmp178
    arg0 = apy0
    arg1 = apy1
    funlab_py = 1 #__patsflab__ats2pypre_list_loop_61
    #ATStailcalseq_end
    return
  mbranch_1 = { 1: __atstmplab65, 2: __atstmplab66, 3: __atstmplab67, 4: __atstmplab68 }
  while(1):
    funlab_py = 0
    #__patsflab__ats2pypre_list_loop_61
    #ATScaseofseq_beg
    tmplab_py = 1
    while(1):
      mbranch_1.get(tmplab_py)()
      if (tmplab_py == 0): break
    #ATScaseofseq_end
    if (funlab_py == 0): break
  return tmpret176


def ats2pypre_list_foldleft_method(arg0, arg1):
  tmpret180 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list_foldleft_method
  tmpret180 = _ats2pypre_list_patsfun_63__closurerize(arg0, arg1)
  return tmpret180


def _ats2pypre_list_patsfun_63(env0, env1, arg0):
  tmpret181 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab__ats2pypre_list_patsfun_63
  tmpret181 = ats2pypre_list_foldleft(env0, env1, arg0)
  return tmpret181


def ats2pypre_list_ifoldleft(arg0, arg1, arg2):
  tmpret182 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list_ifoldleft
  tmpret182 = _ats2pypre_list_loop_65(arg2, 0, arg1, arg0)
  return tmpret182


def _ats2pypre_list_loop_65(env0, arg0, arg1, arg2):
  apy0 = None
  apy1 = None
  apy2 = None
  tmpret183 = None
  tmp184 = None
  tmp185 = None
  tmp186 = None
  tmp187 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  def __atstmplab69():
    nonlocal env0, arg0, arg1, arg2
    nonlocal apy0, apy1, apy2, tmpret183, tmp184, tmp185, tmp186, tmp187
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    if(ATSCKptriscons(arg2)): tmplab_py = 4 ; return#__atstmplab72
    __atstmplab70()
    return
  def __atstmplab70():
    nonlocal env0, arg0, arg1, arg2
    nonlocal apy0, apy1, apy2, tmpret183, tmp184, tmp185, tmp186, tmp187
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmpret183 = arg1
    return
  def __atstmplab71():
    nonlocal env0, arg0, arg1, arg2
    nonlocal apy0, apy1, apy2, tmpret183, tmp184, tmp185, tmp186, tmp187
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    __atstmplab72()
    return
  def __atstmplab72():
    nonlocal env0, arg0, arg1, arg2
    nonlocal apy0, apy1, apy2, tmpret183, tmp184, tmp185, tmp186, tmp187
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmp184 = arg2[0]
    tmp185 = arg2[1]
    tmp186 = ats2pypre_add_int1_int1(arg0, 1)
    tmp187 = env0[0](env0, arg0, arg1, tmp184)
    #ATStailcalseq_beg
    apy0 = tmp186
    apy1 = tmp187
    apy2 = tmp185
    arg0 = apy0
    arg1 = apy1
    arg2 = apy2
    funlab_py = 1 #__patsflab__ats2pypre_list_loop_65
    #ATStailcalseq_end
    return
  mbranch_1 = { 1: __atstmplab69, 2: __atstmplab70, 3: __atstmplab71, 4: __atstmplab72 }
  while(1):
    funlab_py = 0
    #__patsflab__ats2pypre_list_loop_65
    #ATScaseofseq_beg
    tmplab_py = 1
    while(1):
      mbranch_1.get(tmplab_py)()
      if (tmplab_py == 0): break
    #ATScaseofseq_end
    if (funlab_py == 0): break
  return tmpret183


def ats2pypre_list_ifoldleft_method(arg0, arg1):
  tmpret188 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list_ifoldleft_method
  tmpret188 = _ats2pypre_list_patsfun_67__closurerize(arg0, arg1)
  return tmpret188


def _ats2pypre_list_patsfun_67(env0, env1, arg0):
  tmpret189 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab__ats2pypre_list_patsfun_67
  tmpret189 = ats2pypre_list_ifoldleft(env0, env1, arg0)
  return tmpret189


def ats2pypre_list_foldright(arg0, arg1, arg2):
  tmpret190 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list_foldright
  tmpret190 = _ats2pypre_list_aux_69(arg1, arg0, arg2)
  return tmpret190


def _ats2pypre_list_aux_69(env0, arg0, arg1):
  tmpret191 = None
  tmp192 = None
  tmp193 = None
  tmp194 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  def __atstmplab73():
    nonlocal env0, arg0, arg1
    nonlocal tmpret191, tmp192, tmp193, tmp194
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    if(ATSCKptriscons(arg0)): tmplab_py = 4 ; return#__atstmplab76
    __atstmplab74()
    return
  def __atstmplab74():
    nonlocal env0, arg0, arg1
    nonlocal tmpret191, tmp192, tmp193, tmp194
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmpret191 = arg1
    return
  def __atstmplab75():
    nonlocal env0, arg0, arg1
    nonlocal tmpret191, tmp192, tmp193, tmp194
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    __atstmplab76()
    return
  def __atstmplab76():
    nonlocal env0, arg0, arg1
    nonlocal tmpret191, tmp192, tmp193, tmp194
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmp192 = arg0[0]
    tmp193 = arg0[1]
    tmp194 = _ats2pypre_list_aux_69(env0, tmp193, arg1)
    tmpret191 = env0[0](env0, tmp192, tmp194)
    return
  mbranch_1 = { 1: __atstmplab73, 2: __atstmplab74, 3: __atstmplab75, 4: __atstmplab76 }
  #__patsflab__ats2pypre_list_aux_69
  #ATScaseofseq_beg
  tmplab_py = 1
  while(1):
    mbranch_1.get(tmplab_py)()
    if (tmplab_py == 0): break
  #ATScaseofseq_end
  return tmpret191


def ats2pypre_list_foldright_method(arg0, arg1):
  tmpret195 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list_foldright_method
  tmpret195 = _ats2pypre_list_patsfun_71__closurerize(arg0, arg1)
  return tmpret195


def _ats2pypre_list_patsfun_71(env0, env1, arg0):
  tmpret196 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab__ats2pypre_list_patsfun_71
  tmpret196 = ats2pypre_list_foldright(env0, arg0, env1)
  return tmpret196


def ats2pypre_list_ifoldright(arg0, arg1, arg2):
  tmpret197 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list_ifoldright
  tmpret197 = _ats2pypre_list_aux_73(arg1, 0, arg0, arg2)
  return tmpret197


def _ats2pypre_list_aux_73(env0, arg0, arg1, arg2):
  tmpret198 = None
  tmp199 = None
  tmp200 = None
  tmp201 = None
  tmp202 = None
  funlab_py = None
  tmplab_py = None
  mbranch_1 = None
  def __atstmplab77():
    nonlocal env0, arg0, arg1, arg2
    nonlocal tmpret198, tmp199, tmp200, tmp201, tmp202
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    if(ATSCKptriscons(arg1)): tmplab_py = 4 ; return#__atstmplab80
    __atstmplab78()
    return
  def __atstmplab78():
    nonlocal env0, arg0, arg1, arg2
    nonlocal tmpret198, tmp199, tmp200, tmp201, tmp202
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmpret198 = arg2
    return
  def __atstmplab79():
    nonlocal env0, arg0, arg1, arg2
    nonlocal tmpret198, tmp199, tmp200, tmp201, tmp202
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    __atstmplab80()
    return
  def __atstmplab80():
    nonlocal env0, arg0, arg1, arg2
    nonlocal tmpret198, tmp199, tmp200, tmp201, tmp202
    nonlocal funlab_py, tmplab_py
    nonlocal mbranch_1
    tmplab_py = 0
    tmp199 = arg1[0]
    tmp200 = arg1[1]
    tmp202 = ats2pypre_add_int1_int1(arg0, 1)
    tmp201 = _ats2pypre_list_aux_73(env0, tmp202, tmp200, arg2)
    tmpret198 = env0[0](env0, arg0, tmp199, tmp201)
    return
  mbranch_1 = { 1: __atstmplab77, 2: __atstmplab78, 3: __atstmplab79, 4: __atstmplab80 }
  #__patsflab__ats2pypre_list_aux_73
  #ATScaseofseq_beg
  tmplab_py = 1
  while(1):
    mbranch_1.get(tmplab_py)()
    if (tmplab_py == 0): break
  #ATScaseofseq_end
  return tmpret198


def ats2pypre_list_ifoldright_method(arg0, arg1):
  tmpret203 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_list_ifoldright_method
  tmpret203 = _ats2pypre_list_patsfun_75__closurerize(arg0, arg1)
  return tmpret203


def _ats2pypre_list_patsfun_75(env0, env1, arg0):
  tmpret204 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab__ats2pypre_list_patsfun_75
  tmpret204 = ats2pypre_list_ifoldright(env0, arg0, env1)
  return tmpret204

######
##
## end-of-compilation-unit
##
######
