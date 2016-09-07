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
######
#ATSextcode_end()
######

def _ats2pypre_intrange_patsfun_7__closurerize(env0):
  def _ats2pypre_intrange_patsfun_7__cfun(cenv, arg0): return _ats2pypre_intrange_patsfun_7(cenv[1], arg0)
  return (_ats2pypre_intrange_patsfun_7__cfun, env0)

def _ats2pypre_intrange_patsfun_9__closurerize(env0):
  def _ats2pypre_intrange_patsfun_9__cfun(cenv, arg0): return _ats2pypre_intrange_patsfun_9(cenv[1], arg0)
  return (_ats2pypre_intrange_patsfun_9__cfun, env0)

def _ats2pypre_intrange_patsfun_11__closurerize(env0):
  def _ats2pypre_intrange_patsfun_11__cfun(cenv, arg0): return _ats2pypre_intrange_patsfun_11(cenv[1], arg0)
  return (_ats2pypre_intrange_patsfun_11__cfun, env0)

def _ats2pypre_intrange_patsfun_14__closurerize(env0, env1):
  def _ats2pypre_intrange_patsfun_14__cfun(cenv, arg0): return _ats2pypre_intrange_patsfun_14(cenv[1], cenv[2], arg0)
  return (_ats2pypre_intrange_patsfun_14__cfun, env0, env1)

def _ats2pypre_intrange_patsfun_18__closurerize(env0):
  def _ats2pypre_intrange_patsfun_18__cfun(cenv, arg0): return _ats2pypre_intrange_patsfun_18(cenv[1], arg0)
  return (_ats2pypre_intrange_patsfun_18__cfun, env0)

def _ats2pypre_intrange_patsfun_31__closurerize(env0, env1, env2):
  def _ats2pypre_intrange_patsfun_31__cfun(cenv, arg0): return _ats2pypre_intrange_patsfun_31(cenv[1], cenv[2], cenv[3], arg0)
  return (_ats2pypre_intrange_patsfun_31__cfun, env0, env1, env2)

def ats2pypre_int_repeat_lazy(arg0, arg1):
  tmp1 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_int_repeat_lazy
  tmp1 = ats2pypre_lazy2cloref(arg1)
  ats2pypre_int_repeat_cloref(arg0, tmp1)
  return#_void


def ats2pypre_int_repeat_cloref(arg0, arg1):
  funlab_py = None
  tmplab_py = None
  #__patsflab_int_repeat_cloref
  _ats2pypre_intrange_loop_2(arg0, arg1)
  return#_void


def _ats2pypre_intrange_loop_2(arg0, arg1):
  apy0 = None
  apy1 = None
  tmp4 = None
  tmp6 = None
  funlab_py = None
  tmplab_py = None
  while(1):
    funlab_py = 0
    #__patsflab__ats2pypre_intrange_loop_2
    tmp4 = ats2pypre_gt_int0_int0(arg0, 0)
    if (tmp4):
      arg1[0](arg1)
      tmp6 = ats2pypre_sub_int0_int0(arg0, 1)
      #ATStailcalseq_beg
      apy0 = tmp6
      apy1 = arg1
      arg0 = apy0
      arg1 = apy1
      funlab_py = 1 #__patsflab__ats2pypre_intrange_loop_2
      #ATStailcalseq_end
    else:
      None#ATSINSmove_void
    #endif
    if (funlab_py == 0): break
  return#_void


def ats2pypre_int_exists_cloref(arg0, arg1):
  tmpret7 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_int_exists_cloref
  tmpret7 = ats2pypre_intrange_exists_cloref(0, arg0, arg1)
  return tmpret7


def ats2pypre_int_forall_cloref(arg0, arg1):
  tmpret8 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_int_forall_cloref
  tmpret8 = ats2pypre_intrange_forall_cloref(0, arg0, arg1)
  return tmpret8


