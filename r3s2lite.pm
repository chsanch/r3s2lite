package r3s2lite;
use Dancer;
use DB::Schema;
use utf8;

#BD Connection
my $schema = DB::Schema->connect('dbi:SQLite:r3s2litedb.rdb');


my $sede = config->{sede};
my $evento = config->{evento};
my $vars =  {sede => $sede , evento => $evento, username => 'anonimo' };

#Sessions
before sub {

        if (! session('user') && request->path_info =~ m{^/admin}) {
            var requested_path => request->path_info;
            request->path_info('/login');
        }
        else {
            $vars->{'username'} = session('user');
        }
};

#Start Session
get '/login' => sub {
        template 'login.tt', { vars => $vars } ;
    };

#Check credentials
post '/login' => sub {
    
        my $usuario = $schema->resultset('Usuario')->search(username => params->{user})->first;
        if ($usuario && $usuario->check_password(params->{pass})) {
            session user => $usuario->username;
            redirect params->{path} || '/admin/';
        }
         else {
            redirect '/login?failed=1';
        }
    };
    
#Finish Session
get '/logout' => sub {
       session->destroy();
       $vars->{'username'} = "anonimo";
       redirect '/login';
    };

#Defaul Route
get '/' => sub {
    redirect '/inscritos/';
};


load "ins_routes.pl";
load "admin.pl";

true;
