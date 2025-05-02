create database bd_gst
go
use bd_gst
go

----Andr�s Felipe Jaramillo & Maryury Hern�ndez Mar�n----
create table empresa(
nit_empresa bigint primary key not null,
nombre nvarchar(500) not null,
razon_social nvarchar(500) not null,
representante_legal nvarchar(500) not null
)
go


create table cliente(
nit_cliente bigint primary key not null,
nombre nvarchar(500) not null,
razon_social nvarchar(500) not null,
representante_legal nvarchar(500) not null,
nit_empresa_fk bigint not null,
foreign key (nit_empresa_fk) references empresa(nit_empresa)
)
go

create table contacto_cliente(
nit_cliente_fk bigint not null,
tel_1 bigint null,
tel_2 bigint null,
correo nvarchar(500) not null,
direccion nvarchar (500) null
primary key (nit_cliente_fk, correo),
foreign key (nit_cliente_fk) references cliente(nit_cliente)
)

create table perfil(    
codigo_perfil int primary key not null,
tipo_perfil nvarchar(500) not null, ----Psic�logo, administrador, empleado (interno de la empresa), cliente
)
go

create table cargo_empleado_cliente(
codigo_cargo nvarchar(500) primary key not null,
descripcion_cargo nvarchar(500) null,
funciones nvarchar(500) null,
area nvarchar(500) null
)
go

create table datos_empleado_cliente(
documento_empleado bigint primary key not null,
tipo_documento nvarchar(500) not null,
nombre_1 nvarchar(500) not null,
nombre_2 nvarchar(500) null,
apellido_1 nvarchar(500) not null,
apellido_2 nvarchar(500) null,
telefono_1 bigint null,
telefono_2 bigint null,
codigo_cargo_fk nvarchar(500) not null,
nit_cliente_fk bigint not null,
foreign key (nit_cliente_fk) references cliente(nit_cliente),
foreign key (codigo_cargo_fk) references cargo_empleado_cliente(codigo_cargo)
)
go

create table usuario(
id_usuario bigint primary key not null,
documento_usuario_fk bigint not null,
codigo_perfil_fk int not null,
correo nvarchar(500) not null,
contrase�a_usuario nvarchar(500) not null,
foreign key (codigo_perfil_fk) references perfil(codigo_perfil),
foreign key (documento_usuario_fk) references datos_empleado_cliente(documento_empleado)
)
go

create table familia_empleado_cliente(
documento_empleado_fk bigint not null,
parentesco nvarchar(500) null,
documento_pariente bigint null,
nombre1 nvarchar(500) null,
nombre2 nvarchar(500) null,
apellido1 nvarchar(500) null,
apellido2 nvarchar(500) null,
foreign key (documento_empleado_fk) references datos_empleado_cliente(documento_empleado)
)
go



create table preguntas(
id_pregunta bigint primary key not null,
como_te_has_sentido_emocionalmente_en_el_trabajo_durante_la_ultima_semana nvarchar(500) not null, --(Opciones: Muy bien / Bien / Neutral / Mal / Muy mal)
te_sientes_motivado_para_realizar_tus_tareas_diarias nvarchar(500) not null, --(Escala de 1 a 5)
Sientes_que_tu_trabajo_es_valorado_por_tus_superiores_o_compa�eros nvarchar(500) not null,
Has_sentido_estres_o_ansiedad_relacionados_con_el_trabajo_recientemente nvarchar(500) not null,
Te_resulta_facil_concentrarte_en_tus_tareas_durante_la_jornada_laboral nvarchar(500) not null,
Te_sientes_agotado_al_final_del_dia_laboral nvarchar(500) not null,
Te_sientes_apoyado_emocionalmente_por_tus_compa�eros_o_lideres nvarchar(500) not null,
Sientes_que_puedes_hablar_abiertamente_sobre_como_te_sientes_en_el_trabajo nvarchar(500) not null,
Te_sientes_satisfecho_con_el_equilibrio_entre_tu_vida_laboral_y_personal nvarchar(500) not null,
Hay_algo_que_actualmente_te_este_afectando_negativamente_en_tu_entorno_laboral nvarchar(500) not null, --(Pregunta abierta)
)
go