def ats2pypre_int_foreach_cloref(arg0, arg1):
  funlab_py = None
  tmplab_py = None
  #__patsflab_int_foreach_cloref
  ats2pypre_intrange_foreach_cloref(0, arg0, arg1)
  return#_void


def ats2pypre_int_exists_method(arg0):
  tmpret10 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_int_exists_method
  tmpret10 = _ats2pypre_intrange_patsfun_7__closurerize(arg0)
  return tmpret10


def _ats2pypre_intrange_patsfun_7(env0, arg0):
  tmpret11 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab__ats2pypre_intrange_patsfun_7
  tmpret11 = ats2pypre_int_exists_cloref(env0, arg0)
  return tmpret11


def ats2pypre_int_forall_method(arg0):
  tmpret12 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_int_forall_method
  tmpret12 = _ats2pypre_intrange_patsfun_9__closurerize(arg0)
  return tmpret12


def _ats2pypre_intrange_patsfun_9(env0, arg0):
  tmpret13 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab__ats2pypre_intrange_patsfun_9
  tmpret13 = ats2pypre_int_forall_cloref(env0, arg0)
  return tmpret13


def ats2pypre_int_foreach_method(arg0):
  tmpret14 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_int_foreach_method
  tmpret14 = _ats2pypre_intrange_patsfun_11__closurerize(arg0)
  return tmpret14


def _ats2pypre_intrange_patsfun_11(env0, arg0):
  funlab_py = None
  tmplab_py = None
  #__patsflab__ats2pypre_intrange_patsfun_11
  ats2pypre_int_foreach_cloref(env0, arg0)
  return#_void


def ats2pypre_int_foldleft_cloref(arg0, arg1, arg2):
  tmpret16 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_int_foldleft_cloref
  tmpret16 = ats2pypre_intrange_foldleft_cloref(0, arg0, arg1, arg2)
  return tmpret16


def ats2pypre_int_foldleft_method(arg0, arg1):
  tmpret17 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_int_foldleft_method
  tmpret17 = _ats2pypre_intrange_patsfun_14__closurerize(arg0, arg1)
  return tmpret17


def _ats2pypre_intrange_patsfun_14(env0, env1, arg0):
  tmpret18 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab__ats2pypre_intrange_patsfun_14
  tmpret18 = ats2pypre_int_foldleft_cloref(env0, env1, arg0)
  return tmpret18


def ats2pypre_int_list_map_cloref(arg0, arg1):
  tmpret19 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_int_list_map_cloref
  tmpret19 = _ats2pypre_intrange_aux_16(arg0, arg1, 0)
  return tmpret19


def _ats2pypre_intrange_aux_16(env0, env1, arg0):
  tmpret20 = None
  tmp21 = None
  tmp22 = None
  tmp23 = None
  tmp24 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab__ats2pypre_intrange_aux_16
  tmp21 = ats2pypre_lt_int1_int1(arg0, env0)
  if (tmp21):
    tmp22 = env1[0](env1, arg0)
    tmp24 = ats2pypre_add_int1_int1(arg0, 1)
    tmp23 = _ats2pypre_intrange_aux_16(env0, env1, tmp24)
    tmpret20 = (tmp22, tmp23)
  else:
    tmpret20 = None
  #endif
  return tmpret20


def ats2pypre_int_list_map_method(arg0, arg1):
  tmpret25 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_int_list_map_method
  tmpret25 = _ats2pypre_intrange_patsfun_18__closurerize(arg0)
  return tmpret25


def _ats2pypre_intrange_patsfun_18(env0, arg0):
  tmpret26 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab__ats2pypre_intrange_patsfun_18
  tmpret26 = ats2pypre_int_list_map_cloref(env0, arg0)
  return tmpret26


def ats2pypre_int2_exists_cloref(arg0, arg1, arg2):
  tmpret27 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_int2_exists_cloref
  tmpret27 = ats2pypre_intrange2_exists_cloref(0, arg0, 0, arg1, arg2)
  return tmpret27


