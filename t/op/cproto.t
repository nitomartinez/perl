#!./perl
# Tests to ensure that we don't unexpectedly change prototypes of builtins

BEGIN {
    chdir 't' if -d 't';
    @INC = '../lib';
}

BEGIN { require './test.pl'; }
plan tests => 243;

while (<DATA>) {
    chomp;
    (my $keyword, my $proto, local $TODO) = split " ", $_, 3;
    if ($proto eq 'undef') {
	ok( !defined prototype "CORE::".$keyword, $keyword );
    }
    elsif ($proto eq 'unknown') {
	eval { prototype "CORE::".$keyword };
	like( $@, qr/Can't find an opnumber for/, $keyword );
    }
    else {
	is( "(".prototype("CORE::".$keyword).")", $proto, $keyword );
    }
}

# the keyword list :

__DATA__
__FILE__ ()
__LINE__ ()
__PACKAGE__ ()
__DATA__ undef
__END__ undef
abs (_)
accept (**)
alarm (_)
and undef
atan2 ($$)
bind (*$)
binmode (*;$)
bless ($;$)
caller (;$)
chdir (;$)
chmod (@)
chomp undef
chop undef
chown (@)
chr (_)
chroot (_)
close (;*)
closedir (*)
cmp undef
connect (*$)
continue ()
cos (_)
crypt ($$)
dbmclose (\%)
dbmopen (\%$$)
default undef
defined undef
delete undef
die (@)
do undef
dump ()
each (+)
else undef
elsif undef
endgrent ()
endhostent ()
endnetent ()
endprotoent ()
endpwent ()
endservent ()
eof (;*)
eq undef
eval undef
exec undef
exists undef
exit (;$)
exp (_)
fcntl (*$$)
fileno (*)
flock (*$)
for undef
foreach undef
fork ()
format undef
formline ($@)
ge undef
getc (;*)
getgrent ()
getgrgid ($)
getgrnam ($)
gethostbyaddr ($$)
gethostbyname ($)
gethostent ()
getlogin ()
getnetbyaddr ($$)
getnetbyname ($)
getnetent ()
getpeername (*)
getpgrp (;$)
getppid ()
getpriority ($$)
getprotobyname ($)
getprotobynumber ($)
getprotoent ()
getpwent ()
getpwnam ($)
getpwuid ($)
getservbyname ($$)
getservbyport ($$)
getservent ()
getsockname (*)
getsockopt (*$$)
given undef
glob undef
gmtime (;$)
goto undef
grep undef
gt undef
hex (_)
if undef
index ($$;$)
int (_)
ioctl (*$$)
join ($@)
keys (+)
kill (@)
last undef
lc (_)
lcfirst (_)
le undef
length (_)
link ($$)
listen (*$)
local undef
localtime (;$)
lock (\[$@%*])
log (_)
lstat undef
lt undef
m undef
map undef
mkdir (_;$)
msgctl ($$$)
msgget ($$)
msgrcv ($$$$$)
msgsnd ($$$)
my undef
ne undef
next undef
no undef
not ($)
oct (_)
open (*;$@)
opendir (*$)
or undef
ord (_)
our undef
pack ($@)
package undef
pipe (**)
pop (;+)
pos undef
print undef
printf undef
prototype undef
push (+@)
q undef
qq undef
qr undef
quotemeta (_)
qw undef
qx undef
rand (;$)
read (*\$$;$)
readdir (*)
readline (;*)
readlink (_)
readpipe (_)
recv (*\$$$)
redo undef
ref (_)
rename ($$)
require undef
reset (;$)
return undef
reverse (@)
rewinddir (*)
rindex ($$;$)
rmdir (_)
s undef
say undef
scalar undef
seek (*$$)
seekdir (*$)
select (;*)
semctl ($$$$)
semget ($$$)
semop ($$)
send (*$$;$)
setgrent ()
sethostent ($)
setnetent ($)
setpgrp (;$$)
setpriority ($$$)
setprotoent ($)
setpwent ()
setservent ($)
setsockopt (*$$$)
shift (;+)
shmctl ($$$)
shmget ($$$)
shmread ($$$$)
shmwrite ($$$$)
shutdown (*$)
sin (_)
sleep (;$)
socket (*$$$)
socketpair (**$$$)
sort undef
splice (+;$$@)
split undef
sprintf ($@)
sqrt (_)
srand (;$)
stat undef
state undef
study undef
sub undef
substr ($$;$$)
symlink ($$)
syscall ($@)
sysopen (*$$;$)
sysread (*\$$;$)
sysseek (*$$)
system undef
syswrite (*$;$$)
tell (;*)
telldir (*)
tie (\[$@%*]$@)
tied (\[$@%*])
time ()
times ()
tr undef
truncate ($$)
uc (_)
ucfirst (_)
umask (;$)
undef undef
unless undef
unlink (@)
unpack ($;$)
unshift (+@)
untie (\[$@%*])
until undef
use undef
utime (@)
values (+)
vec ($$$)
wait ()
waitpid ($$)
wantarray ()
warn (@)
when undef
while undef
write (;*)
x undef
xor undef
y undef