create table formularios(
id_formulario bigint primary key not null,
id_pregunta_fk bigint not null,
id_usuario_fk bigint not null,
foreign key (id_usuario_fk) references usuario(id_usuario),
foreign key (id_pregunta_fk) references preguntas(id_pregunta)
)
go

create table sesiones(
id_sesion bigint primary key identity(1,1),
id_usuario_fk bigint not null,
token nvarchar(500) not null, --Puede ser borrado porque es dificil de implemetar.
fecha_inicio datetime not null default getdate(), --Puede ser borrado porque es dificil de implemetar.
fecha_expiracion datetime not null,--Puede ser borrado porque es dificil de implemetar.
foreign key (id_usuario_fk) references usuario(id_usuario)
)
go

select*from cargo_empleado_cliente
select*from cliente
select*from contacto_cliente
select*from datos_empleado_cliente
select*from empresa
select*from familia_empleado_cliente
select*from formularios
select*from perfil
select*from preguntas
--select*from respuestas
select*from sesiones
select*from usuario


INSERT INTO empresa (nit_empresa, nombre, razon_social, representante_legal) VALUES
(900100001, 'TecnoGlobal S.A.S', 'TecnoGlobal Soluciones Integrales', 'Mar�a Fernanda Ruiz'),
(900100002, 'Industrias Nova', 'Nova Fabricaci�n Avanzada', 'Carlos Andr�s G�mez'),
(900100003, 'EcoVerde Ltda', 'EcoVerde Servicios Ambientales', 'Laura Mart�nez'),
(900100004, 'RedComunicaciones', 'RedCom Comunicaciones S.A.', 'Jorge Ram�rez'),
(900100005, 'SoftLogic', 'SoftLogic Software y Tecnolog�a', 'Ana Sof�a Herrera'),
(900100006, 'AgroCampo S.A.', 'AgroCampo Agroindustria Moderna', 'Pedro Torres'),
(900100007, 'InnovaTech', 'InnovaTech Innovaci�n Digital', 'Natalia Duque'),
(900100008, 'BioSalud Ltda', 'BioSalud Servicios M�dicos', 'Luis Fernando P�rez'),
(900100009, 'TransLog S.A.', 'TransLog Log�stica y Transporte', 'Daniela Vargas'),
(900100010, 'Energ�a Viva', 'Energ�a Viva Renovables', 'Camilo Salazar'),
(900100011, 'ConstruGema', 'ConstruGema Constructora', 'M�nica R�os'),
(900100012, 'DelCampo', 'DelCampo Agricultura Inteligente', 'Jos� David Arango'),
(900100013, 'NubeDigital', 'NubeDigital Cloud Services', 'Sandra Milena Torres'),
(900100014, 'Medix Solutions', 'Medix Servicios de Salud', 'Juan Sebasti�n Rivera'),
(900100015, 'Alimentos Terra', 'Terra Comestibles', 'Paola Andrea Mej�a'),
(900100016, 'Finanzas Plus', 'Finanzas Plus Asesor�as', 'Esteban Castro'),
(900100017, 'ViajesJet', 'ViajesJet Turismo Inteligente', 'Juliana Ram�rez'),
(900100018, 'TechStudio', 'TechStudio Desarrollo Web', 'Felipe Guti�rrez'),
(900100019, 'AutoM�vil', 'AutoM�vil Soluciones de Transporte', 'Diana Luc�a Bernal'),
(900100020, 'EducArte', 'EducArte Formaci�n y Cultura', 'Ricardo G�mez');


INSERT INTO cliente (nit_cliente, nombre, razon_social, representante_legal, nit_empresa_fk) VALUES (800100001, 'Cliente 1', 'Razon Cliente 1', 'Representante 1', 900100001);
INSERT INTO cliente (nit_cliente, nombre, razon_social, representante_legal, nit_empresa_fk) VALUES (800100002, 'Cliente 2', 'Razon Cliente 2', 'Representante 2', 900100002);
INSERT INTO cliente (nit_cliente, nombre, razon_social, representante_legal, nit_empresa_fk) VALUES (800100003, 'Cliente 3', 'Razon Cliente 3', 'Representante 3', 900100003);
INSERT INTO cliente (nit_cliente, nombre, razon_social, representante_legal, nit_empresa_fk) VALUES (800100004, 'Cliente 4', 'Razon Cliente 4', 'Representante 4', 900100004);
INSERT INTO cliente (nit_cliente, nombre, razon_social, representante_legal, nit_empresa_fk) VALUES (800100005, 'Cliente 5', 'Razon Cliente 5', 'Representante 5', 900100005);


