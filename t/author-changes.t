
BEGIN {
  unless ($ENV{AUTHOR_TESTING}) {
    require Test::More;
    Test::More::plan(skip_all => 'these tests are for testing by the author');
  }
}

use Time::ETA;
use File::Slurp;
use Test::More;

my $content = read_file('Changes');

my $v = $Time::ETA::VERSION;
ok(defined $v, "Version is defined");
like($content, qr/^$v/ms, "Changes has info about version '$v'");

done_testing();
