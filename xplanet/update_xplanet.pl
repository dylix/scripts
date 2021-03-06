#!/usr/bin/perl
# ------------------------------------------------------------------------------------
# Program for downloading XPlanet cloud images from a random mirror
#
# Copyright (c) 2003, cueSim Ltd. http://www.cueSim.com, Bedford, UK
#
# ------------------------------------------------------------------------------------
#
# Redistribution and use, with or without modification, are permitted provided
# that the following conditions are met:
#
# * Redistributions of source code must retain the above copyright notice,
# this list of conditions and the following disclaimer.
# * Neither the cueSim name nor the names of its contributors may
# be used to endorse or promote products derived from this software without
# specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY
# EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
# OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT
# SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
# SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT
# OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
# HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
# OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
# SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#

# download table updated 17 JANUARY 2009


use LWP::Simple;

# Set options:
# - where to save the downloaded file (default is current directory)
my $Filename = "/home/dylix/scripts/xplanet/clouds_4096.jpg";

# - how often the image is updated on the server
my $MaxDownloadFrequencyHours = 2;

# - how many times to retry, if the server doesn't respond
my $MaxRetries = 3;

## Note: excessive requests to a single image server is discouraged.
## This script limits max retries, does not download more frequently
## than every two hours (the file is generated every 3 hours). and
## picks a random mirror location for every download.
##
## Change these settings at the risk of being blacklisted from the
## image servers.


# Get file details
if(-f $Filename)
{
my @Stats = stat($Filename);
my $FileAge = (time() - $Stats[9]);
my $FileSize = $Stats[7];

# Check if file is already up to date
if($FileAge < 60 * 60 * $MaxDownloadFrequencyHours && $FileSize > 200000)
{
print "File is already up to date\n";
exit(1);
}
}


# Try several times to download the file if necessary
for(1..$MaxRetries)
{
# Get a random website to hit for the file
my $MirrorURL = GetRandomMirror("mirrors.txt");
#my $MirrorURL = "http://xplanet.explore-the-world.net/clouds_4096.jpg";

# Download the file
print "Using $MirrorURL\nDownloading...\n";
my $Response = getstore($MirrorURL, $Filename);

# If successfully downloaded, that's it, nothing more to do
if( IndicatesSuccess($Response))
{
print "Finished: file successfully downloaded to $Filename\n";
exit(0);
}

# Warning that we're retrying another random server
print "Download not available, trying another website\n\n";
}

# Warning that no servers could be contacted
print "ERROR: Tried to download the file $MaxRetries times, but no servers could provide the file\n";
exit(2);



# Return codes of 200 to 299 are "success" in HTTP-speak
sub IndicatesSuccess()
{
my $Response = shift();
if($Response =~ /2\d\d/)
{
return(1);
}
else
{
return(0);
}
}

# Returns the name of an internet resource which can provide the clouds image
sub GetRandomMirror()
{
# Populate a list of mirrors #"http://xplanet.sourceforge.net.nyud.net:8080/clouds/tmp/201103251253.422688/clouds_4096.jpg",
my @Mirrors = (
		"http://user.chol.com/~winxplanet/cloud_data/clouds_4096.jpg",
		"ftp://ftp.iastate.edu/pub/xplanet/clouds_4096.jpg");

# Return one at random
return $Mirrors[rand scalar(@Mirrors)];
}
