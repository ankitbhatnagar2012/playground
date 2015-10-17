# queue_abstract

Backend-agnostic, API-like abstraction library that can consume multiple Messaging / Task
queues, depending upon configuration/s resolved at runtime. This allows users of such a 
system to bother less about backend-specific details and focus more on application related 
ones.

## Installation

Just put the files where your @INC could read them. ;) 

## Usage

```perl
use strict;
use warnings;

use Queue::Consumer;

sub blah {

	my $producer = Queue::Producer->new( name => 'my_test_queue' );
	
	$producer->enqueue(
		{ foo => 'bar' },
		{ baz => 'blah' },
	);

	my $consumer = Queue::Consumer->new( name => 'my_test_queue' );

	my @items = $consumer->dequeue({
		count => 2,
	});

}

1;
```

## Run tests

prove Queue/t

## TODOs

- ~~Add basic stubs.~~
- Add more backends, e.g. [1] Redis, [2] MySQL, [3] RabbitMQ.
- Add necessary support for each added backend ( make return values more generic? ).
- Add library-specific, backend-specific logging
- More tests, oh yeah!