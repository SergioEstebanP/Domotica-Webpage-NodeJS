USE Domotica

DROP TABLE IF EXISTS noticia;
DROP TABLE IF EXISTS precio_luz;
DROP TABLE IF EXISTS usuario;
DROP TABLE IF EXISTS ciudad;
DROP TABLE IF EXISTS tipo_dispositivo;
DROP TABLE IF EXISTS dispositivo;


CREATE TABLE noticia (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(100),
    contenidoAcortado VARCHAR(500),
    url_imagen VARCHAR(100)
);

CREATE TABLE precio_luz (
    fecha DATE, 
    precio_actual VARCHAR(20),
    precio_anterior VARCHAR(20)
);

CREATE TABLE usuario (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    nick VARCHAR(50),
    email VARCHAR(50),
    password VARCHAR(50),
    nombre VARCHAR(50),
    apellidos VARCHAR(100),
    fotoPerfil VARCHAR(200)
);

CREATE TABLE ciudad (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50),
    temperatura VARCHAR(50),
    tiempoTexto VARCHAR(50),
    linkCiudad VARCHAR(100)
);

CREATE TABLE tipo_dispositivo (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    tipo_dispositivo VARCHAR(50)
);

CREATE TABLE dispositivo (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50),
    tipo INTEGER REFERENCES TIPO_DISPOSITIVO(id)
);

INSERT INTO usuario (nick, email, password, nombre, apellidos) VALUES ("sergio", "sergi2312@gmail.com", "password", "Sergio", "Esteban");
INSERT INTO usuario (nick, email, password, nombre, apellidos) VALUES ("admin", "admin@gmail.com", "admin", "Admin", "Admin");
