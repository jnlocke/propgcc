/*  DO NOT EDIT THIS FILE.

    It has been auto-edited by fixincludes from:

	"fixinc/tests/inc/reg_types.h"

    This had to be done to correct non-standard usages in the
    original, manufacturer supplied header file.  */



#if defined( OSF_NAMESPACE_A_CHECK )
typedef struct {
  int stuff, mo_suff;
} __regex_t;
extern __regex_t    re;
extern __regoff_t   ro;
extern __regmatch_t rm;

#endif  /* OSF_NAMESPACE_A_CHECK */
