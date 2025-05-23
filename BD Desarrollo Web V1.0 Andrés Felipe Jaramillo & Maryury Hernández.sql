create database bd_gst2
go
use bd_gst2
go

----Andrés Felipe Jaramillo & Maryury Hernández Marín----
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
tipo_perfil nvarchar(500) not null, ----Psicólogo, administrador, empleado (interno de la empresa), cliente
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


--------------------------------MALA---------------------
create table usuario(
id_usuario bigint primary key not null,
documento_usuario_fk bigint not null,
codigo_perfil_fk int not null,
correo nvarchar(500) not null,
contraseña_usuario nvarchar(500) not null,
foreign key (codigo_perfil_fk) references perfil(codigo_perfil),
foreign key (documento_usuario_fk) references datos_empleado_cliente(documento_empleado)
)
go
--------------------------------------------------------------
DROP TABLE usuario;

CREATE TABLE usuario_temp(
id_usuario BIGINT IDENTITY(1,1) PRIMARY KEY,
documento_usuario_fk bigint not null,
codigo_perfil_fk int not null,
correo nvarchar(500) not null,
contraseña_usuario nvarchar(500) not null,
foreign key (codigo_perfil_fk) references perfil(codigo_perfil),
foreign key (documento_usuario_fk) references datos_empleado_cliente(documento_empleado)
)


EXEC sp_rename 'usuario', 'eliminar';


EXEC sp_rename 'usuario_temp', 'usuario';

begin tran

rollback

commit

--No funciono
alter table usuario drop column documento_usuario_fk

--No funciono
ALTER TABLE usuario
DROP CONSTRAINT FK__usuario_t__docum__66603565



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
id_pregunta bigint identity(1,1) primary key not null,
Sientes_que_las_demandas_de_tu_trabajo_son_excesivas_o_difíciles_de_manejar nvarchar(500) not null, --(Opciones: Muy bien / Bien / Neutral / Mal / Muy mal)
Te_resulta_difícil_desconectar_del_trabajo_fuera_del_horario_laboral nvarchar(500) not null, --(Escala de 1 a 5)
Experimentas_fatiga_o_agotamiento_incluso_después_de_descansar nvarchar(500) not null,
Sientes_que_no_tienes_suficiente_control_sobre_tus_tareas_o_decisiones_laborales nvarchar(500) not null,
Te_resulta_difícil_cumplir_con_los_plazos_y_objetivos_de_trabajo nvarchar(500) not null,
Sientes_que_tu_carga_de_trabajo_ha_aumentado_significativamente_en_los_últimos_meses nvarchar(500) not null,
Te_sientes_apoyado_emocionalmente_por_tus_compañeros_o_lideres nvarchar(500) not null,
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
(900100001, 'TecnoGlobal S.A.S', 'TecnoGlobal Soluciones Integrales', 'María Fernanda Ruiz'),
(900100002, 'Industrias Nova', 'Nova Fabricación Avanzada', 'Carlos Andrés Gómez'),
(900100003, 'EcoVerde Ltda', 'EcoVerde Servicios Ambientales', 'Laura Martínez'),
(900100004, 'RedComunicaciones', 'RedCom Comunicaciones S.A.', 'Jorge Ramírez'),
(900100005, 'SoftLogic', 'SoftLogic Software y Tecnología', 'Ana Sofía Herrera'),
(900100006, 'AgroCampo S.A.', 'AgroCampo Agroindustria Moderna', 'Pedro Torres'),
(900100007, 'InnovaTech', 'InnovaTech Innovación Digital', 'Natalia Duque'),
(900100008, 'BioSalud Ltda', 'BioSalud Servicios Médicos', 'Luis Fernando Pérez'),
(900100009, 'TransLog S.A.', 'TransLog Logística y Transporte', 'Daniela Vargas'),
(900100010, 'Energía Viva', 'Energía Viva Renovables', 'Camilo Salazar'),
(900100011, 'ConstruGema', 'ConstruGema Constructora', 'Mónica Ríos'),
(900100012, 'DelCampo', 'DelCampo Agricultura Inteligente', 'José David Arango'),
(900100013, 'NubeDigital', 'NubeDigital Cloud Services', 'Sandra Milena Torres'),
(900100014, 'Medix Solutions', 'Medix Servicios de Salud', 'Juan Sebastián Rivera'),
(900100015, 'Alimentos Terra', 'Terra Comestibles', 'Paola Andrea Mejía'),
(900100016, 'Finanzas Plus', 'Finanzas Plus Asesorías', 'Esteban Castro'),
(900100017, 'ViajesJet', 'ViajesJet Turismo Inteligente', 'Juliana Ramírez'),
(900100018, 'TechStudio', 'TechStudio Desarrollo Web', 'Felipe Gutiérrez'),
(900100019, 'AutoMóvil', 'AutoMóvil Soluciones de Transporte', 'Diana Lucía Bernal'),
(900100020, 'EducArte', 'EducArte Formación y Cultura', 'Ricardo Gómez');


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