INSERT INTO contacto_cliente (nit_cliente_fk, tel_1, tel_2, correo, direccion) VALUES (800100001, 3101110001, 3101110002, 'cliente1@empresa.com', 'Calle 1 #10-20');
INSERT INTO contacto_cliente (nit_cliente_fk, tel_1, tel_2, correo, direccion) VALUES (800100002, 3102220001, NULL, 'cliente2@empresa.com', 'Carrera 15 #20-30');
INSERT INTO contacto_cliente (nit_cliente_fk, tel_1, tel_2, correo, direccion) VALUES (800100003, 3103330001, 3103330002, 'cliente3@empresa.com', 'Diagonal 45 #60-70');
INSERT INTO contacto_cliente (nit_cliente_fk, tel_1, tel_2, correo, direccion) VALUES (800100004, 3104440001, NULL, 'cliente4@empresa.com', 'Transversal 7 #5-15');
INSERT INTO contacto_cliente (nit_cliente_fk, tel_1, tel_2, correo, direccion) VALUES (800100005, 3105550001, 3105550002, 'cliente5@empresa.com', 'Av. Siempre Viva #123');


INSERT INTO perfil (codigo_perfil, tipo_perfil) VALUES (1, 'Psic�logo');
INSERT INTO perfil (codigo_perfil, tipo_perfil) VALUES (2, 'Administrador');
INSERT INTO perfil (codigo_perfil, tipo_perfil) VALUES (3, 'Empleado');
INSERT INTO perfil (codigo_perfil, tipo_perfil) VALUES (4, 'Cliente');
INSERT INTO perfil (codigo_perfil, tipo_perfil) VALUES (5, 'Supervisor');
INSERT INTO perfil (codigo_perfil, tipo_perfil) VALUES (6, 'Gerente');
INSERT INTO perfil (codigo_perfil, tipo_perfil) VALUES (7, 'Analista');
INSERT INTO perfil (codigo_perfil, tipo_perfil) VALUES (8, 'Consultor');
INSERT INTO perfil (codigo_perfil, tipo_perfil) VALUES (9, 'Desarrollador');
INSERT INTO perfil (codigo_perfil, tipo_perfil) VALUES (10, 'Tester');
INSERT INTO perfil (codigo_perfil, tipo_perfil) VALUES (11, 'Soporte T�cnico');
INSERT INTO perfil (codigo_perfil, tipo_perfil) VALUES (12, 'Dise�ador');
INSERT INTO perfil (codigo_perfil, tipo_perfil) VALUES (13, 'Contador');
INSERT INTO perfil (codigo_perfil, tipo_perfil) VALUES (14, 'Coordinador');
INSERT INTO perfil (codigo_perfil, tipo_perfil) VALUES (15, 'Reclutador');
INSERT INTO perfil (codigo_perfil, tipo_perfil) VALUES (16, 'Capacitador');
INSERT INTO perfil (codigo_perfil, tipo_perfil) VALUES (17, 'Auxiliar');
INSERT INTO perfil (codigo_perfil, tipo_perfil) VALUES (18, 'L�der de Proyecto');
INSERT INTO perfil (codigo_perfil, tipo_perfil) VALUES (19, 'Encargado de Seguridad');
INSERT INTO perfil (codigo_perfil, tipo_perfil) VALUES (20, 'Asistente Administrativo');



INSERT INTO cargo_empleado_cliente (codigo_cargo, descripcion_cargo, funciones, area) VALUES
('DEV01', 'Desarrollador Junior', 'Apoyar en el desarrollo de software', 'Tecnolog�a');

INSERT INTO cargo_empleado_cliente (codigo_cargo, descripcion_cargo, funciones, area) VALUES
('DEV02', 'Desarrollador Senior', 'Liderar proyectos de desarrollo', 'Tecnolog�a');

INSERT INTO cargo_empleado_cliente (codigo_cargo, descripcion_cargo, funciones, area) VALUES
('QA01', 'Tester QA', 'Realizar pruebas de calidad', 'Tecnolog�a');

