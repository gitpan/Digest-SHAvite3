use strict;
use warnings;
use Test::More tests => 15;
use Digest::SHAvite3;

new_ok('Digest::SHAvite3' => [$_], "algorithm $_") for qw(224 256 384 512);

is(eval { Digest::SHAvite3->new },     undef, 'no algorithm specified');
is(eval { Digest::SHAvite3->new(10) }, undef, 'invalid algorithm specified');

can_ok('Digest::SHAvite3',
    qw(clone reset algorithm hashsize add digest hexdigest b64digest)
);

for my $alg (qw(224 256 384 512)) {
    my $d1 = Digest::SHAvite3->new($alg);
    $d1->add('foo bar')->reset;
    is($d1->hexdigest, Digest::SHAvite3->new($alg)->hexdigest, 'reset');

    $d1->add('foobar');
    my $d2 = $d1->clone;
    is($d1->hexdigest, $d2->hexdigest, "clone of $alg");
}
