package Queue::Backend::InMemory;

use Moose;
use Queue::Backend;

with qw(
	Queue::Backend::Role
);

has unprocessed => (
	isa => 'ArrayRef',
	is => 'rw',
	default => sub { [] },
);
has working => (
	isa => 'ArrayRef',
	is => 'rw',
	default => sub { [] },
);
has processed => (
	isa => 'ArrayRef',
	is => 'rw',
	default => sub { [] },
);
has failed => (
	isa => 'ArrayRef',
	is => 'rw',
	default => sub { [] },
);

has items => (
	isa => 'HashRef',
	is => 'rw',
	default => sub { {} },
);

has counter => (
	isa => 'Int',
	is => 'rw',
	default => sub { 0 },
);
	
sub _enqueue {
	my ( $self, $params ) = @_;
	return;
}

sub _dequeue {
	my ( $self, $params ) = @_;
	return;
}

sub _cleanup {
	my ( $self, $params ) = @_;
	return;
}

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