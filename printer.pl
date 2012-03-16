
#!/usr/bin/perl
#
# Printer Fun :-)
# by Laurens (laurens@netric.org)
#
# little perl script to change the "ready message"
# on printers that support PJL commands.
#
# tested on a HP 4000/4100
#

use strict;
use IO::Socket;
use Getopt::Std;

my %opt;
my $data;
my $socket;


getopts("r:t:h", \%opt);
usage() if not %opt or $opt{h};

if ($opt{t} and $opt{r}) {

print "[+] Setting the printer ready message:\n";
print " " . substr($opt{r}, 0,16) . "\n";
print " " . substr($opt{r}, 16,16) . "\n";

$data = "\033%-12345X" .
"\@PJL RDYMSG DISPLAY=\"" .
"$opt{r}\"\r\n\033%-12345X\r\n"; 

$socket = IO::Socket::INET->new(
PeerAddr=>$opt{t},
PeerPort=>9100,
Proto =>'tcp')
or die "[-] Couldn't connect to $opt{t}:9100 : $!\n\n";

print $socket $data;
close ($socket);

print "[+] DONE!\n\n";
} else {
print "\n[-] Specify -r and -t!\n\n";
}
