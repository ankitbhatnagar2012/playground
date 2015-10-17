package Queue::Producer;

use Moose;

extends 'Queue';

sub enqueue {
	my ( $self, $params ) = @_;
	return $self->_backend->_enqueue( $params );
}

no Moose;
__PACKAGE__->meta->make_immutable;

1;