INSERT INTO cargo_empleado_cliente (codigo_cargo, descripcion_cargo, funciones, area) VALUES
('PM01', 'L�der de Proyecto', 'Coordinar equipos y cronogramas', 'Gesti�n de proyectos');

INSERT INTO cargo_empleado_cliente (codigo_cargo, descripcion_cargo, funciones, area) VALUES
('UX01', 'Dise�ador UX', 'Dise�ar experiencias de usuario', 'Dise�o');

INSERT INTO cargo_empleado_cliente (codigo_cargo, descripcion_cargo, funciones, area) VALUES
('HR01', 'Analista de Talento Humano', 'Procesos de selecci�n y bienestar', 'Recursos Humanos');

INSERT INTO cargo_empleado_cliente (codigo_cargo, descripcion_cargo, funciones, area) VALUES
('MK01', 'Especialista en Marketing', 'Dise�o de campa�as digitales', 'Mercadeo');

INSERT INTO cargo_empleado_cliente (codigo_cargo, descripcion_cargo, funciones, area) VALUES
('ADM01', 'Administrador de Oficina', 'Gesti�n administrativa general', 'Administraci�n');

INSERT INTO cargo_empleado_cliente (codigo_cargo, descripcion_cargo, funciones, area) VALUES
('SEG01', 'Vigilante', 'Supervisi�n de ingreso y seguridad', 'Seguridad');

INSERT INTO cargo_empleado_cliente (codigo_cargo, descripcion_cargo, funciones, area) VALUES
('CT01', 'Contador General', 'Manejo de estados financieros', 'Contabilidad');

INSERT INTO cargo_empleado_cliente (codigo_cargo, descripcion_cargo, funciones, area) VALUES
('TI01', 'Soporte T�cnico', 'Atenci�n a incidencias t�cnicas', 'Tecnolog�a');

INSERT INTO cargo_empleado_cliente (codigo_cargo, descripcion_cargo, funciones, area) VALUES
('LP01', 'Limpieza', 'Mantenimiento de espacios', 'Servicios Generales');

INSERT INTO cargo_empleado_cliente (codigo_cargo, descripcion_cargo, funciones, area) VALUES
('DV01', 'Mensajero', 'Entrega de documentaci�n', 'Log�stica');

INSERT INTO cargo_empleado_cliente (codigo_cargo, descripcion_cargo, funciones, area) VALUES
('DSN01', 'Dise�ador Gr�fico', 'Creaci�n de piezas visuales', 'Dise�o');

INSERT INTO cargo_empleado_cliente (codigo_cargo, descripcion_cargo, funciones, area) VALUES
('JUR01', 'Abogado Interno', 'Asesor�a legal a la empresa', 'Jur�dico');

INSERT INTO cargo_empleado_cliente (codigo_cargo, descripcion_cargo, funciones, area) VALUES
('RD01', 'Redactor de Contenido', 'Elaboraci�n de textos y art�culos', 'Comunicaci�n');

INSERT INTO cargo_empleado_cliente (codigo_cargo, descripcion_cargo, funciones, area) VALUES
('VNT01', 'Ejecutivo de Ventas', 'Atenci�n a clientes y cierre de negocios', 'Comercial');

INSERT INTO cargo_empleado_cliente (codigo_cargo, descripcion_cargo, funciones, area) VALUES
('BCK01', 'Back Office', 'Gesti�n de operaciones internas', 'Operaciones');

INSERT INTO cargo_empleado_cliente (codigo_cargo, descripcion_cargo, funciones, area) VALUES
('SRV01', 'Servicio al Cliente', 'Atenci�n de solicitudes y reclamos', 'Atenci�n al Cliente');

INSERT INTO cargo_empleado_cliente (codigo_cargo, descripcion_cargo, funciones, area) VALUES
('FNC01', 'Financiero Junior', 'Apoyo en gesti�n presupuestal', 'Finanzas');


