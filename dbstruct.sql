CREATE TABLE distro
(
  id integer PRIMARY KEY,
  nombre text
);

CREATE TABLE inscrito 
(
	id integer  PRIMARY KEY AUTOINCREMENT DEFAULT NULL,
	nombres TEXT,
	apellidos TEXT,
	email TEXT,
	twitter TEXT,
	url TEXT,
	fecha_nac Date,
	ciudad TEXT,
	uso_linux_antes Varchar(1)  DEFAULT 0,
	ccsef TEXT,tipo_comp TEXT,
	tipo_proc TEXT,
	cant_ram TEXT,
	esp_dd TEXT,
	distro TEXT,
	comentarios TEXT,
	fecha_ins Date,
	asistio Varchar(1)  DEFAULT 0,
	trajopc Varchar(1)  DEFAULT 0,
	fecha_mod Date DEFAULT CURRENT_DATE
);

CREATE TABLE usuario 
(
	id INTEGER  PRIMARY KEY AUTOINCREMENT DEFAULT NULL,
	username text NOT NULL,
	password text NOT NULL,
	nombre text,
	apellido text,
	activo integer DEFAULT 1,
	email text,
	twitter text,
	website TEXT
);

INSERT INTO distro (id, nombre) VALUES (1, '"Debian"');
INSERT INTO distro (id, nombre) VALUES (2, '"Ubuntu"');
INSERT INTO distro (id, nombre) VALUES (3, '"Fedora"');
INSERT INTO distro (id, nombre) VALUES (4, '"Canaima"');
INSERT INTO distro (id, nombre) VALUES (5, '"Slackware"');

INSERT INTO inscrito (id, nombres, apellidos, email, twitter, url, fecha_nac, ciudad, uso_linux_antes, ccsef, tipo_comp, tipo_proc, cant_ram, esp_dd, distro, comentarios, fecha_ins, asistio, trajopc, fecha_mod) VALUES (67, 'Juan', 'Perez', 'juanperez@hotmail.com', '@', 'http://', '1983-01-18', 'Ciudad X', '1', 'Web', 'NetBook', 'No lo se', '1GB', '100GB', '1', '', '2010-03-09', '0', '0', '2010-04-19');
INSERT INTO inscrito (id, nombres, apellidos, email, twitter, url, fecha_nac, ciudad, uso_linux_antes, ccsef, tipo_comp, tipo_proc, cant_ram, esp_dd, distro, comentarios, fecha_ins, asistio, trajopc, fecha_mod) VALUES (68, 'Jose Miguel', 'Perez', 'jperez@gmail.com', '@twitter', 'http://pagina.com', '1991-02-15', 'Ciudad X', '1', 'Amigo', 'Portatil', 'Pentium IV', '1 gb', '30', '2', '', '2010-03-10', '0', '0', '2010-04-19');
INSERT INTO inscrito (id, nombres, apellidos, email, twitter, url, fecha_nac, ciudad, uso_linux_antes, ccsef, tipo_comp, tipo_proc, cant_ram, esp_dd, distro, comentarios, fecha_ins, asistio, trajopc, fecha_mod) VALUES (69, 'Cesar', 'Perez', 'cperez@yahoo.com', '@twitter', 'http://pagina.com', '1981-09-30', 'Ciudad X', '1', 'Otro', 'Portatil', 'No lo se', '1GB', '20', '3', '', '2010-03-10', '0', '0', '2010-04-19');

INSERT INTO usuario (id, username, password, nombre, apellido, activo, email, twitter, website) VALUES (1, 'usuario', '90cbcc62c3251e18bc672241b012abe3caf5c40fje4Ae4bQrS', 'Usuario', 'Prueba', 1, 'prueba@prueba.com', '@twitter', 'www.pagina.com');