def ats2pypre_int2_forall_cloref(arg0, arg1, arg2):
  tmpret28 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_int2_forall_cloref
  tmpret28 = ats2pypre_intrange2_forall_cloref(0, arg0, 0, arg1, arg2)
  return tmpret28


def ats2pypre_int2_foreach_cloref(arg0, arg1, arg2):
  funlab_py = None
  tmplab_py = None
  #__patsflab_int2_foreach_cloref
  ats2pypre_intrange2_foreach_cloref(0, arg0, 0, arg1, arg2)
  return#_void


def ats2pypre_intrange_exists_cloref(arg0, arg1, arg2):
  tmpret30 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_intrange_exists_cloref
  tmpret30 = _ats2pypre_intrange_loop_23(arg0, arg1, arg2)
  return tmpret30


def _ats2pypre_intrange_loop_23(arg0, arg1, arg2):
  apy0 = None
  apy1 = None
  apy2 = None
  tmpret31 = None
  tmp32 = None
  tmp33 = None
  tmp34 = None
  funlab_py = None
  tmplab_py = None
  while(1):
    funlab_py = 0
    #__patsflab__ats2pypre_intrange_loop_23
    tmp32 = ats2pypre_lt_int0_int0(arg0, arg1)
    if (tmp32):
      tmp33 = arg2[0](arg2, arg0)
      if (tmp33):
        tmpret31 = True
      else:
        tmp34 = ats2pypre_add_int0_int0(arg0, 1)
        #ATStailcalseq_beg
        apy0 = tmp34
        apy1 = arg1
        apy2 = arg2
        arg0 = apy0
        arg1 = apy1
        arg2 = apy2
        funlab_py = 1 #__patsflab__ats2pypre_intrange_loop_23
        #ATStailcalseq_end
      #endif
    else:
      tmpret31 = False
    #endif
    if (funlab_py == 0): break
  return tmpret31


def ats2pypre_intrange_forall_cloref(arg0, arg1, arg2):
  tmpret35 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_intrange_forall_cloref
  tmpret35 = _ats2pypre_intrange_loop_25(arg0, arg1, arg2)
  return tmpret35


def _ats2pypre_intrange_loop_25(arg0, arg1, arg2):
  apy0 = None
  apy1 = None
  apy2 = None
  tmpret36 = None
  tmp37 = None
  tmp38 = None
  tmp39 = None
  funlab_py = None
  tmplab_py = None
  while(1):
    funlab_py = 0
    #__patsflab__ats2pypre_intrange_loop_25
    tmp37 = ats2pypre_lt_int0_int0(arg0, arg1)
    if (tmp37):
      tmp38 = arg2[0](arg2, arg0)
      if (tmp38):
        tmp39 = ats2pypre_add_int0_int0(arg0, 1)
        #ATStailcalseq_beg
        apy0 = tmp39
        apy1 = arg1
        apy2 = arg2
        arg0 = apy0
        arg1 = apy1
        arg2 = apy2
        funlab_py = 1 #__patsflab__ats2pypre_intrange_loop_25
        #ATStailcalseq_end
      else:
        tmpret36 = False
      #endif
    else:
      tmpret36 = True
    #endif
    if (funlab_py == 0): break
  return tmpret36


def ats2pypre_intrange_foreach_cloref(arg0, arg1, arg2):
  funlab_py = None
  tmplab_py = None
  #__patsflab_intrange_foreach_cloref
  _ats2pypre_intrange_loop_27(arg0, arg1, arg2)
  return#_void


