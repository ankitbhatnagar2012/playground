package Queue::Consumer;

use Moose;

extends 'Queue';

sub dequeue {
	my ( $self, $params ) = @_;
	return $self->_backend->_dequeue( $params );
}

no Moose;
__PACKAGE__->meta->make_immutable;

1;