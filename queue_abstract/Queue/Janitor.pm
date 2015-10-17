package Queue::Janitor;

use Moose;

extends 'Queue';

sub cleanup {
	my ( $self, $params ) = @_;
	return $self->_backend->_cleanup( $params );
}

no Moose;
__PACKAGE__->meta->make_immutable;

1;