def _ats2pypre_intrange_loop_27(arg0, arg1, arg2):
  apy0 = None
  apy1 = None
  apy2 = None
  tmp42 = None
  tmp44 = None
  funlab_py = None
  tmplab_py = None
  while(1):
    funlab_py = 0
    #__patsflab__ats2pypre_intrange_loop_27
    tmp42 = ats2pypre_lt_int0_int0(arg0, arg1)
    if (tmp42):
      arg2[0](arg2, arg0)
      tmp44 = ats2pypre_add_int0_int0(arg0, 1)
      #ATStailcalseq_beg
      apy0 = tmp44
      apy1 = arg1
      apy2 = arg2
      arg0 = apy0
      arg1 = apy1
      arg2 = apy2
      funlab_py = 1 #__patsflab__ats2pypre_intrange_loop_27
      #ATStailcalseq_end
    else:
      None#ATSINSmove_void
    #endif
    if (funlab_py == 0): break
  return#_void


def ats2pypre_intrange_foldleft_cloref(arg0, arg1, arg2, arg3):
  tmpret45 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_intrange_foldleft_cloref
  tmpret45 = _ats2pypre_intrange_loop_29(arg3, arg0, arg1, arg2, arg3)
  return tmpret45


def _ats2pypre_intrange_loop_29(env0, arg0, arg1, arg2, arg3):
  apy0 = None
  apy1 = None
  apy2 = None
  apy3 = None
  tmpret46 = None
  tmp47 = None
  tmp48 = None
  tmp49 = None
  funlab_py = None
  tmplab_py = None
  while(1):
    funlab_py = 0
    #__patsflab__ats2pypre_intrange_loop_29
    tmp47 = ats2pypre_lt_int0_int0(arg0, arg1)
    if (tmp47):
      tmp48 = ats2pypre_add_int0_int0(arg0, 1)
      tmp49 = arg3[0](arg3, arg2, arg0)
      #ATStailcalseq_beg
      apy0 = tmp48
      apy1 = arg1
      apy2 = tmp49
      apy3 = env0
      arg0 = apy0
      arg1 = apy1
      arg2 = apy2
      arg3 = apy3
      funlab_py = 1 #__patsflab__ats2pypre_intrange_loop_29
      #ATStailcalseq_end
    else:
      tmpret46 = arg2
    #endif
    if (funlab_py == 0): break
  return tmpret46


def ats2pypre_intrange_foldleft_method(arg0, arg1):
  tmp50 = None
  tmp51 = None
  tmpret52 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_intrange_foldleft_method
  tmp50 = arg0[0]
  tmp51 = arg0[1]
  tmpret52 = _ats2pypre_intrange_patsfun_31__closurerize(tmp50, tmp51, arg1)
  return tmpret52


def _ats2pypre_intrange_patsfun_31(env0, env1, env2, arg0):
  tmpret53 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab__ats2pypre_intrange_patsfun_31
  tmpret53 = ats2pypre_intrange_foldleft_cloref(env0, env1, env2, arg0)
  return tmpret53


def ats2pypre_intrange2_exists_cloref(arg0, arg1, arg2, arg3, arg4):
  tmpret54 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_intrange2_exists_cloref
  tmpret54 = _ats2pypre_intrange_loop1_33(arg2, arg3, arg4, arg0, arg1, arg2, arg3, arg4)
  return tmpret54


