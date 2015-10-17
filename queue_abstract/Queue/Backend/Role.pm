package Queue::Backend::Role;

use Moose::Role;

requires ('_enqueue','_dequeue','_cleanup');

around '_enqueue' => sub {
	my ( $orig, $self, $params ) = @_;
	$self->$orig( $params );
};

around '_dequeue' => sub {
	my ( $orig, $self, $params ) = @_;
	$self->$orig( $params );
};

around '_cleanup' => sub {
	my ( $orig, $self, $params ) = @_;
	$self->$orig( $params );
};

1;