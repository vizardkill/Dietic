insert into SEXOS values(1,'Masculino');
insert into SEXOS values(2,'Femenino');

insert into ESTADOS_USUARIOS values(1,'ACTIVO','');
insert into ESTADOS_USUARIOS values(2,'INACTIVO','');

insert into PERFILES values(1,'Admin','Administrador del sistema');
insert into PERFILES values(2,'Usuario','Usuario del sistema');

insert into USUARIOS (identificacion, username, pwd, perfil) values('admin@localhost','admin','21232f297a57a5a743894a0e4a801fc3',1);

commit;