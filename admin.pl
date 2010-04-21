use Dancer;

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

prefix '/admin';

#Default route
get '/' => sub {
	redirect  '/admin/inscritos/todos'
};

#All records
get '/inscritos/todos' => sub {
    my @inscritos = [$schema->resultset('Inscrito')->all];
    template 'inscritos/todos.tt', { vars => $vars, inscritos => @inscritos};
};

#confirmando asistencia
get '/inscritos/asistentes' => sub {
    my @inscritos = [$schema->resultset('Inscrito')->search({asistio => '1'})];
    template 'inscritos/asistentes.tt', { vars => $vars, inscritos => @inscritos};
};

get '/inscritos/ver/:id' => sub {
    my $inscrito = $schema->resultset('Inscrito')->find(params->{id});
    if ($inscrito){
	    template 'inscritos/resultado.tt', { vars => $vars, inscrito => $inscrito };
    }
    else {
	    template 'inscritos/resultado.tt', { vars => $vars, email => params->{id} };
    }
}
