#/usr/bin/env perl

my $p=`find . -name "*.md"`;
my @pp=split("\n",$p);

foreach my $f (@pp)
{
	my $c=`cat $f`;
	if ($c !~ /\nlayout\:[ ]+post/)
	{
		if ($c =~ /\n---\n/)
		{
			$c=~ s/\n---\n/\nlayout: post\n---\n/;
			open(my $fp,">",$f);
			print $fp $c;
			close($fp);
			print "file $f has been processed.\n";
		}
	}
	if ($c !~ /\nauthor\:/)
        {
                if ($c =~ /\n---\n/)
                {
                        $c=~ s/\n---\n/\nauthor: \"Keith\"\n---\n/;
                        open(my $fp,">",$f);
                        print $fp $c;
                        close($fp);
                        print "file $f has been processed.\n";
                }
        }
}