INSERT INTO perfil (codigo_perfil, tipo_perfil) VALUES (1, 'Psicólogo');
INSERT INTO perfil (codigo_perfil, tipo_perfil) VALUES (2, 'Administrador');
INSERT INTO perfil (codigo_perfil, tipo_perfil) VALUES (3, 'Empleado');
INSERT INTO perfil (codigo_perfil, tipo_perfil) VALUES (4, 'Cliente');
INSERT INTO perfil (codigo_perfil, tipo_perfil) VALUES (5, 'Supervisor');
INSERT INTO perfil (codigo_perfil, tipo_perfil) VALUES (6, 'Gerente');
INSERT INTO perfil (codigo_perfil, tipo_perfil) VALUES (7, 'Analista');
INSERT INTO perfil (codigo_perfil, tipo_perfil) VALUES (8, 'Consultor');
INSERT INTO perfil (codigo_perfil, tipo_perfil) VALUES (9, 'Desarrollador');
INSERT INTO perfil (codigo_perfil, tipo_perfil) VALUES (10, 'Tester');
INSERT INTO perfil (codigo_perfil, tipo_perfil) VALUES (11, 'Soporte Técnico');
INSERT INTO perfil (codigo_perfil, tipo_perfil) VALUES (12, 'Diseñador');
INSERT INTO perfil (codigo_perfil, tipo_perfil) VALUES (13, 'Contador');
INSERT INTO perfil (codigo_perfil, tipo_perfil) VALUES (14, 'Coordinador');
INSERT INTO perfil (codigo_perfil, tipo_perfil) VALUES (15, 'Reclutador');
INSERT INTO perfil (codigo_perfil, tipo_perfil) VALUES (16, 'Capacitador');
INSERT INTO perfil (codigo_perfil, tipo_perfil) VALUES (17, 'Auxiliar');
INSERT INTO perfil (codigo_perfil, tipo_perfil) VALUES (18, 'Líder de Proyecto');
INSERT INTO perfil (codigo_perfil, tipo_perfil) VALUES (19, 'Encargado de Seguridad');
INSERT INTO perfil (codigo_perfil, tipo_perfil) VALUES (20, 'Asistente Administrativo');



INSERT INTO cargo_empleado_cliente (codigo_cargo, descripcion_cargo, funciones, area) VALUES
('DEV01', 'Desarrollador Junior', 'Apoyar en el desarrollo de software', 'Tecnología');

INSERT INTO cargo_empleado_cliente (codigo_cargo, descripcion_cargo, funciones, area) VALUES
('DEV02', 'Desarrollador Senior', 'Liderar proyectos de desarrollo', 'Tecnología');

INSERT INTO cargo_empleado_cliente (codigo_cargo, descripcion_cargo, funciones, area) VALUES
('QA01', 'Tester QA', 'Realizar pruebas de calidad', 'Tecnología');

INSERT INTO cargo_empleado_cliente (codigo_cargo, descripcion_cargo, funciones, area) VALUES
('PM01', 'Líder de Proyecto', 'Coordinar equipos y cronogramas', 'Gestión de proyectos');

INSERT INTO cargo_empleado_cliente (codigo_cargo, descripcion_cargo, funciones, area) VALUES
('UX01', 'Diseñador UX', 'Diseñar experiencias de usuario', 'Diseño');

INSERT INTO cargo_empleado_cliente (codigo_cargo, descripcion_cargo, funciones, area) VALUES
('HR01', 'Analista de Talento Humano', 'Procesos de selección y bienestar', 'Recursos Humanos');

INSERT INTO cargo_empleado_cliente (codigo_cargo, descripcion_cargo, funciones, area) VALUES
('MK01', 'Especialista en Marketing', 'Diseño de campañas digitales', 'Mercadeo');

INSERT INTO cargo_empleado_cliente (codigo_cargo, descripcion_cargo, funciones, area) VALUES
('ADM01', 'Administrador de Oficina', 'Gestión administrativa general', 'Administración');

INSERT INTO cargo_empleado_cliente (codigo_cargo, descripcion_cargo, funciones, area) VALUES
('SEG01', 'Vigilante', 'Supervisión de ingreso y seguridad', 'Seguridad');

INSERT INTO cargo_empleado_cliente (codigo_cargo, descripcion_cargo, funciones, area) VALUES
('CT01', 'Contador General', 'Manejo de estados financieros', 'Contabilidad');

INSERT INTO cargo_empleado_cliente (codigo_cargo, descripcion_cargo, funciones, area) VALUES
('TI01', 'Soporte Técnico', 'Atención a incidencias técnicas', 'Tecnología');

INSERT INTO cargo_empleado_cliente (codigo_cargo, descripcion_cargo, funciones, area) VALUES
('LP01', 'Limpieza', 'Mantenimiento de espacios', 'Servicios Generales');

INSERT INTO cargo_empleado_cliente (codigo_cargo, descripcion_cargo, funciones, area) VALUES
('DV01', 'Mensajero', 'Entrega de documentación', 'Logística');

INSERT INTO cargo_empleado_cliente (codigo_cargo, descripcion_cargo, funciones, area) VALUES
('DSN01', 'Diseñador Gráfico', 'Creación de piezas visuales', 'Diseño');

INSERT INTO cargo_empleado_cliente (codigo_cargo, descripcion_cargo, funciones, area) VALUES
('JUR01', 'Abogado Interno', 'Asesoría legal a la empresa', 'Jurídico');

