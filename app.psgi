# PSGI application bootstraper for Dancer
use lib '/Users/csanchez/Dropbox/Trabajo/r3s2lite';
use r3s2lite;

use Dancer::Config 'setting';
setting apphandler  => 'PSGI';
Dancer::Config->load;

my $handler = sub {
    my $env = shift;
    my $request = Dancer::Request->new($env);
    Dancer->dance($request);
};
