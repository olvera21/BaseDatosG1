CREATE DATABASE colegio;

use colegio;

CREATE TABLE Alumno(
idalum int not null identity (1,1),
nombre varchar(50) not null, 
apellido varchar(50) not null,
nacimiento date, 
telefono varchar(20) not null,

)