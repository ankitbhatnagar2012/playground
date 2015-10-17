package Queue::Backend;

use strict;
use warnings;

our @registry = qw(
	Queue::Backend::InMemory	
);

sub get_registry {
	return \@registry;
}

1;