INSERT INTO usuario (id_usuario, documento_usuario_fk, codigo_perfil_fk, correo, contrase�a_usuario) VALUES (3001, 2001, 4, N'usuario1@correo.com', N'pass1segura');
INSERT INTO usuario (id_usuario, documento_usuario_fk, codigo_perfil_fk, correo, contrase�a_usuario) VALUES (3002, 2002, 4, N'usuario2@correo.com', N'pass2segura');
INSERT INTO usuario (id_usuario, documento_usuario_fk, codigo_perfil_fk, correo, contrase�a_usuario) VALUES (3003, 2003, 3, N'usuario3@correo.com', N'pass3segura');
INSERT INTO usuario (id_usuario, documento_usuario_fk, codigo_perfil_fk, correo, contrase�a_usuario) VALUES (3004, 2004, 4, N'usuario4@correo.com', N'pass4segura');
INSERT INTO usuario (id_usuario, documento_usuario_fk, codigo_perfil_fk, correo, contrase�a_usuario) VALUES (3005, 2005, 1, N'usuario5@correo.com', N'pass5segura');
INSERT INTO usuario (id_usuario, documento_usuario_fk, codigo_perfil_fk, correo, contrase�a_usuario) VALUES (3006, 2006, 3, N'usuario6@correo.com', N'pass6segura');
INSERT INTO usuario (id_usuario, documento_usuario_fk, codigo_perfil_fk, correo, contrase�a_usuario) VALUES (3007, 2007, 4, N'usuario7@correo.com', N'pass7segura');
INSERT INTO usuario (id_usuario, documento_usuario_fk, codigo_perfil_fk, correo, contrase�a_usuario) VALUES (3008, 2008, 2, N'usuario8@correo.com', N'pass8segura');
INSERT INTO usuario (id_usuario, documento_usuario_fk, codigo_perfil_fk, correo, contrase�a_usuario) VALUES (3009, 2009, 2, N'usuario9@correo.com', N'pass9segura');
INSERT INTO usuario (id_usuario, documento_usuario_fk, codigo_perfil_fk, correo, contrase�a_usuario) VALUES (3010, 2010, 2, N'usuario10@correo.com', N'pass10segura');
INSERT INTO usuario (id_usuario, documento_usuario_fk, codigo_perfil_fk, correo, contrase�a_usuario) VALUES (3011, 2011, 4, N'usuario11@correo.com', N'pass11segura');
INSERT INTO usuario (id_usuario, documento_usuario_fk, codigo_perfil_fk, correo, contrase�a_usuario) VALUES (3012, 2012, 3, N'usuario12@correo.com', N'pass12segura');
INSERT INTO usuario (id_usuario, documento_usuario_fk, codigo_perfil_fk, correo, contrase�a_usuario) VALUES (3013, 2013, 1, N'usuario13@correo.com', N'pass13segura');
INSERT INTO usuario (id_usuario, documento_usuario_fk, codigo_perfil_fk, correo, contrase�a_usuario) VALUES (3014, 2014, 2, N'usuario14@correo.com', N'pass14segura');
INSERT INTO usuario (id_usuario, documento_usuario_fk, codigo_perfil_fk, correo, contrase�a_usuario) VALUES (3015, 2015, 4, N'usuario15@correo.com', N'pass15segura');
INSERT INTO usuario (id_usuario, documento_usuario_fk, codigo_perfil_fk, correo, contrase�a_usuario) VALUES (3016, 2016, 2, N'usuario16@correo.com', N'pass16segura');
INSERT INTO usuario (id_usuario, documento_usuario_fk, codigo_perfil_fk, correo, contrase�a_usuario) VALUES (3017, 2017, 2, N'usuario17@correo.com', N'pass17segura');
INSERT INTO usuario (id_usuario, documento_usuario_fk, codigo_perfil_fk, correo, contrase�a_usuario) VALUES (3018, 2018, 3, N'usuario18@correo.com', N'pass18segura');
INSERT INTO usuario (id_usuario, documento_usuario_fk, codigo_perfil_fk, correo, contrase�a_usuario) VALUES (3019, 2019, 4, N'usuario19@correo.com', N'pass19segura');
INSERT INTO usuario (id_usuario, documento_usuario_fk, codigo_perfil_fk, correo, contrase�a_usuario) VALUES (3020, 2020, 4, N'usuario20@correo.com', N'pass20segura');


