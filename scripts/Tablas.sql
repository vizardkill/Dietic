CREATE TABLE SEXOS (
    id INTEGER,
    nombre VARCHAR(10)
)
TABLESPACE DIETIC;

CREATE TABLE ESTADOS_USUARIOS (
    id INTEGER,
    nombre varchar(10),
    descripcion VARCHAR2(60)
)
TABLESPACE DIETIC;

CREATE TABLE PERFILES (
    id INTEGER,
    nombre VARCHAR2(10),
    descripcion VARCHAR(60)
)
TABLESPACE DIETIC;

CREATE TABLE USUARIOS(
    identificacion VARCHAR2(30),
    username VARCHAR(15),
    pwd VARCHAR(255),
    nombres VARCHAR(255),
    apellidos VARCHAR2(255),
    correo VARCHAR2(100),
    telefono varchar(10),
    direccion VARCHAR(30),
    fecha_nacimiento DATE,
    talla NUMBER,
    peso NUMBER,    
    perfil INTEGER,
    estado INTEGER,
    sexo INTEGER
)
TABLESPACE DIETIC;

CREATE TABLE RECETAS(
    id INTEGER,
    usuario VARCHAR2(30),
    descripcion VARCHAR2(255)
)
TABLESPACE DIETIC;

CREATE TABLE ESTADOS_CITAS (
    id INTEGER,
    nombre VARCHAR2(10),
    descripcion VARCHAR2(60)
)
TABLESPACE DIETIC;

CREATE TABLE CITAS (
    id INTEGER,
    usuario VARCHAR2(30),
    estado INTEGER,
    descripcion varchar2(800),
    fecha varchar2(200)
)
TABLESPACE DIETIC;



