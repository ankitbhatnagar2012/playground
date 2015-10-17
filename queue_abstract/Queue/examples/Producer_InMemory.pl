use strict;
use warnings;

use Data::Dumper;

use Queue::Consumer;

sub blah {
	my $producer = Queue::Producer->new( name => 'copy_me' );
	
	$producer->enqueue(
		{ foo => 'bar' },
		{ baz => 'blah' },
	);
}

blah();

1;