def _ats2pypre_intrange_loop1_33(env0, env1, env2, arg0, arg1, arg2, arg3, arg4):
  apy0 = None
  apy1 = None
  apy2 = None
  apy3 = None
  apy4 = None
  tmpret55 = None
  tmp56 = None
  a2rg0 = None
  a2rg1 = None
  a2rg2 = None
  a2rg3 = None
  a2rg4 = None
  a2py0 = None
  a2py1 = None
  a2py2 = None
  a2py3 = None
  a2py4 = None
  tmpret57 = None
  tmp58 = None
  tmp59 = None
  tmp60 = None
  tmp61 = None
  funlab_py = None
  tmplab_py = None
  tmpret_py = None
  def __patsflab__ats2pypre_intrange_loop1_33():
    nonlocal env0, env1, env2, arg0, arg1, arg2, arg3, arg4
    nonlocal apy0, apy1, apy2, apy3, apy4, tmpret55, tmp56, a2rg0, a2rg1, a2rg2, a2rg3, a2rg4, a2py0, a2py1, a2py2, a2py3, a2py4, tmpret57, tmp58, tmp59, tmp60, tmp61
    nonlocal funlab_py, tmplab_py
    funlab_py = 0
    tmp56 = ats2pypre_lt_int0_int0(arg0, arg1)
    if (tmp56):
      #ATStailcalseq_beg
      a2py0 = arg0
      a2py1 = arg1
      a2py2 = arg2
      a2py3 = arg3
      a2py4 = env2
      a2rg0 = a2py0
      a2rg1 = a2py1
      a2rg2 = a2py2
      a2rg3 = a2py3
      a2rg4 = a2py4
      funlab_py = 2 #__patsflab__ats2pypre_intrange_loop2_34
      #ATStailcalseq_end
    else:
      tmpret55 = False
    #endif
    return tmpret55
  def __patsflab__ats2pypre_intrange_loop2_34():
    nonlocal env0, env1, env2, arg0, arg1, arg2, arg3, arg4
    nonlocal apy0, apy1, apy2, apy3, apy4, tmpret55, tmp56, a2rg0, a2rg1, a2rg2, a2rg3, a2rg4, a2py0, a2py1, a2py2, a2py3, a2py4, tmpret57, tmp58, tmp59, tmp60, tmp61
    nonlocal funlab_py, tmplab_py
    funlab_py = 0
    tmp58 = ats2pypre_lt_int0_int0(a2rg2, a2rg3)
    if (tmp58):
      tmp59 = a2rg4[0](a2rg4, a2rg0, a2rg2)
      if (tmp59):
        tmpret57 = True
      else:
        tmp60 = ats2pypre_add_int0_int0(a2rg2, 1)
        #ATStailcalseq_beg
        a2py0 = a2rg0
        a2py1 = a2rg1
        a2py2 = tmp60
        a2py3 = a2rg3
        a2py4 = a2rg4
        a2rg0 = a2py0
        a2rg1 = a2py1
        a2rg2 = a2py2
        a2rg3 = a2py3
        a2rg4 = a2py4
        funlab_py = 2 #__patsflab__ats2pypre_intrange_loop2_34
        #ATStailcalseq_end
      #endif
    else:
      tmp61 = ats2pypre_add_int0_int0(a2rg0, 1)
      #ATStailcalseq_beg
      apy0 = tmp61
      apy1 = a2rg1
      apy2 = env0
      apy3 = env1
      apy4 = a2rg4
      arg0 = apy0
      arg1 = apy1
      arg2 = apy2
      arg3 = apy3
      arg4 = apy4
      funlab_py = 1 #__patsflab__ats2pypre_intrange_loop1_33
      #ATStailcalseq_end
    #endif
    return tmpret57
  mfundef = { 1: __patsflab__ats2pypre_intrange_loop1_33, 2: __patsflab__ats2pypre_intrange_loop2_34 }
  funlab_py = 1
  while(1):
    tmpret_py = mfundef.get(funlab_py)()
    if (funlab_py == 0): break
  return tmpret_py


def ats2pypre_intrange2_forall_cloref(arg0, arg1, arg2, arg3, arg4):
  tmpret62 = None
  funlab_py = None
  tmplab_py = None
  #__patsflab_intrange2_forall_cloref
  tmpret62 = _ats2pypre_intrange_loop1_36(arg2, arg3, arg0, arg1, arg2, arg3, arg4)
  return tmpret62


