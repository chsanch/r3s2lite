use Dancer;

my $schema = DB::Schema->connect('dbi:SQLite:r3s2litedb.rdb');

my $sede = config->{sede};
my $evento = config->{evento};
my $vars =  {sede => $sede , evento => $evento, username => 'anonimo' };


prefix '/inscritos';

#Default route
get '/' => sub {
	template 'inscritos/index.tt', { vars => $vars};
};

post '/buscar' => sub {
	my $email = params->{email};
	my $inscrito = $schema->resultset('Inscrito')->search({email => {'like', $email}})->first;
	if ($inscrito){
		template 'inscritos/resultado.tt', { vars => $vars, inscrito => $inscrito };
	}
	else {
		template 'inscritos/resultado.tt', { vars => $vars, email => $email };
	}
	
};

get '/agregar' => sub {
	my @distros = [$schema->resultset('Distro')->all];
	template 'inscritos/agregar.tt', { vars => $vars, distros => @distros};
};

get '/agregar/:email' => sub {
	template 'inscritos/agregar.tt', { vars => $vars, email => params->{email}};
};

post '/agregar' => sub{
	my $inscrito = $schema->resultset('Inscrito')->create({
		nombres => params->{nombres},
		apellidos => params->{apellidos},
		email => params->{email},
		twitter => params->{twitter},
		url => params->{url},
		fecha_nac => params->{fecha_nac},
		ciudad => params->{ciudad},
		uso_linux_antes => params->{uso_linux_antes},
		ccsef => params->{ccsef},
		tipo_comp => params->{tipo_comp},
		tipo_proc => params->{tipo_proc},
		cant_ram => params->{cant_ram},
		esp_dd => params->{esp_dd},
		distro => params->{distro},
		comentarios => params->{comentarios}
	});

	template 'inscritos/resultado.tt', { vars => $vars, inscrito => $inscrito };
};

post '/actualizar' => sub{
	my $inscrito = $schema->resultset('Inscrito')->find(params->{id});
	$inscrito->asistio('1') if params->{asistio};
	$inscrito->trajopc('1') if params->{trajopc};
	$inscrito->update;
	template 'inscritos/actualizar.tt', { vars => $vars, inscrito => $inscrito };
}