package Queue;

use Moose;
use DEBUG;

with qw(
	Queue::Role
);

no Moose;
__PACKAGE__->meta->make_immutable;

1;