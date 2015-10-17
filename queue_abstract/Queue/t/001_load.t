use strict;
use warnings;

use Test::More;

require_ok('Queue');
require_ok('Queue::Backend');

foreach ( @{ Queue::Backend::get_registry() } ) {
	require_ok( $_ );
}

done_testing();