def _ats2pypre_intrange_loop1_36(env0, env1, arg0, arg1, arg2, arg3, arg4):
  apy0 = None
  apy1 = None
  apy2 = None
  apy3 = None
  apy4 = None
  tmpret63 = None
  tmp64 = None
  a2rg0 = None
  a2rg1 = None
  a2rg2 = None
  a2rg3 = None
  a2rg4 = None
  a2py0 = None
  a2py1 = None
  a2py2 = None
  a2py3 = None
  a2py4 = None
  tmpret65 = None
  tmp66 = None
  tmp67 = None
  tmp68 = None
  tmp69 = None
  funlab_py = None
  tmplab_py = None
  tmpret_py = None
  def __patsflab__ats2pypre_intrange_loop1_36():
    nonlocal env0, env1, arg0, arg1, arg2, arg3, arg4
    nonlocal apy0, apy1, apy2, apy3, apy4, tmpret63, tmp64, a2rg0, a2rg1, a2rg2, a2rg3, a2rg4, a2py0, a2py1, a2py2, a2py3, a2py4, tmpret65, tmp66, tmp67, tmp68, tmp69
    nonlocal funlab_py, tmplab_py
    funlab_py = 0
    tmp64 = ats2pypre_lt_int0_int0(arg0, arg1)
    if (tmp64):
      #ATStailcalseq_beg
      a2py0 = arg0
      a2py1 = arg1
      a2py2 = arg2
      a2py3 = arg3
      a2py4 = arg4
      a2rg0 = a2py0
      a2rg1 = a2py1
      a2rg2 = a2py2
      a2rg3 = a2py3
      a2rg4 = a2py4
      funlab_py = 2 #__patsflab__ats2pypre_intrange_loop2_37
      #ATStailcalseq_end
    else:
      tmpret63 = True
    #endif
    return tmpret63
  def __patsflab__ats2pypre_intrange_loop2_37():
    nonlocal env0, env1, arg0, arg1, arg2, arg3, arg4
    nonlocal apy0, apy1, apy2, apy3, apy4, tmpret63, tmp64, a2rg0, a2rg1, a2rg2, a2rg3, a2rg4, a2py0, a2py1, a2py2, a2py3, a2py4, tmpret65, tmp66, tmp67, tmp68, tmp69
    nonlocal funlab_py, tmplab_py
    funlab_py = 0
    tmp66 = ats2pypre_lt_int0_int0(a2rg2, a2rg3)
    if (tmp66):
      tmp67 = a2rg4[0](a2rg4, a2rg0, a2rg2)
      if (tmp67):
        tmp68 = ats2pypre_add_int0_int0(a2rg2, 1)
        #ATStailcalseq_beg
        a2py0 = a2rg0
        a2py1 = a2rg1
        a2py2 = tmp68
        a2py3 = a2rg3
        a2py4 = a2rg4
        a2rg0 = a2py0
        a2rg1 = a2py1
        a2rg2 = a2py2
        a2rg3 = a2py3
        a2rg4 = a2py4
        funlab_py = 2 #__patsflab__ats2pypre_intrange_loop2_37
        #ATStailcalseq_end
      else:
        tmpret65 = False
      #endif
    else:
      tmp69 = ats2pypre_add_int0_int0(a2rg0, 1)
      #ATStailcalseq_beg
      apy0 = tmp69
      apy1 = a2rg1
      apy2 = env0
      apy3 = env1
      apy4 = a2rg4
      arg0 = apy0
      arg1 = apy1
      arg2 = apy2
      arg3 = apy3
      arg4 = apy4
      funlab_py = 1 #__patsflab__ats2pypre_intrange_loop1_36
      #ATStailcalseq_end
    #endif
    return tmpret65
  mfundef = { 1: __patsflab__ats2pypre_intrange_loop1_36, 2: __patsflab__ats2pypre_intrange_loop2_37 }
  funlab_py = 1
  while(1):
    tmpret_py = mfundef.get(funlab_py)()
    if (funlab_py == 0): break
  return tmpret_py


def ats2pypre_intrange2_foreach_cloref(arg0, arg1, arg2, arg3, arg4):
  funlab_py = None
  tmplab_py = None
  #__patsflab_intrange2_foreach_cloref
  _ats2pypre_intrange_loop1_39(arg2, arg3, arg0, arg1, arg2, arg3, arg4)
  return#_void


