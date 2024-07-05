create DATABASE primertrigerG1;

use primertrigerG1;

Create table Empleado(
idempleado int not null PRIMARY key,
nombreEmpr VARCHAR(30) not null,
apellido1 VARCHAR(15) not null, 
apellido2 VARCHAR(15),
salario money not null);

CREATE TABLE EmpleadoAudit (
    audit_id INT IDENTITY(1,1) PRIMARY KEY,
    idempleado INT NOT NULL,
    nombreEmpr VARCHAR(30) NOT NULL,
    apellido1 VARCHAR(15) NOT NULL,
    apellido2 VARCHAR(15),
    salario MONEY NOT NULL,
    audit_action VARCHAR(10) NOT NULL,
    audit_timestamp DATETIME NOT NULL DEFAULT GETDATE()
);

CREATE TRIGGER trg_AfterInsertEmpleado
ON Empleado
AFTER INSERT
AS
BEGIN
    INSERT INTO EmpleadoAudit (idempleado, nombreEmpr, apellido1, apellido2, salario, audit_action)
    SELECT idempleado, nombreEmpr, apellido1, apellido2, salario, 'INSERT'
    FROM inserted;
END;

INSERT INTO Empleado (idempleado, nombreEmpr, apellido1, apellido2, salario)
VALUES (1, 'Juan', 'Pérez', 'Gómez', 50000),
       (2, 'Ana', 'López', NULL, 60000),
       (3, 'Carlos', 'Martínez', 'Hernández', 55000);

       INSERT INTO Empleado (idempleado, nombreEmpr, apellido1, apellido2, salario)
VALUES (4, 'Eduardo', 'Olvera', 'Camacho', 50000);

SELECT*FROM empleado;
SELECT*from  EmpleadoAudit;

