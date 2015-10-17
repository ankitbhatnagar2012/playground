use strict;
use warnings;

use Data::Dumper;

use Queue::Consumer;

sub blah {
	my $consumer = Queue::Consumer->new( name => 'copy_me' );

	my @items = $consumer->dequeue({
		count => 2,
	});
}

blah();

1;
