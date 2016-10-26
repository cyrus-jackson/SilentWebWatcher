#/user/bin/perl

my $url = 'http://linux.pacific.net.au/primary.xml.gz';

#my ($scheme_host) = $url =~ m|^( .*?\. [^/]+ )|x;
my ($k) = $url =~ m!([^:http?s://][^:/]+)!;

print $k,"\n";