INSERT INTO cargo_empleado_cliente (codigo_cargo, descripcion_cargo, funciones, area) VALUES
('RD01', 'Redactor de Contenido', 'Elaboración de textos y artículos', 'Comunicación');

INSERT INTO cargo_empleado_cliente (codigo_cargo, descripcion_cargo, funciones, area) VALUES
('VNT01', 'Ejecutivo de Ventas', 'Atención a clientes y cierre de negocios', 'Comercial');

INSERT INTO cargo_empleado_cliente (codigo_cargo, descripcion_cargo, funciones, area) VALUES
('BCK01', 'Back Office', 'Gestión de operaciones internas', 'Operaciones');

INSERT INTO cargo_empleado_cliente (codigo_cargo, descripcion_cargo, funciones, area) VALUES
('SRV01', 'Servicio al Cliente', 'Atención de solicitudes y reclamos', 'Atención al Cliente');

INSERT INTO cargo_empleado_cliente (codigo_cargo, descripcion_cargo, funciones, area) VALUES
('FNC01', 'Financiero Junior', 'Apoyo en gestión presupuestal', 'Finanzas');


-- Inserciones para datos_empleado_cliente
INSERT INTO datos_empleado_cliente (
    documento_empleado, tipo_documento, nombre_1, nombre_2, apellido_1, apellido_2, 
    telefono_1, telefono_2, codigo_cargo_fk, nit_cliente_fk
) VALUES
(2001, 'CC', 'Laura', 'Marcela', 'Gómez', 'Pérez', 3111234567, NULL, 'DEV01', 800100001),
(2002, 'TI', 'Carlos', NULL, 'Ramírez', 'López', 3209876543, 3105554444, 'QA01', 800100001),
(2003, 'CC', 'Andrea', 'Paola', 'Martínez', NULL, 3137894561, NULL, 'PM01', 800100002),
(2004, 'CE', 'Juan', NULL, 'Torres', 'Ríos', 3102345678, 3188765432, 'UX01', 800100002),
(2005, 'CC', 'Sofía', 'Alejandra', 'Hernández', 'Mejía', 3011122334, NULL, 'HR01', 800100003),
(2006, 'TI', 'David', 'Esteban', 'Moreno', NULL, 3157788991, 3109998888, 'MK01', 800100003),
(2007, 'CC', 'Camila', NULL, 'García', 'Zapata', 3004433221, NULL, 'ADM01', 800100004),
(2008, 'CE', 'Luis', 'Felipe', 'Vargas', 'Montoya', 3115566778, NULL, 'SEG01', 800100004),
(2009, 'TI', 'Daniela', NULL, 'Castro', 'Giraldo', 3102233445, 3019988776, 'CT01', 800100005),
(2010, 'CC', 'Julián', 'Andrés', 'Sánchez', NULL, 3124567890, NULL, 'TI01', 800100005),
(2011, 'CC', 'Valentina', 'Isabel', 'Rojas', 'Cardona', 3114433221, NULL, 'LP01', 800100001),
(2012, 'TI', 'Sebastián', NULL, 'Cano', 'Rincón', 3126655443, 3145566778, 'DV01', 800100001),
(2013, 'CE', 'Paula', 'Lucía', 'Quintero', NULL, 3002211344, NULL, 'DSN01', 800100002),
(2014, 'CC', 'Mateo', NULL, 'López', 'Gutiérrez', 3109988776, NULL, 'JUR01', 800100002),
(2015, 'TI', 'Isabela', 'Fernanda', 'Pineda', NULL, 3014433221, NULL, 'RD01', 800100003),
(2016, 'CC', 'Tomás', 'Emilio', 'Restrepo', 'Zuluaga', 3123344556, 3134455667, 'VNT01', 800100003),
(2017, 'CE', 'Manuela', NULL, 'Ortiz', 'Delgado', 3146677889, NULL, 'BCK01', 800100004),
(2018, 'CC', 'Samuel', 'Alejandro', 'Mendoza', NULL, 3158899776, 3102211344, 'SRV01', 800100004),
(2019, 'TI', 'Sara', NULL, 'Navarro', 'Ramírez', 3160011223, NULL, 'FNC01', 800100005),
(2020, 'CE', 'Jorge', 'Iván', 'Cárdenas', NULL, 3171122334, NULL, 'DEV02', 800100005);


