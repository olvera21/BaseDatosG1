Create database EjercicioExamen;

use EjercicioExamen;

create table proveedor(
    idprov int not null IDENTITY(1,1),
    nombre varchar (50) not null,
    limite_credito money not null,
    CONSTRAINT pk_proveedor
    PRIMARY KEY (idprov),
    CONSTRAINT unico_nombre_proveedor
    UNIQUE (nombre)
);

CREATE TABLE categoria(
    idcatego int not null,
    nombre varchar(50) not null,
    CONSTRAINT pk_categoria
    PRIMARY KEY (idcatego),
    CONSTRAINT unico_nombre_categoria
    UNIQUE (nombre)
);

CREATE TABLE producto(
    idprod int not null,
    nombre varchar(50) not null,
    precio money not null,
    existencia int not null,
    proveedor int,
    idcatego int
    CONSTRAINT pk_producto
    PRIMARY KEY(idprod),
    CONSTRAINT fk_producto_prov
    FOREIGN KEY (proveedor)
    REFERENCES proveedor(idprov),
    CONSTRAINT fk_producto_categoria
    FOREIGN KEY (idcatego)
    REFERENCES categoria (idcatego)
);

--instertar datos de la tabla 
insert into proveedor (nombre, limite_credito)
values('Coca-cola', 98777),
      ('Pecsi', 234567),
      ('Hay me Pica', 44566),
      ('Hay me Duele', 45677),
      ('Tengo Miedo', 22344);

insert into categoria
values(1, 'Lacteos'),
(2, 'Linea Blanca'),
(3, 'Dulces'),
(4, 'Vinos'),
(5, 'Abarrotes');

SELECT*FROM proveedor;

insert into producto
values (1, 'Mascara', 78.9,20,5,5);

insert into producto(proveedor, existencia, idcatego, precio, idprod, nombre)
values (3, 34, 5,56.7,2, 'Manita Rascadora');

insert into producto
values (3, 'Tonayan', 1450, 56, 4, 4);
insert into producto
values
    (4, 'Caramelo', 200, 22, 1, 3),
    (5, 'Terry', 200, 24, 4, 4);


select c.idcatego, p.idcatego, c.nombre, p.precio
from categoria as c 
INNER JOIN producto as p 
on c.idcatego= p.idcatego;

select*, (p.precio * p.existencia) as importe
from categoria as c
INNER JOIN producto as p 
on c.idcatego = p.idcatego;

SELECT c.idcatego, c.nombre, p.nombre, p.existencia, p.precio, (p.precio * P.existencia) as importe
FROM 
(SELECT idcatego, nombre from categoria) as c 
INNER JOIN 
(select nombre,precio, existencia, idcatego from producto) as p 
on c.idcatego = p.idcatego;

use NORTHWND;

SELECT *
FROM (select orderid, orderdate, shipcountry, RequiredDate from Orders) as o;

use EjercicioExamen;

select *
from categoria as c 
INNER JOIN producto as p
ON c.idcatego = p.idprod
INNER JOIN proveedor as pr
ON pr.idprov = p.proveedor;


SELECT * 
FROM categoria as c 
LEFT JOIN 
producto as p 
ON c.idcatego = p.idcatego;

SELECT c.nombre, p.nombre, p.precio, p.existencia 
FROM categoria as c
LEFT JOIN producto as p
ON c.idcatego = p.idcatego
WHERE  p.idcatego is null;

SELECT c.nombre, p.nombre, p.precio, p.existencia 
FROM categoria as c
LEFT JOIN (select precio, existencia, idcatego, nombre from producto) as p
ON c.idcatego = p.idcatego
WHERE  p.idcatego is null;

SELECT c.nombre, p.nombre, p.precio, p.existencia 
FROM categoria as c
RIGHT JOIN producto as p
ON c.idcatego = p.idcatego;


SELECT *
FROM categoria as c
FULL JOIN producto as p
ON c.idcatego = p.idcatego;

SELECT *
FROM categoria as c
LEFT JOIN  producto as p
ON c.idcatego = p.idcatego
INNER JOIN proveedor as pr 
on pr.idprov = p.proveedor;

SELECT *
FROM categoria as c
RIGHT JOIN  producto as p
ON c.idcatego = p.idcatego
INNER JOIN proveedor as pr 
on pr.idprov = p.proveedor;
