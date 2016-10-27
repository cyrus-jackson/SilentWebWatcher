my $filename = "websites.txt";
open(my $fh, '<:encoding(UTF-8)', $filename)
	or die "Could Not open";
my %websitesNotAllowed;
while(my $row = <$fh>){
	chomp $row;
	my ($k) = $row =~ m!([^:http?s://][^:/]+)!;
	$websitesNotAllowed{$k} = 1;	
}
close($filename);
#print %websitesNotAllowed;
print "####### Websites File Successfully Mapped ########\n\n###################Website Frequency########################\n\n";
my $filename = "dnslist.txt";
#print $fh;
open(my $fh, '<:encoding(UTF-8)', $filename) 
	or die "Could Not Open dnslist";
my %history;
my %blockedUsers;
while(my $row = <$fh>){
	chomp $row;
	my ($k) = $row =~ m!([^:http?s://][^:/]+)!;
	my ($y) = $row =~ m|(\s[0-9a-zA-Z]+)$|;
	if($websitesNotAllowed{$k} == 1){
		$blockedUsers{$y} = $k;
	}
	$history{$k}++;
}
@a = %history;
$co = 1;
print "Website\t\t\t\t\t\tFrequency\n############################################################\n\n";
for(0..@a){
	if($co%2 == 1){
		print $a[$_];
	}
	else
	{
		print "                                    ",$a[$_],"\n";
	}
	$co++;
}
print "\n\n\n###Users Visiting Blocked Websites###\n";
foreach my $id (keys %blockedUsers){
	print $id, "\t", $blockedUsers{$id},"\n";
}
#print %history;
