/* perl_android.h
 *
 * Include file for several android staff
 *
 *    Copyright (C) 2011 by Nito at Qindel dot ES
 *
 *    You may distribute under the terms of either the GNU General Public
 *    License or the Artistic License, as specified in the README file.
 *
 */


#ifndef _PERL_ANDROID_H_
#define _PERL_ANDROID_H_

#include <netdb.h>
struct protoent *fake_getprotobyname(const char *name);
struct protoent *fake_getprotobynumber(int proto);

#endif