INSERT INTO usuario (id_usuario, documento_usuario_fk, codigo_perfil_fk, correo, contraseña_usuario) VALUES (3001, 2001, 4, N'usuario1@correo.com', N'pass1segura');
INSERT INTO usuario (id_usuario, documento_usuario_fk, codigo_perfil_fk, correo, contraseña_usuario) VALUES (3002, 2002, 4, N'usuario2@correo.com', N'pass2segura');
INSERT INTO usuario (id_usuario, documento_usuario_fk, codigo_perfil_fk, correo, contraseña_usuario) VALUES (3003, 2003, 3, N'usuario3@correo.com', N'pass3segura');
INSERT INTO usuario (id_usuario, documento_usuario_fk, codigo_perfil_fk, correo, contraseña_usuario) VALUES (3004, 2004, 4, N'usuario4@correo.com', N'pass4segura');
INSERT INTO usuario (id_usuario, documento_usuario_fk, codigo_perfil_fk, correo, contraseña_usuario) VALUES (3005, 2005, 1, N'usuario5@correo.com', N'pass5segura');
INSERT INTO usuario (id_usuario, documento_usuario_fk, codigo_perfil_fk, correo, contraseña_usuario) VALUES (3006, 2006, 3, N'usuario6@correo.com', N'pass6segura');
INSERT INTO usuario (id_usuario, documento_usuario_fk, codigo_perfil_fk, correo, contraseña_usuario) VALUES (3007, 2007, 4, N'usuario7@correo.com', N'pass7segura');
INSERT INTO usuario (id_usuario, documento_usuario_fk, codigo_perfil_fk, correo, contraseña_usuario) VALUES (3008, 2008, 2, N'usuario8@correo.com', N'pass8segura');
INSERT INTO usuario (id_usuario, documento_usuario_fk, codigo_perfil_fk, correo, contraseña_usuario) VALUES (3009, 2009, 2, N'usuario9@correo.com', N'pass9segura');
INSERT INTO usuario (id_usuario, documento_usuario_fk, codigo_perfil_fk, correo, contraseña_usuario) VALUES (3010, 2010, 2, N'usuario10@correo.com', N'pass10segura');
INSERT INTO usuario (id_usuario, documento_usuario_fk, codigo_perfil_fk, correo, contraseña_usuario) VALUES (3011, 2011, 4, N'usuario11@correo.com', N'pass11segura');
INSERT INTO usuario (id_usuario, documento_usuario_fk, codigo_perfil_fk, correo, contraseña_usuario) VALUES (3012, 2012, 3, N'usuario12@correo.com', N'pass12segura');
INSERT INTO usuario (id_usuario, documento_usuario_fk, codigo_perfil_fk, correo, contraseña_usuario) VALUES (3013, 2013, 1, N'usuario13@correo.com', N'pass13segura');
INSERT INTO usuario (id_usuario, documento_usuario_fk, codigo_perfil_fk, correo, contraseña_usuario) VALUES (3014, 2014, 2, N'usuario14@correo.com', N'pass14segura');
INSERT INTO usuario (id_usuario, documento_usuario_fk, codigo_perfil_fk, correo, contraseña_usuario) VALUES (3015, 2015, 4, N'usuario15@correo.com', N'pass15segura');
INSERT INTO usuario (id_usuario, documento_usuario_fk, codigo_perfil_fk, correo, contraseña_usuario) VALUES (3016, 2016, 2, N'usuario16@correo.com', N'pass16segura');
INSERT INTO usuario (id_usuario, documento_usuario_fk, codigo_perfil_fk, correo, contraseña_usuario) VALUES (3017, 2017, 2, N'usuario17@correo.com', N'pass17segura');
INSERT INTO usuario (id_usuario, documento_usuario_fk, codigo_perfil_fk, correo, contraseña_usuario) VALUES (3018, 2018, 3, N'usuario18@correo.com', N'pass18segura');
INSERT INTO usuario (id_usuario, documento_usuario_fk, codigo_perfil_fk, correo, contraseña_usuario) VALUES (3019, 2019, 4, N'usuario19@correo.com', N'pass19segura');
INSERT INTO usuario (id_usuario, documento_usuario_fk, codigo_perfil_fk, correo, contraseña_usuario) VALUES (3020, 2020, 4, N'usuario20@correo.com', N'pass20segura');


