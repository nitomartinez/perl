package ExtUtils::MM_Win32;

use strict;


=head1 NAME

ExtUtils::MM_Win32 - methods to override UN*X behaviour in ExtUtils::MakeMaker

=head1 SYNOPSIS

 use ExtUtils::MM_Win32; # Done internally by ExtUtils::MakeMaker if needed

=head1 DESCRIPTION

See ExtUtils::MM_Unix for a documentation of the methods provided
there. This package overrides the implementation of these methods, not
the semantics.

=cut 

use ExtUtils::MakeMaker::Config;
use File::Basename;
use File::Spec;
use ExtUtils::MakeMaker qw( neatvalue );

require ExtUtils::MM_Any;
require ExtUtils::MM_Unix;
our @ISA = qw( ExtUtils::MM_Any ExtUtils::MM_Unix );
our $VERSION = '6.58';

$ENV{EMXSHELL} = 'sh'; # to run `commands`

my ( $BORLAND, $GCC, $DLLTOOL ) = _identify_compiler_environment( \%Config );

sub _identify_compiler_environment {
	my ( $config ) = @_;

	my $BORLAND = $config->{cc} =~ /^bcc/i ? 1 : 0;
	my $GCC     = $config->{cc} =~ /\bgcc\b/i ? 1 : 0;
	my $DLLTOOL = $config->{dlltool} || 'dlltool';

	return ( $BORLAND, $GCC, $DLLTOOL );
}


=head2 Overridden methods

=over 4

=item B<dlsyms>

=cut

sub dlsyms {
    my($self,%attribs) = @_;

    my($funcs) = $attribs{DL_FUNCS} || $self->{DL_FUNCS} || {};
    my($vars)  = $attribs{DL_VARS} || $self->{DL_VARS} || [];
    my($funclist) = $attribs{FUNCLIST} || $self->{FUNCLIST} || [];
    my($imports)  = $attribs{IMPORTS} || $self->{IMPORTS} || {};
    my(@m);

    if (not $self->{SKIPHASH}{'dynamic'}) {
	push(@m,"
$self->{BASEEXT}.def: Makefile.PL
",
     q!	$(PERLRUN) -MExtUtils::Mksymlists \\
     -e "Mksymlists('NAME'=>\"!, $self->{NAME},
     q!\", 'DLBASE' => '!,$self->{DLBASE},
     # The above two lines quoted differently to work around
     # a bug in the 4DOS/4NT command line interpreter.  The visible
     # result of the bug was files named q('extension_name',) *with the
     # single quotes and the comma* in the extension build directories.
     q!', 'DL_FUNCS' => !,neatvalue($funcs),
     q!, 'FUNCLIST' => !,neatvalue($funclist),
     q!, 'IMPORTS' => !,neatvalue($imports),
     q!, 'DL_VARS' => !, neatvalue($vars), q!);"
!);
    }
    join('',@m);
}

=item replace_manpage_separator

Changes the path separator with .

=cut

sub replace_manpage_separator {
    my($self,$man) = @_;
    $man =~ s,/+,.,g;
    $man;
}


=item B<maybe_command>

Since Windows has nothing as simple as an executable bit, we check the
file extension.

The PATHEXT env variable will be used to get a list of extensions that
might indicate a command, otherwise .com, .exe, .bat and .cmd will be
used by default.

=cut

sub maybe_command {
    my($self,$file) = @_;
    my @e = exists($ENV{'PATHEXT'})
          ? split(/;/, $ENV{PATHEXT})
	  : qw(.com .exe .bat .cmd);
    my $e = '';
    for (@e) { $e .= "\Q$_\E|" }
    chop $e;
    # see if file ends in one of the known extensions
    if ($file =~ /($e)$/i) {
	return $file if -e $file;
    }
    else {
	for (@e) {
	    return "$file$_" if -e "$file$_";
	}
    }
    return;
}


=item B<init_DIRFILESEP>

Using \ for Windows.

=cut

sub init_DIRFILESEP {
    my($self) = shift;

    # The ^ makes sure its not interpreted as an escape in nmake
    $self->{DIRFILESEP} = $self->is_make_type('nmake') ? '^\\' :
                          $self->is_make_type('dmake') ? '\\\\'
                                                       : '\\';
}

=item B<init_others>

Override some of the Unix specific commands with portable
ExtUtils::Command ones.

Also provide defaults for LD and AR in case the %Config values aren't
set.

LDLOADLIBS's default is changed to $Config{libs}.

Adjustments are made for Borland's quirks needing -L to come first.

=cut

