package Queue::Role;

use strict;
use warnings;

use Moose::Role;

use Class::Load 'load_class';

use Queue::Backend;

use constant {
	_NAMESPACE_ => "Queue::Backend::"
};

has name => (
	isa => 'Str',
	required => 1,
	is => 'rw'
);

has tuning_options => (
	isa => 'HashRef',
	is => 'rw'
);

has _backend => (
	isa => 'Object',
	is => 'ro',
	lazy_build => 1,
);

sub _build__backend {
	my ( $self ) = @_;
	
	my $config = _get_config( $self->name )
		or die "Could not get configuration for the designated queue_name";

	$self->tuning_options( $config->{ tuning_options } );

	my $class = _NAMESPACE_ . $config->{ queue_type };

	grep { $_ eq $class } @{ Queue::Backend::get_registry() }
		or die "Queue backend not supported";

	load_class( $class ) 
		or die "Could not load requested backend";
	
	return $class->new( $config->{ backend_options } );
}

sub _get_config {
	my ( $queue_name ) = @_;

	#
	# sample configuration, should ideally come from a persistent store
	#
	my %config = (
		'copy_me' => {
			name 				=> 'copy_me',
			queue_type 			=> 'InMemory',
			tuning_options 		=> {},
			backend_options 	=> {},
		},
	);

	return $config{ $queue_name }; 
}

1;