INSERT INTO familia_empleado_cliente (documento_empleado_fk, parentesco, documento_pariente, nombre1, nombre2, apellido1, apellido2) VALUES (2001, N'Padre', 74589321, N'Antonio', N'Luis', N'García', N'Rodríguez');
INSERT INTO familia_empleado_cliente (documento_empleado_fk, parentesco, documento_pariente, nombre1, nombre2, apellido1, apellido2) VALUES (2002, N'Madre', 80123456, N'Lucía', N'María', N'Hernández', N'Gómez');
INSERT INTO familia_empleado_cliente (documento_empleado_fk, parentesco, documento_pariente, nombre1, nombre2, apellido1, apellido2) VALUES (2003, N'Hermano', 78876543, N'Carlos', N'Miguel', N'López', N'Sánchez');
INSERT INTO familia_empleado_cliente (documento_empleado_fk, parentesco, documento_pariente, nombre1, nombre2, apellido1, apellido2) VALUES (2004, N'Hija', 83456789, N'Laura', N'Isabel', N'Martínez', N'Ruiz');
INSERT INTO familia_empleado_cliente (documento_empleado_fk, parentesco, documento_pariente, nombre1, nombre2, apellido1, apellido2) VALUES (2005, N'Hermana', 86543211, N'Andrea', N'María', N'Torres', N'Vargas');
INSERT INTO familia_empleado_cliente (documento_empleado_fk, parentesco, documento_pariente, nombre1, nombre2, apellido1, apellido2) VALUES (2006, N'Cónyuge', 78932145, N'Sofía', N'Patricia', N'Díaz', N'Silva');
INSERT INTO familia_empleado_cliente (documento_empleado_fk, parentesco, documento_pariente, nombre1, nombre2, apellido1, apellido2) VALUES (2007, N'Hijo', 80456733, N'Mateo', N'Santiago', N'Romero', N'Morales');
INSERT INTO familia_empleado_cliente (documento_empleado_fk, parentesco, documento_pariente, nombre1, nombre2, apellido1, apellido2) VALUES (2008, N'Tía', 89431255, N'Elena', N'Mariana', N'Méndez', N'Cruz');
INSERT INTO familia_empleado_cliente (documento_empleado_fk, parentesco, documento_pariente, nombre1, nombre2, apellido1, apellido2) VALUES (2009, N'Primo', 82345678, N'Ignacio', N'David', N'Reyes', N'Fernández');
INSERT INTO familia_empleado_cliente (documento_empleado_fk, parentesco, documento_pariente, nombre1, nombre2, apellido1, apellido2) VALUES (2010, N'Hija', 88990012, N'Camila', N'Natalia', N'Peña', N'Alvarez');
INSERT INTO familia_empleado_cliente (documento_empleado_fk, parentesco, documento_pariente, nombre1, nombre2, apellido1, apellido2) VALUES (2011, N'Hermano', 87456321, N'Fernando', N'José', N'Castro', N'Molina');
INSERT INTO familia_empleado_cliente (documento_empleado_fk, parentesco, documento_pariente, nombre1, nombre2, apellido1, apellido2) VALUES (2012, N'Tío', 84561234, N'Roberto', N'Manuel', N'Soto', N'Ríos');
INSERT INTO familia_empleado_cliente (documento_empleado_fk, parentesco, documento_pariente, nombre1, nombre2, apellido1, apellido2) VALUES (2013, N'Padre', 87532109, N'Marco', N'Antonio', N'Guerrero', N'Navarro');
INSERT INTO familia_empleado_cliente (documento_empleado_fk, parentesco, documento_pariente, nombre1, nombre2, apellido1, apellido2) VALUES (2014, N'Madre', 86753091, N'Claudia', N'Andrea', N'León', N'Serrano');
INSERT INTO familia_empleado_cliente (documento_empleado_fk, parentesco, documento_pariente, nombre1, nombre2, apellido1, apellido2) VALUES (2015, N'Hermana', 89432501, N'Paula', N'Cristina', N'Campos', N'Mendoza');
INSERT INTO familia_empleado_cliente (documento_empleado_fk, parentesco, documento_pariente, nombre1, nombre2, apellido1, apellido2) VALUES (2016, N'Esposo', 83214567, N'Alonso', N'Gabriel', N'Paredes', N'Carrillo');
INSERT INTO familia_empleado_cliente (documento_empleado_fk, parentesco, documento_pariente, nombre1, nombre2, apellido1, apellido2) VALUES (2017, N'Hijo', 84125670, N'Esteban', N'Iván', N'Aguilar', N'Tapia');
INSERT INTO familia_empleado_cliente (documento_empleado_fk, parentesco, documento_pariente, nombre1, nombre2, apellido1, apellido2) VALUES (2018, N'Hija', 89991234, N'Mariana', N'Lucía', N'Ortega', N'Figueroa');
INSERT INTO familia_empleado_cliente (documento_empleado_fk, parentesco, documento_pariente, nombre1, nombre2, apellido1, apellido2) VALUES (2019, N'Abuelo', 87874562, N'Julio', N'Alberto', N'Vega', N'Miranda');
INSERT INTO familia_empleado_cliente (documento_empleado_fk, parentesco, documento_pariente, nombre1, nombre2, apellido1, apellido2) VALUES (2020, N'Abuela', 86743129, N'Josefina', N'Carmen', N'Núñez', N'Escobar');