INSERT INTO familia_empleado_cliente (documento_empleado_fk, parentesco, documento_pariente, nombre1, nombre2, apellido1, apellido2) VALUES (2001, N'Padre', 74589321, N'Antonio', N'Luis', N'Garc�a', N'Rodr�guez');
INSERT INTO familia_empleado_cliente (documento_empleado_fk, parentesco, documento_pariente, nombre1, nombre2, apellido1, apellido2) VALUES (2002, N'Madre', 80123456, N'Luc�a', N'Mar�a', N'Hern�ndez', N'G�mez');
INSERT INTO familia_empleado_cliente (documento_empleado_fk, parentesco, documento_pariente, nombre1, nombre2, apellido1, apellido2) VALUES (2003, N'Hermano', 78876543, N'Carlos', N'Miguel', N'L�pez', N'S�nchez');
INSERT INTO familia_empleado_cliente (documento_empleado_fk, parentesco, documento_pariente, nombre1, nombre2, apellido1, apellido2) VALUES (2004, N'Hija', 83456789, N'Laura', N'Isabel', N'Mart�nez', N'Ruiz');
INSERT INTO familia_empleado_cliente (documento_empleado_fk, parentesco, documento_pariente, nombre1, nombre2, apellido1, apellido2) VALUES (2005, N'Hermana', 86543211, N'Andrea', N'Mar�a', N'Torres', N'Vargas');
INSERT INTO familia_empleado_cliente (documento_empleado_fk, parentesco, documento_pariente, nombre1, nombre2, apellido1, apellido2) VALUES (2006, N'C�nyuge', 78932145, N'Sof�a', N'Patricia', N'D�az', N'Silva');
INSERT INTO familia_empleado_cliente (documento_empleado_fk, parentesco, documento_pariente, nombre1, nombre2, apellido1, apellido2) VALUES (2007, N'Hijo', 80456733, N'Mateo', N'Santiago', N'Romero', N'Morales');
INSERT INTO familia_empleado_cliente (documento_empleado_fk, parentesco, documento_pariente, nombre1, nombre2, apellido1, apellido2) VALUES (2008, N'T�a', 89431255, N'Elena', N'Mariana', N'M�ndez', N'Cruz');
INSERT INTO familia_empleado_cliente (documento_empleado_fk, parentesco, documento_pariente, nombre1, nombre2, apellido1, apellido2) VALUES (2009, N'Primo', 82345678, N'Ignacio', N'David', N'Reyes', N'Fern�ndez');
INSERT INTO familia_empleado_cliente (documento_empleado_fk, parentesco, documento_pariente, nombre1, nombre2, apellido1, apellido2) VALUES (2010, N'Hija', 88990012, N'Camila', N'Natalia', N'Pe�a', N'Alvarez');
INSERT INTO familia_empleado_cliente (documento_empleado_fk, parentesco, documento_pariente, nombre1, nombre2, apellido1, apellido2) VALUES (2011, N'Hermano', 87456321, N'Fernando', N'Jos�', N'Castro', N'Molina');
INSERT INTO familia_empleado_cliente (documento_empleado_fk, parentesco, documento_pariente, nombre1, nombre2, apellido1, apellido2) VALUES (2012, N'T�o', 84561234, N'Roberto', N'Manuel', N'Soto', N'R�os');
INSERT INTO familia_empleado_cliente (documento_empleado_fk, parentesco, documento_pariente, nombre1, nombre2, apellido1, apellido2) VALUES (2013, N'Padre', 87532109, N'Marco', N'Antonio', N'Guerrero', N'Navarro');
INSERT INTO familia_empleado_cliente (documento_empleado_fk, parentesco, documento_pariente, nombre1, nombre2, apellido1, apellido2) VALUES (2014, N'Madre', 86753091, N'Claudia', N'Andrea', N'Le�n', N'Serrano');
INSERT INTO familia_empleado_cliente (documento_empleado_fk, parentesco, documento_pariente, nombre1, nombre2, apellido1, apellido2) VALUES (2015, N'Hermana', 89432501, N'Paula', N'Cristina', N'Campos', N'Mendoza');
INSERT INTO familia_empleado_cliente (documento_empleado_fk, parentesco, documento_pariente, nombre1, nombre2, apellido1, apellido2) VALUES (2016, N'Esposo', 83214567, N'Alonso', N'Gabriel', N'Paredes', N'Carrillo');
INSERT INTO familia_empleado_cliente (documento_empleado_fk, parentesco, documento_pariente, nombre1, nombre2, apellido1, apellido2) VALUES (2017, N'Hijo', 84125670, N'Esteban', N'Iv�n', N'Aguilar', N'Tapia');
INSERT INTO familia_empleado_cliente (documento_empleado_fk, parentesco, documento_pariente, nombre1, nombre2, apellido1, apellido2) VALUES (2018, N'Hija', 89991234, N'Mariana', N'Luc�a', N'Ortega', N'Figueroa');
INSERT INTO familia_empleado_cliente (documento_empleado_fk, parentesco, documento_pariente, nombre1, nombre2, apellido1, apellido2) VALUES (2019, N'Abuelo', 87874562, N'Julio', N'Alberto', N'Vega', N'Miranda');
INSERT INTO familia_empleado_cliente (documento_empleado_fk, parentesco, documento_pariente, nombre1, nombre2, apellido1, apellido2) VALUES (2020, N'Abuela', 86743129, N'Josefina', N'Carmen', N'N��ez', N'Escobar');


