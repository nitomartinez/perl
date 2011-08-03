# needs to explicitly link against librt to pull in clock_nanosleep
use Config;
#print STDERR join ("\n", %Config);
## This insanity is because: $^O is being used to determine which hints file is being run, I'm cross-compiling on linux, so hints/linux.pl is run. However I'm compiling for android, so osname (in config.sh-arm-linux-android) is set to android, which does not have -lrt.
if($Config{osname} eq 'linux') {
    $self->{LIBS} = ['-lrt'];
}