INSERT INTO preguntas (
  Sientes_que_las_demandas_de_tu_trabajo_son_excesivas_o_difíciles_de_manejar,
  Te_resulta_difícil_desconectar_del_trabajo_fuera_del_horario_laboral,
  Experimentas_fatiga_o_agotamiento_incluso_después_de_descansar,
  Sientes_que_no_tienes_suficiente_control_sobre_tus_tareas_o_decisiones_laborales,
  Te_resulta_difícil_cumplir_con_los_plazos_y_objetivos_de_trabajo,
  Sientes_que_tu_carga_de_trabajo_ha_aumentado_significativamente_en_los_últimos_meses,
  Te_sientes_apoyado_emocionalmente_por_tus_compañeros_o_lideres,
  Sientes_que_puedes_hablar_abiertamente_sobre_como_te_sientes_en_el_trabajo,
  Te_sientes_satisfecho_con_el_equilibrio_entre_tu_vida_laboral_y_personal,
  Hay_algo_que_actualmente_te_este_afectando_negativamente_en_tu_entorno_laboral
) VALUES
('Bien', '4', 'Sí', 'No', 'Sí', 'No', 'Sí', 'Sí', 'Sí', 'No especialmente.'),
('Muy bien', '5', 'Sí', 'No', 'Sí', 'No', 'Sí', 'Sí', 'Sí', 'Todo está bajo control.'),
('Neutral', '3', 'A veces', 'Sí', 'Sí', 'Sí', 'No', 'No', 'No', 'Sobrecarga de tareas.'),
('Mal', '2', 'No', 'Sí', 'No', 'Sí', 'No', 'No', 'No', 'Ambiente de trabajo tenso.'),
('Muy mal', '1', 'No', 'Sí', 'No', 'Sí', 'No', 'No', 'No', 'Presión constante.'),
('Bien', '4', 'Sí', 'No', 'Sí', 'No', 'Sí', 'Sí', 'Sí', 'Sin inconvenientes.'),
('Bien', '3', 'A veces', 'Sí', 'Sí', 'Sí', 'Sí', 'No', 'Sí', 'Falta de comunicación.'),
('Muy bien', '5', 'Sí', 'No', 'Sí', 'No', 'Sí', 'Sí', 'Sí', 'Todo va bien.'),
('Neutral', '3', 'No', 'Sí', 'No', 'Sí', 'No', 'No', 'No', 'Mala relación con jefes.'),
('Bien', '4', 'Sí', 'No', 'Sí', 'No', 'Sí', 'Sí', 'Sí', 'Nada relevante.'),
('Muy bien', '5', 'Sí', 'No', 'Sí', 'No', 'Sí', 'Sí', 'Sí', 'Todo fluye correctamente.'),
('Neutral', '3', 'A veces', 'Sí', 'Sí', 'Sí', 'No', 'No', 'No', 'Ruido constante en la oficina.'),
('Mal', '2', 'No', 'Sí', 'No', 'Sí', 'No', 'No', 'No', 'Ambiente hostil.'),
('Muy mal', '1', 'No', 'Sí', 'No', 'Sí', 'No', 'No', 'No', 'Falta de apoyo.'),
('Bien', '4', 'Sí', 'No', 'Sí', 'No', 'Sí', 'Sí', 'Sí', 'Sin problemas por ahora.'),
('Bien', '4', 'Sí', 'No', 'Sí', 'No', 'Sí', 'Sí', 'Sí', 'Todo en orden.'),
('Neutral', '3', 'A veces', 'Sí', 'Sí', 'Sí', 'Sí', 'No', 'Sí', 'Tareas repetitivas.'),
('Muy bien', '5', 'Sí', 'No', 'Sí', 'No', 'Sí', 'Sí', 'Sí', 'Ambiente positivo.'),
('Neutral', '3', 'No', 'Sí', 'No', 'Sí', 'No', 'No', 'No', 'Falta de liderazgo.'),
('Bien', '4', 'Sí', 'No', 'Sí', 'No', 'Sí', 'Sí', 'Sí', 'Me siento valorado.');

INSERT INTO formularios (id_formulario, id_pregunta_fk, id_usuario_fk) VALUES (1, 1, 3011);
INSERT INTO formularios (id_formulario, id_pregunta_fk, id_usuario_fk) VALUES (2, 2, 3012);
INSERT INTO formularios (id_formulario, id_pregunta_fk, id_usuario_fk) VALUES (3, 3, 3013);
INSERT INTO formularios (id_formulario, id_pregunta_fk, id_usuario_fk) VALUES (4, 4, 3014);
INSERT INTO formularios (id_formulario, id_pregunta_fk, id_usuario_fk) VALUES (5, 5, 3015);
INSERT INTO formularios (id_formulario, id_pregunta_fk, id_usuario_fk) VALUES (6, 6, 3016);
INSERT INTO formularios (id_formulario, id_pregunta_fk, id_usuario_fk) VALUES (7, 7, 3017);
INSERT INTO formularios (id_formulario, id_pregunta_fk, id_usuario_fk) VALUES (8, 8, 3018);
INSERT INTO formularios (id_formulario, id_pregunta_fk, id_usuario_fk) VALUES (9, 9, 3019);
INSERT INTO formularios (id_formulario, id_pregunta_fk, id_usuario_fk) VALUES (10, 10, 3020);
INSERT INTO formularios (id_formulario, id_pregunta_fk, id_usuario_fk) VALUES (11, 11, 3011);
INSERT INTO formularios (id_formulario, id_pregunta_fk, id_usuario_fk) VALUES (12, 12, 3012);
INSERT INTO formularios (id_formulario, id_pregunta_fk, id_usuario_fk) VALUES (13, 13, 3013);
INSERT INTO formularios (id_formulario, id_pregunta_fk, id_usuario_fk) VALUES (14, 14, 3014);
INSERT INTO formularios (id_formulario, id_pregunta_fk, id_usuario_fk) VALUES (15, 15, 3015);
INSERT INTO formularios (id_formulario, id_pregunta_fk, id_usuario_fk) VALUES (16, 16, 3016);
INSERT INTO formularios (id_formulario, id_pregunta_fk, id_usuario_fk) VALUES (17, 17, 3017);
INSERT INTO formularios (id_formulario, id_pregunta_fk, id_usuario_fk) VALUES (18, 18, 3018);
INSERT INTO formularios (id_formulario, id_pregunta_fk, id_usuario_fk) VALUES (19, 19, 3019);
INSERT INTO formularios (id_formulario, id_pregunta_fk, id_usuario_fk) VALUES (20, 20, 3020);