INSERT INTO formularios (id_formulario, id_pregunta, id_usuario_fk) VALUES (1, 1, 3011);
INSERT INTO formularios (id_formulario, id_pregunta, id_usuario_fk) VALUES (2, 2, 3012);
INSERT INTO formularios (id_formulario, id_pregunta, id_usuario_fk) VALUES (3, 3, 3013);
INSERT INTO formularios (id_formulario, id_pregunta, id_usuario_fk) VALUES (4, 4, 3014);
INSERT INTO formularios (id_formulario, id_pregunta, id_usuario_fk) VALUES (5, 5, 3015);
INSERT INTO formularios (id_formulario, id_pregunta, id_usuario_fk) VALUES (6, 6, 3016);
INSERT INTO formularios (id_formulario, id_pregunta, id_usuario_fk) VALUES (7, 7, 3017);
INSERT INTO formularios (id_formulario, id_pregunta, id_usuario_fk) VALUES (8, 8, 3018);
INSERT INTO formularios (id_formulario, id_pregunta, id_usuario_fk) VALUES (9, 9, 3019);
INSERT INTO formularios (id_formulario, id_pregunta, id_usuario_fk) VALUES (10, 10, 3020);
INSERT INTO formularios (id_formulario, id_pregunta, id_usuario_fk) VALUES (11, 11, 3011);
INSERT INTO formularios (id_formulario, id_pregunta, id_usuario_fk) VALUES (12, 12, 3012);
INSERT INTO formularios (id_formulario, id_pregunta, id_usuario_fk) VALUES (13, 13, 3013);
INSERT INTO formularios (id_formulario, id_pregunta, id_usuario_fk) VALUES (14, 14, 3014);
INSERT INTO formularios (id_formulario, id_pregunta, id_usuario_fk) VALUES (15, 15, 3015);
INSERT INTO formularios (id_formulario, id_pregunta, id_usuario_fk) VALUES (16, 16, 3016);
INSERT INTO formularios (id_formulario, id_pregunta, id_usuario_fk) VALUES (17, 17, 3017);
INSERT INTO formularios (id_formulario, id_pregunta, id_usuario_fk) VALUES (18, 18, 3018);
INSERT INTO formularios (id_formulario, id_pregunta, id_usuario_fk) VALUES (19, 19, 3019);
INSERT INTO formularios (id_formulario, id_pregunta, id_usuario_fk) VALUES (20, 20, 3020);