def _ats2pypre_intrange_loop1_39(env0, env1, arg0, arg1, arg2, arg3, arg4):
  apy0 = None
  apy1 = None
  apy2 = None
  apy3 = None
  apy4 = None
  tmp72 = None
  a2rg0 = None
  a2rg1 = None
  a2rg2 = None
  a2rg3 = None
  a2rg4 = None
  a2py0 = None
  a2py1 = None
  a2py2 = None
  a2py3 = None
  a2py4 = None
  tmp74 = None
  tmp76 = None
  tmp77 = None
  funlab_py = None
  tmplab_py = None
  tmpret_py = None
  def __patsflab__ats2pypre_intrange_loop1_39():
    nonlocal env0, env1, arg0, arg1, arg2, arg3, arg4
    nonlocal apy0, apy1, apy2, apy3, apy4, tmp72, a2rg0, a2rg1, a2rg2, a2rg3, a2rg4, a2py0, a2py1, a2py2, a2py3, a2py4, tmp74, tmp76, tmp77
    nonlocal funlab_py, tmplab_py
    funlab_py = 0
    tmp72 = ats2pypre_lt_int0_int0(arg0, arg1)
    if (tmp72):
      #ATStailcalseq_beg
      a2py0 = arg0
      a2py1 = arg1
      a2py2 = arg2
      a2py3 = arg3
      a2py4 = arg4
      a2rg0 = a2py0
      a2rg1 = a2py1
      a2rg2 = a2py2
      a2rg3 = a2py3
      a2rg4 = a2py4
      funlab_py = 2 #__patsflab__ats2pypre_intrange_loop2_40
      #ATStailcalseq_end
    else:
      None#ATSINSmove_void
    #endif
    return#_void
  def __patsflab__ats2pypre_intrange_loop2_40():
    nonlocal env0, env1, arg0, arg1, arg2, arg3, arg4
    nonlocal apy0, apy1, apy2, apy3, apy4, tmp72, a2rg0, a2rg1, a2rg2, a2rg3, a2rg4, a2py0, a2py1, a2py2, a2py3, a2py4, tmp74, tmp76, tmp77
    nonlocal funlab_py, tmplab_py
    funlab_py = 0
    tmp74 = ats2pypre_lt_int0_int0(a2rg2, a2rg3)
    if (tmp74):
      a2rg4[0](a2rg4, a2rg0, a2rg2)
      tmp76 = ats2pypre_add_int0_int0(a2rg2, 1)
      #ATStailcalseq_beg
      a2py0 = a2rg0
      a2py1 = a2rg1
      a2py2 = tmp76
      a2py3 = a2rg3
      a2py4 = a2rg4
      a2rg0 = a2py0
      a2rg1 = a2py1
      a2rg2 = a2py2
      a2rg3 = a2py3
      a2rg4 = a2py4
      funlab_py = 2 #__patsflab__ats2pypre_intrange_loop2_40
      #ATStailcalseq_end
    else:
      tmp77 = ats2pypre_succ_int0(a2rg0)
      #ATStailcalseq_beg
      apy0 = tmp77
      apy1 = a2rg1
      apy2 = env0
      apy3 = env1
      apy4 = a2rg4
      arg0 = apy0
      arg1 = apy1
      arg2 = apy2
      arg3 = apy3
      arg4 = apy4
      funlab_py = 1 #__patsflab__ats2pypre_intrange_loop1_39
      #ATStailcalseq_end
    #endif
    return#_void
  mfundef = { 1: __patsflab__ats2pypre_intrange_loop1_39, 2: __patsflab__ats2pypre_intrange_loop2_40 }
  funlab_py = 1
  while(1):
    tmpret_py = mfundef.get(funlab_py)()
    if (funlab_py == 0): break
  return tmpret_py

######
##
## end-of-compilation-unit
##
######
