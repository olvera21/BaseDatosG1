create DATABASE etlEmpresa2;

use etlempresa2;

create table cliente(
	clienteid int not null identity(1,1),
	clientedk nchar(5) not null,
	empresa nvarchar(40) not null,
	ciudad nvarchar(15) not null,
	region nvarchar(15) not null,
	pais nvarchar(15) not null,
	constraint pk_cliente
	primary key(clienteid)
);

create table producto(
	productoid int not null IDENTITY(1,1),
	productodk nchar(5) not null,
	nombre_producto NVARCHAR(40) not null,
	categoria NVARCHAR(20) not null, 
	precio money null,
	existencia smallint null,
	descontinuado bit null,
	constraint pk_producto
	primary key(productoid)
);

create table empleado(
	empleadoid int not null IDENTITY(1,1),
	empleadodk nchar(5) not null,
	nombre_completo NVARCHAR(50) not null,
	ciudad NVARCHAR(15)null,
	region NVARCHAR(15)null,
	pais NVARCHAR(15) not null,
	CONSTRAINT pk_empleado
	PRIMARY KEY (empleadoid)
);

create table proveedor( 
	proveedorid int not null IDENTITY(1,1),
	proveedordk nchar(5) not null,
	empresa NVARCHAR(40) not null,
	ciudad NVARCHAR(15)null,
	region NVARCHAR(15)null,
	country NVARCHAR(15)null,
	homepage NVARCHAR(30)null,
	CONSTRAINT pk_proveedor
	PRIMARY KEY (proveedorid)
);

create table ventas(
	clienteid int not null,
	productoid int not null,
	empleadoid int not null,
	proveedorid int not null,
	cantidad int not null,
	precio money not null,
	constraint pk_venta primary key(clienteid, productoid, empleadoid, proveedorid),
	constraint fk_venta_cliente foreign key(clienteid) references cliente(clienteid),
	constraint fk_venta_producto foreign key(productoid) references producto(productoid),
	constraint fk_venta_empleado foreign key(empleadoid) references empleado(empleadoid),
	constraint fk_venta_proveedor foreign key(proveedorid) references proveedor(proveedorid)
);