INSERT INTO preguntas (
  id_pregunta,
  como_te_has_sentido_emocionalmente_en_el_trabajo_durante_la_ultima_semana,
  te_sientes_motivado_para_realizar_tus_tareas_diarias,
  Sientes_que_tu_trabajo_es_valorado_por_tus_superiores_o_compa�eros,
  Has_sentido_estres_o_ansiedad_relacionados_con_el_trabajo_recientemente,
  Te_resulta_facil_concentrarte_en_tus_tareas_durante_la_jornada_laboral,
  Te_sientes_agotado_al_final_del_dia_laboral,
  Te_sientes_apoyado_emocionalmente_por_tus_compa�eros_o_lideres,
  Sientes_que_puedes_hablar_abiertamente_sobre_como_te_sientes_en_el_trabajo,
  Te_sientes_satisfecho_con_el_equilibrio_entre_tu_vida_laboral_y_personal,
  Hay_algo_que_actualmente_te_este_afectando_negativamente_en_tu_entorno_laboral
) VALUES
(1, 'Bien', '4', 'S�', 'No', 'S�', 'No', 'S�', 'S�', 'S�', 'No especialmente.'),
(2, 'Muy bien', '5', 'S�', 'No', 'S�', 'No', 'S�', 'S�', 'S�', 'Todo est� bajo control.'),
(3, 'Neutral', '3', 'A veces', 'S�', 'S�', 'S�', 'No', 'No', 'No', 'Sobrecarga de tareas.'),
(4, 'Mal', '2', 'No', 'S�', 'No', 'S�', 'No', 'No', 'No', 'Ambiente de trabajo tenso.'),
(5, 'Muy mal', '1', 'No', 'S�', 'No', 'S�', 'No', 'No', 'No', 'Presi�n constante.'),
(6, 'Bien', '4', 'S�', 'No', 'S�', 'No', 'S�', 'S�', 'S�', 'Sin inconvenientes.'),
(7, 'Bien', '3', 'A veces', 'S�', 'S�', 'S�', 'S�', 'No', 'S�', 'Falta de comunicaci�n.'),
(8, 'Muy bien', '5', 'S�', 'No', 'S�', 'No', 'S�', 'S�', 'S�', 'Todo va bien.'),
(9, 'Neutral', '3', 'No', 'S�', 'No', 'S�', 'No', 'No', 'No', 'Mala relaci�n con jefes.'),
(10, 'Bien', '4', 'S�', 'No', 'S�', 'No', 'S�', 'S�', 'S�', 'Nada relevante.'),
(11, 'Muy bien', '5', 'S�', 'No', 'S�', 'No', 'S�', 'S�', 'S�', 'Todo fluye correctamente.'),
(12, 'Neutral', '3', 'A veces', 'S�', 'S�', 'S�', 'No', 'No', 'No', 'Ruido constante en la oficina.'),
(13, 'Mal', '2', 'No', 'S�', 'No', 'S�', 'No', 'No', 'No', 'Ambiente hostil.'),
(14, 'Muy mal', '1', 'No', 'S�', 'No', 'S�', 'No', 'No', 'No', 'Falta de apoyo.'),
(15, 'Bien', '4', 'S�', 'No', 'S�', 'No', 'S�', 'S�', 'S�', 'Sin problemas por ahora.'),
(16, 'Bien', '4', 'S�', 'No', 'S�', 'No', 'S�', 'S�', 'S�', 'Todo en orden.'),
(17, 'Neutral', '3', 'A veces', 'S�', 'S�', 'S�', 'S�', 'No', 'S�', 'Tareas repetitivas.'),
(18, 'Muy bien', '5', 'S�', 'No', 'S�', 'No', 'S�', 'S�', 'S�', 'Ambiente positivo.'),
(19, 'Neutral', '3', 'No', 'S�', 'No', 'S�', 'No', 'No', 'No', 'Falta de liderazgo.'),
(20, 'Bien', '4', 'S�', 'No', 'S�', 'No', 'S�', 'S�', 'S�', 'Me siento valorado.');


INSERT INTO sesiones (id_usuario_fk, token, fecha_expiracion) VALUES
(1, 'token1', '2025-05-08 12:00:00'),
(2, 'token2', '2025-05-08 12:00:00'),
(3, 'token3', '2025-05-08 12:00:00'),
(4, 'token4', '2025-05-08 12:00:00'),
(5, 'token5', '2025-05-08 12:00:00'),
(6, 'token6', '2025-05-08 12:00:00'),
(7, 'token7', '2025-05-08 12:00:00'),
(8, 'token8', '2025-05-08 12:00:00'),
(9, 'token9', '2025-05-08 12:00:00'),
(10, 'token10', '2025-05-08 12:00:00'),
(11, 'token11', '2025-05-08 12:00:00'),
(12, 'token12', '2025-05-08 12:00:00'),
(13, 'token13', '2025-05-08 12:00:00'),
(14, 'token14', '2025-05-08 12:00:00'),
(15, 'token15', '2025-05-08 12:00:00'),
(16, 'token16', '2025-05-08 12:00:00'),
(17, 'token17', '2025-05-08 12:00:00'),
(18, 'token18', '2025-05-08 12:00:00'),
(19, 'token19', '2025-05-08 12:00:00'),
(20, 'token20', '2025-05-08 12:00:00');
