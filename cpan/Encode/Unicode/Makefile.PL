use 5.7.2;
use strict;
use ExtUtils::MakeMaker;

my %makefileattrs = (
              INC		=> "-I../Encode",
          NAME		=> 'Encode::Unicode',
          VERSION_FROM	=> "Unicode.pm",
          MAN3PODS  => {},
          );

# Need further investigation as why this doesn't get set
if ("@ARGV" =~ /\bPERLRUN_CROSS=(.*)\b/) {
    $makefileattrs{PERLRUN_CROSS}=$1;
}

WriteMakefile(%makefileattrs);

