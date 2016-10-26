my $filename = "websites.txt";
open(my $fh, '<:encoding(UTF-8)', $filename)
	or die "Could Not open";
my %websitesAllowed;
while(my $row = <$fh>){
	chomp $row;
	my ($k) = $row =~ m!([^:http?s://][^:/]+)!;
	$websitesAllowed{$k} = 1;	
}
close($filename);
# print %websitesAllowed;
print "####### Websites File Successfully Mapped ########\n";
my $filename = "dnslist.txt";
#print $fh;
open(my $fh, '<:encoding(UTF-8)', $filename) 
	or die "Could Not Open dnslist";
my %history;
while(my $row = <$fh>){
	chomp $row;
	my ($k) = $row =~ m!([^:http?s://][^:/]+)!;
	$history{$k}++;
}
print %history;