INSERT INTO sesiones (id_usuario_fk, token, fecha_expiracion) VALUES
(3001, 'token1', '2025-05-08 12:00:00'),
(3002, 'token2', '2025-05-08 12:00:00'),
(3003, 'token3', '2025-05-08 12:00:00'),
(3004, 'token4', '2025-05-08 12:00:00'),
(3005, 'token5', '2025-05-08 12:00:00'),
(3006, 'token6', '2025-05-08 12:00:00'),
(3007, 'token7', '2025-05-08 12:00:00'),
(3008, 'token8', '2025-05-08 12:00:00'),
(3009, 'token9', '2025-05-08 12:00:00'),
(3010, 'token10', '2025-05-08 12:00:00'),
(3011, 'token11', '2025-05-08 12:00:00'),
(3012, 'token12', '2025-05-08 12:00:00'),
(3013, 'token13', '2025-05-08 12:00:00'),
(3014, 'token14', '2025-05-08 12:00:00'),
(3015, 'token15', '2025-05-08 12:00:00'),
(3016, 'token16', '2025-05-08 12:00:00'),
(3017, 'token17', '2025-05-08 12:00:00'),
(3018, 'token18', '2025-05-08 12:00:00'),
(3019, 'token19', '2025-05-08 12:00:00'),
(3020, 'token20', '2025-05-08 12:00:00');




----------------------PROCEDIMIENTO PARA INSERTAR EN PPI----------------------

CREATE PROCEDURE sp_InsertarPregunta
    @id_pregunta BIGINT,
    @Sientes_que_las_demandas_de_tu_trabajo_son_excesivas_o_difíciles_de_manejar NVARCHAR(500),
    @Te_resulta_difícil_desconectar_del_trabajo_fuera_del_horario_laboral NVARCHAR(500),
    @Experimentas_fatiga_o_agotamiento_incluso_después_de_descansar NVARCHAR(500),
    @Sientes_que_no_tienes_suficiente_control_sobre_tus_tareas_o_decisiones_laborales NVARCHAR(500),
    @Te_resulta_difícil_cumplir_con_los_plazos_y_objetivos_de_trabajo NVARCHAR(500),
    @Sientes_que_tu_carga_de_trabajo_ha_aumentado_significativamente_en_los_últimos_meses NVARCHAR(500),
    @Te_sientes_apoyado_emocionalmente_por_tus_compañeros_o_lideres NVARCHAR(500),
    @Sientes_que_puedes_hablar_abiertamente_sobre_como_te_sientes_en_el_trabajo NVARCHAR(500),
    @Te_sientes_satisfecho_con_el_equilibrio_entre_tu_vida_laboral_y_personal NVARCHAR(500),
    @Hay_algo_que_actualmente_te_este_afectando_negativamente_en_tu_entorno_laboral NVARCHAR(500)
AS
BEGIN

    INSERT INTO preguntas (
        id_pregunta,
        Sientes_que_las_demandas_de_tu_trabajo_son_excesivas_o_difíciles_de_manejar,
        Te_resulta_difícil_desconectar_del_trabajo_fuera_del_horario_laboral,
        Experimentas_fatiga_o_agotamiento_incluso_después_de_descansar,
        Sientes_que_no_tienes_suficiente_control_sobre_tus_tareas_o_decisiones_laborales,
        Te_resulta_difícil_cumplir_con_los_plazos_y_objetivos_de_trabajo,
        Sientes_que_tu_carga_de_trabajo_ha_aumentado_significativamente_en_los_últimos_meses,
        Te_sientes_apoyado_emocionalmente_por_tus_compañeros_o_lideres,
        Sientes_que_puedes_hablar_abiertamente_sobre_como_te_sientes_en_el_trabajo,
        Te_sientes_satisfecho_con_el_equilibrio_entre_tu_vida_laboral_y_personal,
        Hay_algo_que_actualmente_te_este_afectando_negativamente_en_tu_entorno_laboral
    )
    VALUES (
        @id_pregunta,
        @Sientes_que_las_demandas_de_tu_trabajo_son_excesivas_o_difíciles_de_manejar,
        @Te_resulta_difícil_desconectar_del_trabajo_fuera_del_horario_laboral,
        @Experimentas_fatiga_o_agotamiento_incluso_después_de_descansar,
        @Sientes_que_no_tienes_suficiente_control_sobre_tus_tareas_o_decisiones_laborales,
        @Te_resulta_difícil_cumplir_con_los_plazos_y_objetivos_de_trabajo,
        @Sientes_que_tu_carga_de_trabajo_ha_aumentado_significativamente_en_los_últimos_meses,
        @Te_sientes_apoyado_emocionalmente_por_tus_compañeros_o_lideres,
        @Sientes_que_puedes_hablar_abiertamente_sobre_como_te_sientes_en_el_trabajo,
        @Te_sientes_satisfecho_con_el_equilibrio_entre_tu_vida_laboral_y_personal,
        @Hay_algo_que_actualmente_te_este_afectando_negativamente_en_tu_entorno_laboral
    );
END;




----------------------PROCEDIMIENTO PARA ELIMINAR EN PPI----------------------

CREATE PROCEDURE sp_EliminarPregunta
    @id_pregunta BIGINT
AS
BEGIN
    SET NOCOUNT ON;

    -- Verifica si el registro existe antes de intentar eliminarlo
    IF EXISTS (SELECT 1 FROM preguntas WHERE id_pregunta = @id_pregunta)
    BEGIN
        DELETE FROM preguntas
        WHERE id_pregunta = @id_pregunta;

        PRINT 'Pregunta eliminada correctamente.';
    END
    ELSE
    BEGIN
        PRINT 'La pregunta con el ID especificado no existe.';
    END