sub init_others {
    my ($self) = @_;

    $self->{NOOP}     ||= 'rem';
    $self->{DEV_NULL} ||= '> NUL';

    $self->{FIXIN}    ||= $self->{PERL_CORE} ? 
      "\$(PERLRUN) $self->{PERL_SRC}/win32/bin/pl2bat.pl" : 
      'pl2bat.bat';

    $self->{LD}     ||= 'link';
    $self->{AR}     ||= 'lib';

    $self->SUPER::init_others;

    # Setting SHELL from $Config{sh} can break dmake.  Its ok without it.
    delete $self->{SHELL};

    $self->{LDLOADLIBS} ||= $Config{libs};
    # -Lfoo must come first for Borland, so we put it in LDDLFLAGS
    if ($BORLAND) {
        my $libs = $self->{LDLOADLIBS};
        my $libpath = '';
        while ($libs =~ s/(?:^|\s)(("?)-L.+?\2)(?:\s|$)/ /) {
            $libpath .= ' ' if length $libpath;
            $libpath .= $1;
        }
        $self->{LDLOADLIBS} = $libs;
        $self->{LDDLFLAGS} ||= $Config{lddlflags};
        $self->{LDDLFLAGS} .= " $libpath";
    }

    return 1;
}


=item init_platform

Add MM_Win32_VERSION.

=item platform_constants

=cut

sub init_platform {
    my($self) = shift;

    $self->{MM_Win32_VERSION} = $VERSION;

    return;
}

sub platform_constants {
    my($self) = shift;
    my $make_frag = '';

    foreach my $macro (qw(MM_Win32_VERSION))
    {
        next unless defined $self->{$macro};
        $make_frag .= "$macro = $self->{$macro}\n";
    }

    return $make_frag;
}


=item constants

Add MAXLINELENGTH for dmake before all the constants are output.

=cut

sub constants {
    my $self = shift;

    my $make_text = $self->SUPER::constants;
    return $make_text unless $self->is_make_type('dmake');

    # dmake won't read any single "line" (even those with escaped newlines)
    # larger than a certain size which can be as small as 8k.  PM_TO_BLIB
    # on large modules like DateTime::TimeZone can create lines over 32k.
    # So we'll crank it up to a <ironic>WHOPPING</ironic> 64k.
    #
    # This has to come here before all the constants and not in
    # platform_constants which is after constants.
    my $size = $self->{MAXLINELENGTH} || 64 * 1024;
    my $prefix = qq{
# Get dmake to read long commands like PM_TO_BLIB
MAXLINELENGTH = $size

};

    return $prefix . $make_text;
}


=item special_targets

Add .USESHELL target for dmake.

=cut

sub special_targets {
    my($self) = @_;

    my $make_frag = $self->SUPER::special_targets;

    $make_frag .= <<'MAKE_FRAG' if $self->is_make_type('dmake');
.USESHELL :
MAKE_FRAG

    return $make_frag;
}


=item static_lib

Changes how to run the linker.

The rest is duplicate code from MM_Unix.  Should move the linker code
to its own method.

=cut

sub static_lib {
    my($self) = @_;
    return '' unless $self->has_link_code;

    my(@m);
    push(@m, <<'END');
$(INST_STATIC): $(OBJECT) $(MYEXTLIB) $(INST_ARCHAUTODIR)$(DFSEP).exists
	$(RM_RF) $@
END

    # If this extension has its own library (eg SDBM_File)
    # then copy that to $(INST_STATIC) and add $(OBJECT) into it.
    push @m, <<'MAKE_FRAG' if $self->{MYEXTLIB};
	$(CP) $(MYEXTLIB) $@
MAKE_FRAG

    push @m,
q{	$(AR) }.($BORLAND ? '$@ $(OBJECT:^"+")'
			  : ($GCC ? '-ru $@ $(OBJECT)'
			          : '-out:$@ $(OBJECT)')).q{
	$(CHMOD) $(PERM_RWX) $@
	$(NOECHO) $(ECHO) "$(EXTRALIBS)" > $(INST_ARCHAUTODIR)\extralibs.ld
};

    # Old mechanism - still available:
    push @m, <<'MAKE_FRAG' if $self->{PERL_SRC} && $self->{EXTRALIBS};
	$(NOECHO) $(ECHO) "$(EXTRALIBS)" >> $(PERL_SRC)\ext.libs
MAKE_FRAG

    join('', @m);
}


=item dynamic_lib

Complicated stuff for Win32 that I don't understand. :(

=cut

sub dynamic_lib {
    my($self, %attribs) = @_;
    return '' unless $self->needs_linking(); #might be because of a subdir

    return '' unless $self->has_link_code;

    my($otherldflags) = $attribs{OTHERLDFLAGS} || ($BORLAND ? 'c0d32.obj': '');
    my($inst_dynamic_dep) = $attribs{INST_DYNAMIC_DEP} || "";
    my($ldfrom) = '$(LDFROM)';
    my(@m);

    push(@m,'
# This section creates the dynamically loadable $(INST_DYNAMIC)
# from $(OBJECT) and possibly $(MYEXTLIB).
OTHERLDFLAGS = '.$otherldflags.'
INST_DYNAMIC_DEP = '.$inst_dynamic_dep.'

$(INST_DYNAMIC): $(OBJECT) $(MYEXTLIB) $(BOOTSTRAP) $(INST_ARCHAUTODIR)$(DFSEP).exists $(EXPORT_LIST) $(PERL_ARCHIVE) $(INST_DYNAMIC_DEP)
');
    if ($GCC) {
      push(@m,  
       q{	}.$DLLTOOL.q{ --def $(EXPORT_LIST) --output-exp dll.exp
	$(LD) -o $@ -Wl,--base-file -Wl,dll.base $(LDDLFLAGS) }.$ldfrom.q{ $(OTHERLDFLAGS) $(MYEXTLIB) $(PERL_ARCHIVE) $(LDLOADLIBS) dll.exp
	}.$DLLTOOL.q{ --def $(EXPORT_LIST) --base-file dll.base --output-exp dll.exp
	$(LD) -o $@ $(LDDLFLAGS) }.$ldfrom.q{ $(OTHERLDFLAGS) $(MYEXTLIB) $(PERL_ARCHIVE) $(LDLOADLIBS) dll.exp });
    } elsif ($BORLAND) {
      push(@m,
       q{	$(LD) $(LDDLFLAGS) $(OTHERLDFLAGS) }.$ldfrom.q{,$@,,}
       .($self->is_make_type('dmake')
                ? q{$(PERL_ARCHIVE:s,/,\,) $(LDLOADLIBS:s,/,\,) }
		 .q{$(MYEXTLIB:s,/,\,),$(EXPORT_LIST:s,/,\,)}
		: q{$(subst /,\,$(PERL_ARCHIVE)) $(subst /,\,$(LDLOADLIBS)) }
		 .q{$(subst /,\,$(MYEXTLIB)),$(subst /,\,$(EXPORT_LIST))})
       .q{,$(RESFILES)});
    } else {	# VC
      push(@m,
       q{	$(LD) -out:$@ $(LDDLFLAGS) }.$ldfrom.q{ $(OTHERLDFLAGS) }
      .q{$(MYEXTLIB) $(PERL_ARCHIVE) $(LDLOADLIBS) -def:$(EXPORT_LIST)});

      # Embed the manifest file if it exists
      push(@m, q{
	if exist $@.manifest mt -nologo -manifest $@.manifest -outputresource:$@;2
	if exist $@.manifest del $@.manifest});
    }
    push @m, '
	$(CHMOD) $(PERM_RWX) $@
';

    join('',@m);
}

=item extra_clean_files

Clean out some extra dll.{base,exp} files which might be generated by
gcc.  Otherwise, take out all *.pdb files.

=cut

sub extra_clean_files {
    my $self = shift;

    return $GCC ? (qw(dll.base dll.exp)) : ('*.pdb');
}

=item init_linker

=cut

sub init_linker {
    my $self = shift;

    $self->{PERL_ARCHIVE}       = "\$(PERL_INC)\\$Config{libperl}";
    $self->{PERL_ARCHIVE_AFTER} = '';
    $self->{EXPORT_LIST}        = '$(BASEEXT).def';
}


=item perl_script

Checks for the perl program under several common perl extensions.

=cut

sub perl_script {
    my($self,$file) = @_;
    return $file if -r $file && -f _;
    return "$file.pl"  if -r "$file.pl" && -f _;
    return "$file.plx" if -r "$file.plx" && -f _;
    return "$file.bat" if -r "$file.bat" && -f _;
    return;
}


=item xs_o

This target is stubbed out.  Not sure why.

=cut

sub xs_o {
    return ''
}


=item pasthru

All we send is -nologo to nmake to prevent it from printing its damned
banner.

=cut

sub pasthru {
    my($self) = shift;
    return "PASTHRU = " . ($self->is_make_type('nmake') ? "-nologo" : "");
}


=item arch_check (override)

Normalize all arguments for consistency of comparison.

=cut

sub arch_check {
    my $self = shift;

    # Win32 is an XS module, minperl won't have it.
    # arch_check() is not critical, so just fake it.
    return 1 unless $self->can_load_xs;
    return $self->SUPER::arch_check( map { $self->_normalize_path_name($_) } @_);
}

sub _normalize_path_name {
    my $self = shift;
    my $file = shift;

    require Win32;
    my $short = Win32::GetShortPathName($file);
    return defined $short ? lc $short : lc $file;
}


=item oneliner

These are based on what command.com does on Win98.  They may be wrong
for other Windows shells, I don't know.

=cut

sub oneliner {
    my($self, $cmd, $switches) = @_;
    $switches = [] unless defined $switches;

    # Strip leading and trailing newlines
    $cmd =~ s{^\n+}{};
    $cmd =~ s{\n+$}{};

    $cmd = $self->quote_literal($cmd);
    $cmd = $self->escape_newlines($cmd);

    $switches = join ' ', @$switches;

    return qq{\$(ABSPERLRUN) $switches -e $cmd --};
}


sub quote_literal {
    my($self, $text) = @_;

    # DOS batch processing is hilarious:
    # Quotes need to be converted into triple quotes.
    # Certain special characters need to be escaped with a caret if an odd
    # number of quotes came before them.
    my @text        = split '', $text;
    my $quote_count = 0;
    my %caret_chars = map { $_ => 1 } qw( < > | );
    for my $char ( @text ) {
        if ( $char eq '"' ) {
            $quote_count++;
            $char = '"""';
        }
        elsif ( $caret_chars{$char} and $quote_count % 2 ) {
            $char = "^$char";
        }
        elsif ( $char eq "\\" ) {
            $char = "\\\\";
        }
    }
    $text = join '', @text;
    
    # There is a terribly confusing edge case here, where this will do entirely the wrong thing:
    # perl -e "use Data::Dumper; @ARGV = '%PATH%'; print Dumper( \@ARGV );print qq{@ARGV};" --
    # I have no idea how to fix this manually, much less programmatically.
    # However as it is such a rare edge case i'll just leave this documentation here and hope it never happens.

    # dmake eats '{' inside double quotes and leaves alone { outside double
    # quotes; however it transforms {{ into { either inside and outside double
    # quotes.  It also translates }} into }.  The escaping below is not
    # 100% correct.
    if( $self->is_make_type('dmake') ) {
        $text =~ s/{/{{/g;
        $text =~ s/}}/}}}/g;
    }

    return qq{"$text"};
}


sub escape_newlines {
    my($self, $text) = @_;

    # Escape newlines
    $text =~ s{\n}{\\\n}g;

    return $text;
}


=item cd

dmake can handle Unix style cd'ing but nmake (at least 1.5) cannot.  It
wants:

    cd dir1\dir2
    command
    another_command
    cd ..\..

=cut

sub cd {
    my($self, $dir, @cmds) = @_;

    return $self->SUPER::cd($dir, @cmds) unless $self->is_make_type('nmake');

    my $cmd = join "\n\t", map "$_", @cmds;

    my $updirs = $self->catdir(map { $self->updir } $self->splitdir($dir));

    # No leading tab and no trailing newline makes for easier embedding.
    my $make_frag = sprintf <<'MAKE_FRAG', $dir, $cmd, $updirs;
cd %s
	%s
	cd %s
MAKE_FRAG

    chomp $make_frag;

    return $make_frag;
}


=item max_exec_len

nmake 1.50 limits command length to 2048 characters.

=cut

sub max_exec_len {
    my $self = shift;

    return $self->{_MAX_EXEC_LEN} ||= 2 * 1024;
}


=item os_flavor

Windows is Win32.

=cut

sub os_flavor {
    return('Win32');
}


=item cflags

Defines the PERLDLL symbol if we are configured for static building since all
code destined for the perl5xx.dll must be compiled with the PERLDLL symbol
defined.

=cut

sub cflags {
    my($self,$libperl)=@_;
    return $self->{CFLAGS} if $self->{CFLAGS};
    return '' unless $self->needs_linking();

    my $base = $self->SUPER::cflags($libperl);
    foreach (split /\n/, $base) {
        /^(\S*)\s*=\s*(\S*)$/ and $self->{$1} = $2;
    };
    $self->{CCFLAGS} .= " -DPERLDLL" if ($self->{LINKTYPE} eq 'static');

    return $self->{CFLAGS} = qq{
CCFLAGS = $self->{CCFLAGS}
OPTIMIZE = $self->{OPTIMIZE}
PERLTYPE = $self->{PERLTYPE}
};

}

sub is_make_type {
    my($self, $type) = @_;
    return !! ($self->make =~ /\b$type(?:\.exe)?$/);
}

1;
__END__

=back

=cut 


