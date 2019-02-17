USE Domotica

DROP TABLE IF EXISTS NOTICIA;
DROP TABLE IF EXISTS PRECIO_LUZ;
DROP TABLE IF EXISTS USUARIO;
DROP TABLE IF EXISTS CIUDADES;
DROP TABLE IF EXISTS TIPO_DISPOSITIVO;
DROP TABLE IF EXISTS DISPOSITIVO;


CREATE TABLE NOTICIA (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(100),
    contenidoAcortado VARCHAR(500),
    url_imagen VARCHAR(100)
);

CREATE TABLE PRECIO_LUZ (
    fecha DATE, 
    precio_actual VARCHAR(20),
    precio_anterior VARCHAR(20)
);

CREATE TABLE USUARIO (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    nick VARCHAR(50),
    email VARCHAR(50),
    password VARCHAR(50),
    nombre VARCHAR(50),
    apellidos VARCHAR(100),
    fotoPerfil VARCHAR(200)
);

CREATE TABLE CIUDADES (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50),
    temperatura VARCHAR(50),
    tiempoTexto VARCHAR(50),
    linkCiudad VARCHAR(100)
);

CREATE TABLE TIPO_DISPOSITIVO (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    tipo_dispositivo VARCHAR(50)
);

CREATE TABLE DISPOSITIVO (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50),
    tipo INTEGER REFERENCES TIPO_DISPOSITIVO(id)
);

INSERT INTO USUARIO (nick, email, password, nombre, apellidos) VALUES ("Sergio", "sergi2312@gmail.com", "password", "Sergio", "Esteban");
INSERT INTO USUARIO (nick, email, password, nombre, apellidos) VALUES ("Admin", "admin@gmail.com", "admin", "Admin", "Admin");