END
GO


----------------------PROCEDIMIENTO PARA ELIMINAR EN PPI V2----------------------

create procedure sp_eliminar_formulario_v2
@id_pregunta bigint
as
begin
	delete preguntas where id_pregunta = @id_pregunta
end


--------------------------v3

CREATE PROCEDURE sp_InsertarPregunta3
    @Sientes_que_las_demandas_de_tu_trabajo_son_excesivas_o_difíciles_de_manejar NVARCHAR(MAX),
    @Te_resulta_difícil_desconectar_del_trabajo_fuera_del_horario_laboral NVARCHAR(MAX),
    @Experimentas_fatiga_o_agotamiento_incluso_después_de_descansar NVARCHAR(MAX),
    @Sientes_que_no_tienes_suficiente_control_sobre_tus_tareas_o_decisiones_laborales NVARCHAR(MAX),
    @Te_resulta_difícil_cumplir_con_los_plazos_y_objetivos_de_trabajo NVARCHAR(MAX),
    @Sientes_que_tu_carga_de_trabajo_ha_aumentado_significativamente_en_los_últimos_meses NVARCHAR(MAX),
    @Te_sientes_apoyado_emocionalmente_por_tus_compañeros_o_lideres NVARCHAR(MAX),
    @Sientes_que_puedes_hablar_abiertamente_sobre_como_te_sientes_en_el_trabajo NVARCHAR(MAX),
    @Te_sientes_satisfecho_con_el_equilibrio_entre_tu_vida_laboral_y_personal NVARCHAR(MAX),
    @Hay_algo_que_actualmente_te_este_afectando_negativamente_en_tu_entorno_laboral NVARCHAR(MAX)
AS
BEGIN
    INSERT INTO Preguntas (
        Sientes_que_las_demandas_de_tu_trabajo_son_excesivas_o_difíciles_de_manejar,
        Te_resulta_difícil_desconectar_del_trabajo_fuera_del_horario_laboral,
        Experimentas_fatiga_o_agotamiento_incluso_después_de_descansar,
        Sientes_que_no_tienes_suficiente_control_sobre_tus_tareas_o_decisiones_laborales,
        Te_resulta_difícil_cumplir_con_los_plazos_y_objetivos_de_trabajo,
        Sientes_que_tu_carga_de_trabajo_ha_aumentado_significativamente_en_los_últimos_meses,
        Te_sientes_apoyado_emocionalmente_por_tus_compañeros_o_lideres,
        Sientes_que_puedes_hablar_abiertamente_sobre_como_te_sientes_en_el_trabajo,
        Te_sientes_satisfecho_con_el_equilibrio_entre_tu_vida_laboral_y_personal,
        Hay_algo_que_actualmente_te_este_afectando_negativamente_en_tu_entorno_laboral
    )
    VALUES (
        @Sientes_que_las_demandas_de_tu_trabajo_son_excesivas_o_difíciles_de_manejar,
        @Te_resulta_difícil_desconectar_del_trabajo_fuera_del_horario_laboral,
        @Experimentas_fatiga_o_agotamiento_incluso_después_de_descansar,
        @Sientes_que_no_tienes_suficiente_control_sobre_tus_tareas_o_decisiones_laborales,
        @Te_resulta_difícil_cumplir_con_los_plazos_y_objetivos_de_trabajo,
        @Sientes_que_tu_carga_de_trabajo_ha_aumentado_significativamente_en_los_últimos_meses,
        @Te_sientes_apoyado_emocionalmente_por_tus_compañeros_o_lideres,
        @Sientes_que_puedes_hablar_abiertamente_sobre_como_te_sientes_en_el_trabajo,
        @Te_sientes_satisfecho_con_el_equilibrio_entre_tu_vida_laboral_y_personal,
        @Hay_algo_que_actualmente_te_este_afectando_negativamente_en_tu_entorno_laboral
    );
END

------------------------------------LOGIN
create PROCEDURE sp_crear_usuario
    @contraseña_usuario NVARCHAR(500),
    @correo NVARCHAR(500),
    @nombre_completo NVARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRY
        -- Validar que no exista un usuario con el mismo correo
        IF EXISTS (SELECT 1 FROM Usuario WHERE correo = @correo)
        BEGIN
            RAISERROR('Ya existe un usuario con este correo.', 16, 1);
            RETURN;
        END

        -- Insertar nuevo usuario con perfil 2
        INSERT INTO Usuario (contraseña_usuario, correo, nombre_completo, codigo_perfil_fk)
        VALUES (@contraseña_usuario, @correo, @nombre_completo, 3);

        -- Retornar el ID del nuevo usuario
        DECLARE @nuevo_usuario_id BIGINT = SCOPE_IDENTITY();
        SELECT @nuevo_usuario_id AS usuario_id;
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        RAISERROR(@ErrorMessage, 16, 1);
    END CATCH
END




alter table usuario
add constraint UQ_usuario_correo unique (correo);

alter table usuario add nombre_completo nvarchar(100) not null

select*from usuario

select*from preguntas

select*from perfil