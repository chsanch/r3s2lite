#!/usr/bin/perl
use Plack::Handler::FCGI;

my $app = do('/Users/csanchez/Dropbox/Trabajo/r3s2lite/app.psgi');
my $server = Plack::Handler::FCGI->new(nproc  => 5, detach => 1);
$server->run($app);
