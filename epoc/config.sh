#!/bin/sh
#
# This file is manually maintained.
#
# It is NOT produced by running the Configure script.
#

# Package name      : perl5
# Source directory  : .
# Configuration time: 
# Configured by     : Olaf Flebbe
# Target system     : EPOC

Author=''
Date='$Date'
Header=''
Id='$Id'
Locker=''
Log='$Log'
RCSfile='$RCSfile'
Revision='$Revision'
Source=''
State=''
_a='.a'
_exe='.exe'
_o='.o'
afs='false'
afsroot='/afs'
alignbytes='8'
ansi2knr=''
aphostname=''
apirevision=''
apisubversion=''
apiversion=''
ar='arm-epoc-pe-ar'
archlib='/usr/lib/perl/5.15.1/epoc'
archlibexp='/usr/lib/perl/5.15.1/epoc'
archname64=''
archname='epoc'
archobjs='epoc.o epocish.o epoc_stubs.o'
asctime_r_proto='0'
awk='awk'
baserev='5.0'
bash=''
bin=''
binexp=''
bison='bison'
byacc=''
byteorder='1234'
c=''
castflags='0'
cat='cat'
cc='arm-epoc-pe-gcc -DEPOC'
cccdlflags=''
ccdlflags=''
ccflags=''
ccsymbols=''
cf_by='olaf'
cf_email='o.flebbe@gmx.de'
cf_time='Dec 2001'
charbits='8'
chgrp=''
chmod=''
chown=''
clocktype=''
comm=''
compress=''
contains='grep'
cp='cp'
cpio=''
cpp='arm-epoc-pe-cpp'
cpp_stuff='42'
cppccsymbols='EPOC=1'
cppflags=''
cpplast='-'
cppminus='-'
cpprun='arm-epoc-pe-gcc -E'
cppstdin='arm-epoc-pe-gcc -E'
cppsymbols=''
crypt_r_proto='0'
cryptlib=''
csh='csh'
ctermid_r_proto='0'
ctime_r_proto='0'
d_Gconvert='epoc_gcvt((x),(n),(b))'
d_PRIEUldbl='undef'
d_PRIFUldbl='undef'
d_PRIGUldbl='undef'
d_PRIXU64='undef'
d_PRId64='undef'
d_PRIeldbl='undef'
d_PRIfldbl='define'
d_PRIgldbl='define'
d_PRIi64='undef'
d_PRIo64='undef'
d_PRIu64='undef'
d_PRIx64='undef'
d__fwalk='undef'
d_access='undef'
d_accessx='undef'
d_aintl='undef'
d_alarm='undef'
d_archlib='define'
d_asctime64='undef'
d_asctime_r='undef'
d_atolf='undef'
d_atoll='undef'
d_attribute_deprecated='undef'
d_attribute_format='undef'
d_attribute_malloc='undef'
d_attribute_nonnull='undef'
d_attribute_noreturn='undef'
d_attribute_pure='undef'
d_attribute_unused='undef'
d_attribute_warn_unused_result='undef'
d_bcmp='define'
d_bcopy='define'
d_bsdgetpgrp='undef'
d_bsdsetpgrp='undef'
d_bsd='undef'
d_bzero='define'
d_c99_variadic_macros='undef'
d_casti32='undef'
d_castneg='undef'
d_charvspr='undef'
d_chown='undef'
d_chroot='undef'
d_chsize='undef'
d_class='undef'
d_clearenv='define'
d_closedir='undef'
d_cmsghdr_s='undef'
d_cmsghdr_s='undef'
d_const='define'
d_copysignl='undef'
d_cplusplus='undef'
d_crypt_r='undef'
d_crypt='undef'
d_csh='undef'
d_ctermid_r='undef'
d_ctime64='undef'
d_ctime_r='undef'
d_cuserid='undef'
d_dbl_dig='undef'
d_dbminitproto='undef'
d_difftime64='undef'
d_difftime='define'
d_dir_dd_fd='undef'
d_dirfd='undef'
d_dirnamlen='undef'
d_dlerror='undef'
d_dlopen='undef'
d_dlsymun='undef'
d_dosuid='undef'
d_drand48proto='define'
d_drand48_r='undef'
d_dup2='undef'
d_eaccess='undef'
d_endgrent_r='undef'
d_endgrent='undef'
d_endhent='undef'
d_endhostent_r='undef'
d_endnent='undef'
d_endnetent_r='undef'
d_endpent='undef'
d_endprotoent_r='undef'
d_endpwent_r='undef'
d_endpwent='undef'
d_endsent='undef'
d_endservent_r='undef'
d_eofnblk='define'
d_eunice='undef'
d_faststdio='undef'
d_fchdir='undef'
d_fchmod='undef'
d_fchown='undef'
d_fcntl_can_lock='undef'
d_fcntl='undef'
d_fd_macros='undef'
d_fds_bits='undef'
d_fd_set='define'
d_fgetpos='define'
d_finitel='undef'
d_finite='undef'
d_flexfnam='define'
d_flockproto='undef'
d_flock='undef'
d_fork='undef'
d_fpathconf='undef'
d_fpclassify='undef'
d_fpclassl='undef'
d_fp_class='undef'
d_fpclass='undef'
d_fpos64_t='undef'
d_frexpl='undef'
d_fseeko='undef'
d_fsetpos='define'
d_fstatfs='define'
d_fstatvfs='undef'
d_fsync='undef'
d_ftello='undef'
d_ftime='undef'
d_futimes='undef'
d_gdbm_ndbm_h_uses_prototypes='undef'
d_gdbmndbm_h_uses_prototypes='undef'
d_getaddrinfo='undef'
d_getespwnam='undef'
d_getfsstat='undef'
d_getgrent_r='undef'
d_getgrent='undef'
d_getgrgid_r='undef'
d_getgrnam_r='undef'
d_getgrps='undef'
d_gethbyaddr='define'
d_gethbyname='define'
d_gethent='undef'
d_gethname='undef'
d_gethostbyaddr_r='undef'
d_gethostbyname_r='undef'
d_gethostent_r='undef'
d_gethostprotos='define'
d_getitimer='undef'
d_getlogin_r='undef'
d_getlogin='undef'
d_getmntent='undef'
d_getnameinfo='undef'
d_getnbyaddr='undef'
d_getnbyname='undef'
d_getnent='undef'
d_getnetbyaddr_r='undef'
d_getnetbyname_r='undef'
d_getnetent_r='undef'
d_getnetprotos='define'
d_getpagsz='undef'
d_getpbyname='define'
d_getpbynumber='define'
d_getpent='undef'
d_getpgid='undef'
d_getpgrp2='undef'
d_getpgrp='undef'
d_getppid='undef'
d_getprior='undef'
d_getprotobyname_r='undef'
d_getprotobynumber_r='undef'
d_getprotoent_r='undef'
d_getprotoprotos='define'
d_getprpwnam='undef'
d_getpwent_r='undef'
d_getpwent='undef'
d_getpwnam_r='undef'
d_getpwuid_r='undef'
d_getsbyname='undef'
d_getsbyport='undef'
d_getsent='undef'
d_getservbyname_r='undef'
d_getservbyport_r='undef'
d_getservent_r='undef'
d_getservprotos='define'
d_getspnam_r='undef'
d_getspnam='undef'
d_gettimeod='define'
d_gmtime64='undef'
d_gmtime_r='undef'
d_gnulibc='undef'
d_grpasswd='undef'
d_hasmntopt='undef'
d_htonl='define'
d_ilogbl='undef'
d_index='undef'
d_inetaton='define'
d_inetntop='undef'
d_inetpton='undef'
d_int64_t='undef'
d_iovec_s='undef'
d_isascii='define'
d_isfinite='undef'
d_isinf='undef'
d_isnan='define'
d_isnanl='undef'
d_killpg='undef'
d_lchown='undef'
d_ldbl_dig='undef'
d_link='undef'
d_llseek='undef'
d_localtime64='undef'
d_localtime_r_needs_tzset='undef'
d_localtime_r='undef'
d_locconv='undef'
d_lockf='undef'
d_longdbl='undef'
d_longlong='define'
d_lseekproto='define'
d_lstat='undef'
d_madvise='undef'
d_malloc_good_size='undef'
d_malloc_size='undef'
d_mblen='undef'
d_mbstowcs='undef'
d_mbtowc='undef'
d_memchr='define'
d_memcmp='define'
d_memcpy='define'
d_memmove='define'
d_memset='define'
d_mkdir='define'
d_mkfifo='undef'
d_mktime64='undef'
d_mktime='define'
d_mmap='undef'
d_modfl_pow32_bug='undef'
d_modflproto='undef'
d_modfl='undef'
d_mprotect='undef'
d_msgctl='undef'
d_msg_ctrunc='undef'
d_msg_dontroute='undef'
d_msgget='undef'
d_msghdr_s='undef'
d_msghdr_s='undef'
d_msg_oob='undef'
d_msg_peek='undef'
d_msg_proxy='undef'
d_msgrcv='undef'
d_msgsnd='undef'
d_msg='undef'
d_msync='undef'
d_munmap='undef'
d_mymalloc='undef'
d_ndbm_h_uses_prototypes='undef'
d_nice='undef'
d_nl_langinfo='undef'
d_off64_t='undef'
d_old_pthread_create_joinable='undef'
d_oldpthreads='undef'
d_oldsock='undef'
d_open3='define'
d_pathconf='undef'
d_pause='undef'
d_perl_otherlibdirs='undef'
d_phostname='undef'
d_pipe='undef'
d_poll='undef'
d_portable='undef'
d_procselfexe='undef'
d_pthread_atfork='undef'
d_pthread_attr_setscope='undef'
d_pthread_yield='undef'
d_pwage='undef'
d_pwchange='undef'
d_pwclass='undef'
d_pwcomment='undef'
d_pwexpire='undef'
d_pwgecos='undef'
d_pwpasswd='undef'
d_pwquota='undef'
d_qgcvt='undef'
d_random_r='undef'
d_readdir64_r='undef'
d_readdir='define'
d_readdir_r='undef'
d_readlink='undef'
d_readv='undef'
d_readv='undef'
d_recvmsg='undef'
d_recvmsg='undef'
d_rename='define'
d_rewinddir='define'
d_rmdir='define'
d_safebcpy='undef'
d_safemcpy='undef'
d_sanemcmp='define'
d_sbrkproto='undef'
d_scalbnl='undef'
d_sched_yield='undef'
d_scm_rights='undef'
d_seekdir='define'
d_select='undef'
d_sem='undef'
d_semctl='undef'
d_semctl_semid_ds='define'
d_semctl_semun='define'
d_semget='undef'
d_semop='undef'
d_sendmsg='undef'
d_setegid='undef'
d_seteuid='undef'
d_setgrent='undef'
d_setgrent_r='undef'
d_setgrps='undef'
d_sethent='undef'
d_sethostent_r='undef'
d_setitimer='undef'
d_setlinebuf='undef'
d_setlocale='undef'
d_setlocale_r='undef'
d_setnent='undef'
d_setnetent_r='undef'
d_setpent='undef'
d_setpgid='undef'
d_setpgrp2='undef'
d_setpgrp='undef'
d_setprior='undef'
d_setproctitle='undef'
d_setprotoent_r='undef'
d_setpwent='undef'
d_setpwent_r='undef'
d_setregid='undef'
d_setresgid='undef'
d_setresuid='undef'
d_setreuid='undef'
d_setrgid='undef'
d_setruid='undef'
d_setsent='undef'
d_setservent_r='undef'
d_setsid='undef'
d_setvbuf='undef'
d_sfio='undef'
d_shm='undef'
d_shmat='undef'
d_shmatprototype='undef'
d_shmctl='undef'
d_shmdt='undef'
d_shmget='undef'
d_sigaction='undef'
d_sigprocmask='undef'
d_sigsetjmp='undef'
d_sin6_scope_id='undef'
d_snprintf='undef'
d_sockaddr_sa_len='undef'
d_sockatmark='undef'
d_sockatmarkproto='undef'
d_socket='define'
d_sockpair='undef'
d_socks5_init='undef'
d_srand48_r='undef'
d_srandom_r='undef'
d_sresgproto='undef'
d_sresuproto='undef'
d_statblks='define'
d_statfs='undef'
d_statfsflags='define'
d_static_inline='undef'
d_statvfs='undef'
d_stdio_cnt_lval='define'
d_stdio_ptr_lval='define'
d_stdio_ptr_lval_nochange_cnt='undef'
d_stdio_ptr_lval_sets_cnt='undef'
d_stdio_stream_array='undef'
d_stdiobase='undef'
d_stdstdio='undef'
d_strchr='define'
d_strcoll='define'
d_strctcpy='define'
d_strerrm='strerror(e)'
d_strerror='define'
d_strerror_r='undef'
d_strftime='define'
d_strlcat='undef'
d_strlcpy='undef'
d_strtod='define'
d_strtol='define'
d_strtoq='undef'
d_strtoul='define'
d_strtoull='undef'
d_strtouq='undef'
d_strxfrm='define'
d_suidsafe='undef'
d_symlink='undef'
d_syscall='undef'
d_syscallproto='undef'
d_sysconf='define'
d_sysernlst='undef'
d_syserrlst='undef'
d_system='define'
d_tcgetpgrp='undef'
d_tcsetpgrp='undef'
d_telldir='define'
d_telldirproto='define'
d_time='undef'
d_timegm='undef'
d_times='undef'
d_tm_tm_gmtoff='undef'
d_tm_tm_zone='undef'
d_tmpnam_r='undef'
d_truncate='undef'
d_ttyname_r='undef'
d_tzname='undef'
d_u32align='define'
d_ualarm='undef'
d_umask='undef'
d_uname='undef'
d_union_semun='undef'
d_unordered='undef'
d_unsetenv='undef'
d_usleepproto='undef'
d_vendorlib='undef'
d_vfork='undef'
d_void_closedir='undef'
d_voidsig='undef'
d_voidtty='undef'
d_volatile='define'
d_vprintf='define'
d_vsnprintf='undef'
d_wait4='undef'
d_waitpid='undef'
d_wcstombs='undef'
d_wctomb='undef'
d_writev='undef'
d_xenix='undef'
date='date'
db_hashtype='undef'
db_prefixtype='undef'
defvoidused='15'
direntrytype='struct dirent'
dlext='none'
dlsrc='dl_none.xs'
doublesize='8'
drand01='(rand()/(double)(1U<<RANDBITS))'
drand48_r_proto='0'
dtrace=''
dynamic_ext=''
eagain='EAGAIN'
ebcdic='undef'
echo='echo'
egrep='egrep'
emacs=''
endgrent_r_proto='0'
endhostent_r_proto='0'
endnetent_r_proto='0'
endprotoent_r_proto='0'
endpwent_r_proto='0'
endservent_r_proto='0'
eunicefix=':'
exe_ext=''
expr='expr'
extensions='Data/Dumper Digest/MD5 Errno Fcntl File/Glob Filter/Util/Call IO List/Util MIME/Base64 Opcode PerlIO/scalar Socket Storable Sys/Hostname Unicode/Storable attributes re'
fflushNULL='undef'
fflushall='define'
find=''
firstmakefile='makefile'
flex=''
fpostype='fpos_t'
freetype='void'
full_ar='arm-epoc-pe-ar'
full_csh=''
full_sed='/usr/bin/sed'
gccversion=''
getgrent_r_proto='0'
getgrgid_r_proto='0'
getgrnam_r_proto='0'
gethostbyaddr_r_proto='0'
gethostbyname_r_proto='0'
gethostent_r_proto='0'
getlogin_r_proto='0'
getnetbyaddr_r_proto='0'
getnetbyname_r_proto='0'
getnetent_r_proto='0'
getprotobyname_r_proto='0'
getprotobynumber_r_proto='0'
getprotoent_r_proto='0'
getpwent_r_proto='0'
getpwnam_r_proto='0'
getpwuid_r_proto='0'
getservbyname_r_proto='0'
getservbyport_r_proto='0'
getservent_r_proto='0'
getspnam_r_proto='0'
gidtype='gid_t'
glibpth=''
gmtime_r_proto='0'
grep='grep'
groupcat=''
groupstype='gid_t'
gzip='gzip'
h_fcntl=''
h_sysfile=''
hint=''
hostcat=''
i_arpainet='define'
i_assert='define'
i_bsdioctl='undef'
i_crypt='undef'
i_db='undef'
i_dbm='undef'
i_dirent='define'
i_dld='undef'
i_dlfcn='undef'
i_fcntl='define'
i_float='undef'
i_fp='undef'
i_fp_class='undef'
i_gdbm='undef'
i_gdbm_ndbm='undef'
i_gdbmndbm='undef'
i_grp='undef'
i_ieeefp='undef'
i_inttypes='undef'
i_langinfo='undef'
i_libutil='undef'
i_limits='define'
i_locale='undef'
i_machcthr='undef'
i_malloc='undef'
i_mallocmalloc='undef'
i_math='define'
i_memory='undef'
i_mntent='undef'
i_ndbm='undef'
i_netdb='define'
i_neterrno='undef'
i_netinettcp='define'
i_niin='define'
i_poll='undef'
i_prot='undef'
i_pthread='undef'
i_pwd='undef'
i_rpcsvcdbm='undef'
i_sfio='undef'
i_sgtty='undef'
i_shadow='undef'
i_socks='undef'
i_stdarg='define'
i_stddef='define'
i_stdlib='define'
i_string='define'
i_sunmath='undef'
i_sysaccess='undef'
i_sysdir='undef'
i_sysfile='undef'
i_sysfilio='undef'
i_sysin='undef'
i_sysioctl='define'
i_sysmman='undef'
i_sysmount='undef'
i_sysndir='undef'
i_sysparam='define'
i_syspoll='undef'
i_sysresrc='define'
i_syssecrt='undef'
i_sysselct='undef'
i_syssockio='undef'
i_sysstat='define'
i_sysstatvfs='undef'
i_systime='define'
i_systimek='undef'
i_systimes='define'
i_systypes='define'
i_sysuio='undef'
i_sysun='undef'
i_syswait='define'
i_termio='undef'
i_termios='undef'
i_time='define'
i_unistd='define'
i_utime='undef'
i_values='undef'
i_varargs='undef'
i_varhdr='undef'
i_vfork='undef'
ignore_versioned_solibs=''
incpath=''
inews=''
intsize='4'
known_extensions='Data/Dumper File/Glob IO Socket Fcntl Sys/Hostname Errno'
ksh=''
ld='echo'
lddlflags=''
ldflags='-Wl,-heap,0x04000000'
ldlibpthname=''
less=''
lib_ext=''
libc=''
libperl='perl.a'
libpth=''
libs=''
libswanted=''
line=''
lint=''
lkflags=''
ln='ln'
lns='/bin/ln -s'
localtime_r_proto='0'
locincpth=''
loclibpth=''
longdblsize='8'
longlongsize='8'
longsize='4'
lp=''
lpr=''
ls='ls'
lseeksize='8'
lseektype='off_t'
mad='undef'
mail=''
mailx=''
make='make'
make_set_make='#'
mallocobj=''
mallocsrc=''
malloctype='void *'
man1='man1'
man1dir=''
man1direxp=''
man1ext=''
man2='man2'
man2ext='2'
man3='man3'
man3dir=''
man3direxp=''
man3ext=''
man4='man4'
man4ext='4'
man5='man5'
man5ext='5'
man6='man6'
man6ext='6'
man7='man7'
man7ext='7'
man8='man8'
man8ext='8'
mips=''
mips_type=''
mkdir='mkdir'
mmaptype=''
modetype='mode_t'
more='more'
multiarch='define'
mv=''
myarchname='epoc'
mydomain='.gmx.de'
myhostname='dragon'
myuname=''
n='-n'
need_va_copy='undef'
netdb_hlen_type='int'
netdb_host_type='const char *'
netdb_name_type='const char *'
netdb_net_type='int'
nm='arm-epoc-pe-nm'
nm_opt=''
nm_so_opt=''
nonxs_ext='Errno'
nroff='nroff'
o_nonblock='O_NONBLOCK'
obj_ext=''
old_pthread_create_joinable=''
optimize='-fomit-frame-pointer -DNDEBUG -O'
orderlib=''
osname='epoc'
osvers=''
otherlibdirs=''
package=''
pager=''
passcat=''
patchlevel=''
path_sep=':'
perl=''
perl_static_inline='static'
perladmin=''
perlpath=''
pg=''
phostname=''
pidtype='pid_t'
plibpth=''
pmake=''
pr=''
prefix=''
prefixexp=''
privlib='/usr/lib/perl/5.15.1'
privlibexp='/usr/lib/perl/5.15.1'
procselfexe=''
prototype='define'
ptrsize='4'
randbits='31'
randfunc=''
random_r_proto='0'
randseedtype='unsigned'
ranlib='arm-epoc-pe-ranlib'
rd_nodata='-1'
readdir64_r_proto='0'
readdir_r_proto='0'
rm='rm'
rmail=''
runnm='false'
sGMTIME_max='2147483647'
sGMTIME_min='0'
sLOCALTIME_max='2147483647'
sLOCALTIME_min='0'
sPRIEUldbl=''
sPRIFUldbl=''
sPRIGUldbl=''
sPRIXU64=''
sPRId64=''
sPRIeldbl=''
sPRIfldbl='"f"'
sPRIgldbl='"g"'
sPRIi64=''
sPRIo64=''
sPRIu64=''
sPRIx64=''
sched_yield=''
scriptdir=''
scriptdirexp=''
sed='sed'
seedfunc='srand'
selectminbits='32'
selecttype=''
sendmail=''
setgrent_r_proto='0'
sethostent_r_proto='0'
setlocale_r_proto='0'
setnetent_r_proto='0'
setprotoent_r_proto='0'
setpwent_r_proto='0'
setservent_r_proto='0'
sh='/bin/sh'
shar=''
sharpbang='#!'
shmattype=''
shortsize='2'
shrpenv=''
shsharp=''
sig_name=''
sig_name_init='"ZERO", 0'
sig_num='0'
sig_num_init='0, 0'
sig_size='1'
signal_t='void'
sitearch='/usr/lib/perl/site_perl/5.15.1/epoc'
sitearchexp='/usr/lib/perl/site_perl/5.15.1/epoc'
sitelib='/usr/lib/perl/site_perl/5.15.1/'
sitelib_stem='/usr/lib/perl/site_perl'
sitelibexp='/usr/lib/perl/site_perl/5.15.1/'
siteprefix=''
siteprefixexp=''
sizesize='4'
sizetype='size_t'
sleep=''
smail=''
so=''
sockethdr=''
socketlib=''
socksizetype='size_t'
sort='sort'
spackage=''
spitshell='cat'
srand48_r_proto='0'
srandom_r_proto='0'
src='.'
ssizetype='long'
startperl=''
startsh='#!/bin/sh'
static_ext='Data/Dumper File/Glob IO Socket Fcntl Sys/Hostname'
stdchar='char'
stdio_base=''
stdio_bufsiz=''
stdio_cnt=''
stdio_filbuf=''
stdio_ptr=''
stdio_stream_array=''
st_ino_sign='1'
st_ino_size='4'
strerror_r_proto='0'
strings=''
submit=''
subversion=''
sysman=''
tail=''
tar=''
tbl=''
tee='tee'
test='test'
timeincl=''
timetype='time_t'
tmpnam_r_proto='0'
touch='touch'
tr='tr'
trnl='\n'
troff=''
ttyname_r_proto='0'
uidsign='1'
uidtype='uid_t'
uname='uname'
uniq='uniq'
use64bitall='undef'
use64bitint='undef'
usecrosscompile='define'
usedevel='undef'
usedl='undef'
usedtrace='undef'
usefaststdio='undef'
uselargefiles='undef'
uselongdouble='undef'
usemallocwrap='undef'
usemorebits='undef'
usemultiplicity='undef'
usemymalloc='n'
usenm=''
useopcode=''
useperlio='undef'
useposix=''
usereentrant='undef'
userelocatableinc='undef'
usesfio=''
useshrplib=''
usesitecustomize='undef'
usesocks='undef'
usethreads='undef'
usevendorprefix=''
usevfork=''
usrinc=''
uuname=''
vaproto='undef'
vendorlib=''
vendorlib_stem=''
vendorlibexp=''
vendorprefix=''
vendorprefixexp=''
version='5.15.1'
versiononly='undef'
vi=''
voidflags='15'
xlibpth=''
zcat=''
zip=''
# Configure command line arguments.
config_arg0=''
config_args=''
config_argc=11
config_arg1=''
config_arg2=''
config_arg3=''
config_arg4=''
config_arg5=''
config_arg6=''
config_arg7=''
config_arg8=''
config_arg9=''
config_arg10=''
config_arg11=''
PERL_REVISION=5
PERL_VERSION=15
PERL_SUBVERSION=1
PERL_API_REVISION=5
PERL_API_VERSION=15
PERL_API_SUBVERSION=1
PERL_CONFIG_SH=true
# Variables propagated from previous config.sh file.
pp_sys_cflags=''
epocish_cflags='ccflags="$cflags -xc++"'
ivtype='int'
uvtype='unsigned int'
i8type='char'
u8type='unsigned char'
i16type='short'
u16type='unsigned short'
i32type='int'
u32type='unsigned int'
i64type='long long'
u64type='unsigned long long'
d_quad='define'
quadtype='long long'
quadtype='unsigned long long'
quadkind='QUAD_IS_LONG_LONG'
nvtype='double'
ivsize='4'
uvsize='4'
i8size='1'
u8size='1'
i16size='2'
u16size='2'
i32size='4'
u32size='4'
i64size='8'
u64size='8'
d_fs_data_s='undef'
d_fseeko='undef'
d_ldbl_dig='undef'
d_sprintf_returns_strlen='undef'
d_sqrtl='undef'
d_getmnt='undef'
d_statfs_f_flags='undef'
d_statfs_s='undef'
d_usleep='undef'
d_ustat='undef'
i_sysstatfs='undef'
i_sysvfs='undef'
i_ustat='undef'
uidsize='2'
uidsign='1'
gidsize='2'
gidsign='1'
ivdformat='"ld"'
uvuformat='"lu"'
uvoformat='"lo"'
uvxformat='"lx"'
uvXUformat='"lX"'
uidformat='"hu"'
gidformat='"hu"'
d_strtold='undef'
d_strtoll='undef'
d_strtouq='undef'
d_nv_preserves_uv='define'
nv_preserves_uv_bits='32'
nv_overflows_integers_at='0'
useithreads='undef'
inc_version_list=' '
inc_version_list_init='0'
d_madvise='undef'
d_mkdtemp='undef'
d_mkstemp='undef'
d_mkstemps='undef'
d_mmap='undef'
d_mprotect='undef'
d_msync='undef'
d_munmap='undef'
d_qgcvt='undef'
d_socklen_t='undef'
d_vendorarch=''
i_ieeefp='undef'
i_sunmath='undef'
i_syslog='undef'
i_sysmman='undef'
i_sysutsname='undef'
installvendorarch=''
mmaptype=''
revision='5'
sizesize='4'
socksizetype='int'

