#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

typedef IV MyType;
typedef IV MyType2;
typedef IV MyType3;
typedef IV MyType4;


=for testing

This parts are ignored.

=cut

/* Old perls (pre 5.8.9 or so) did not have PERL_UNUSED_ARG in XSUB.h.
 * This is normally covered by ppport.h. */
#ifndef PERL_UNUSED_ARG
#  if defined(lint) && defined(S_SPLINT_S) /* www.splint.org */
#    include <note.h>
#    define PERL_UNUSED_ARG(x) NOTE(ARGUNUSED(x))
#  else
#    define PERL_UNUSED_ARG(x) ((void)x)
#  endif
#endif
#ifndef PERL_UNUSED_VAR
#  define PERL_UNUSED_VAR(x) ((void)x)
#endif



STATIC void
outlist(int* a, int* b){
	*a = 'a';
	*b = 'b';
}

STATIC int
len(const char* const s, int const l){
	PERL_UNUSED_ARG(s);
	return l;
}

MODULE = XSMore         PACKAGE = XSMore

=for testing

This parts are also ignored.

=cut

PROTOTYPES: ENABLE

VERSIONCHECK: DISABLE

REQUIRE: 2.20

SCOPE: DISABLE

FALLBACK: TRUE

BOOT:
	sv_setiv(get_sv("XSMore::boot_ok", TRUE), 100);


TYPEMAP: <<END
MyType	T_IV
END

TYPEMAP: <<"  FOO BAR BAZ";
MyType2	T_FOOOO

OUTPUT
T_FOOOO
	sv_setiv($arg, (IV)$var);
  FOO BAR BAZ

TYPEMAP: <<'END'
MyType3	T_BAAR
MyType4	T_BAAR

OUTPUT
T_BAAR
	sv_setiv($arg, (IV)$var);

INPUT
T_BAAR
	$var = ($type)SvIV($arg)
END


MyType
typemaptest1()
  CODE:
    RETVAL = 42;
  OUTPUT:
    RETVAL

MyType2
typemaptest2()
  CODE:
    RETVAL = 42;
  OUTPUT:
    RETVAL

MyType3
typemaptest3(MyType4 foo)
  CODE:
    RETVAL = foo;
  OUTPUT:
    RETVAL

void
prototype_ssa()
PROTOTYPE: $$@
CODE:
	NOOP;

void
attr_method(self, ...)
ATTRS: method
CODE:
	NOOP;

#define RET_1 1
#define RET_2 2

int
return_1()
CASE: ix == 1
	ALIAS:
		return_1 = RET_1
		return_2 = RET_2
	CODE:
		RETVAL = ix;
	OUTPUT:
		RETVAL
CASE: ix == 2
	CODE:
		RETVAL = ix;
	OUTPUT:
		RETVAL

int
arg_init(x)
	int x = SvIV($arg);
CODE:
	RETVAL = x;
OUTPUT:
	RETVAL

int
myabs(...)
OVERLOAD: abs
CODE:
	PERL_UNUSED_VAR(items);
	RETVAL = 42;
OUTPUT:
	RETVAL

void
hook(IN AV* av)
INIT:
	av_push(av, newSVpv("INIT", 0));
CODE:
	av_push(av, newSVpv("CODE", 0));
POSTCALL:
	av_push(av, newSVpv("POSTCALL", 0));
CLEANUP:
	av_push(av, newSVpv("CLEANUP", 0));


void
outlist(OUTLIST int a, OUTLIST int b)

int
len(char* s, int length(s))

INCLUDE_COMMAND: $^X -Ilib -It/lib -MIncludeTester -e IncludeTester::print_xs

#if 1

INCLUDE: XSInclude.xsh

#else

# for testing #else directive

#endif