double='undef'
usemorebits='undef'
usemultiplicity='undef'
usemymalloc='n'
usenm=''
useopcode=''
useperlio='undef'
useposix=''
usesfio=''
useshrplib=''
usesocks='undef'
usethreads='undef'
usevendorprefix=''
usevfork=''
usrinc=''
uuname=''
vendorlib=''
vendorlib_stem=''
vendorlibexp=''
vendorprefix=''
vendorprefixexp=''
version='5.15.1'
vi=''
voidflags='15'
xlibpth=''
zcat=''
zip=''
# Configure command line arguments.
config_arg0=''
config_args=''
config_argc=11
config_arg1=''
config_arg2=''
config_arg3=''
config_arg4=''
config_arg5=''
config_arg6=''
config_arg7=''
config_arg8=''
config_arg9=''
config_arg10=''
config_arg11=''
PERL_REVISION=5
PERL_VERSION=15
PERL_SUBVERSION=1
PERL_API_REVISION=5
PERL_API_VERSION=15
PERL_API_SUBVERSION=1
CONFIGDOTSH=true
# Variables propagated from previous config.sh file.
pp_sys_cflags=''
epocish_cflags='ccflags="$cflags -xc++"'
ivtype='int'
uvtype='unsigned int'
i8type='char'
u8type='unsigned char'
i16type='short'
u16type='unsigned short'
i32type='int'
u32type='unsigned int'
i64type='long long'
u64type='unsigned long long'
d_quad='define'
quadtype='long long'
quadtype='unsigned long long'
quadkind='QUAD_IS_LONG_LONG'
nvtype='double'
ivsize='4'
uvsize='4'
i8size='1'
u8size='1'
i16size='2'
u16size='2'
i32size='4'
u32size='4'
i64size='8'
u64size='8'
d_fs_data_s='undef'
d_fseeko='undef'
d_ldbl_dig='undef'
d_sqrtl='undef'
d_getmnt='undef'
d_statfs_f_flags='undef'
d_statfs_s='undef'
d_ustat='undef'
i_sysstatfs='undef'
i_sysvfs='undef'
i_ustat='undef'
uidsize='2'
uidsign='1'
gidsize='2'
gidsign='1'
ivdformat='"ld"'
uvuformat='"lu"'
uvoformat='"lo"'
uvxformat='"lx"'
uidformat='"hu"'
gidformat='"hu"'
d_strtold='undef'
d_strtoll='undef'
d_strtouq='undef'
d_nv_preserves_uv='define'
d_nv_zero_is_allbits_zero='undef'
use5005threads='undef'
useithreads='undef'
inc_version_list=' '
inc_version_list_init='0'
d_madvise='undef'
d_mkdtemp='undef'
d_mkstemp='undef'
d_mkstemps='undef'
d_mmap='undef'
d_mprotect='undef'
d_msync='undef'
d_munmap='undef'
d_qgcvt='undef'
d_socklen_t='undef'
d_vendorarch=''
i_ieeefp='undef'
i_sunmath='undef'
i_syslog='undef'
i_sysmman='undef'
i_sysutsname='undef'
installvendorarch=''
mmaptype=''
revision='5'
sizesize='4'
socksizetype='int'
d_getcwd='define'
i_sysmode='undef'
d_vendorarch='undef'
d_frexpl='undef'
d_getespwnam='undef'
d_getprpwnam='undef'
d_isnan='define'
d_isnanl='undef'
d_modfl='undef'
d_setproctitle='undef'
d_socks5_init='undef'
i_libutil='undef'
i_prot='undef'
d_SCNfldbl='undef'
d_perl_otherlibdirs='undef'
nvsize='16'
issymlink=''
installarchlib='/home/of/PERL/perl/lib/5.15.1/epoc'
installbin='/home/of/PERL/System/Programs/'
installman1dir='/home/of/PERL/man1'
installman3dir='/home/of/PERL/man3'
installprefix=''
installprefixexp=''
installprivlib='/home/of/PERL/perl/lib/5.15.1/'
installscript='/home/of/PERL/bin/'
installsitearch='/home/of/PERL/site/lib/site_perl/5.15.1/epoc'
installsitelib='/home/of/PERL/perl/lib/site_perl/5.15.1'
installstyle=''
installusrbinperl='undef'
installvendorlib=''
nveformat='"e"'
nvfformat='"f"'
nvgformat='"g"'
sSCNfldbl=''
uquadtype='uint64_t'
d_builtin_choose_expr='undef'
d_builtin_expect='undef'
d_ctermid='undef'
d_inc_version_list='undef'
d_libm_lib_version='0'
d_prctl='undef'
d_prctl_set_name='undef'
d_printf_format_null='undef'
d_pseudofork='undef'
d_signbit='undef'
d_sitearch='undef'
db_version_major='0'
db_version_minor='0'
db_version_patch='0'
targetarch=''
vendorarch=''
vendorarchexp=''

