--Store procedures

CREATE PROCEDURE sp_prueba_g1
as 
BEGIN
    print 'Hola mundo';
END
--Ejecutar store procedure

--Declaracion de variables
Declare @n int
Declare @i int 

set @n =5
set @i =1

print('El valor de n es: '+ cast(@n as varchar))
print('El valor de i es: '+ cast(@i as varchar))

create database prueba_sp

use prueba_sp;

CREATE PROCEDURE sp_1
as 
begin 
Declare @n int
Declare @i int 

set @n =5
set @i =1

print('El valor de n es: '+ cast(@n as varchar))
print('El valor de i es: '+ cast(@i as varchar))
end

--Ejecutar 10 veces sp_1 solamente si el sentinela es 1
Declare @n as int = 10
Declare @i as int = 1

while @i<= @n
BEGIN
    PRINT(@i);
    set @i +=1
end

Create PROCEDURE sp_2
as
Declare @n as int = 10
Declare @i as int = 1

while @i<= @n
BEGIN
    PRINT(@i);
    set @i +=1
end

EXECUTE sp_2;

-store procedure con parametros dpe entrada

CREATE PROCEDURE sp_4
    @n INT -- Parámetro de entrada
AS 
BEGIN 
    DECLARE @i INT = 1;

    IF @n > 0
    BEGIN 
        PRINT 'Verdadero';
        WHILE @i <= @n 
        BEGIN
            PRINT(@i);
            SET @i += 1;
        END
    END    
    ELSE 
    BEGIN
        PRINT 'Falso';
        PRINT 'El valor de n debe ser mayor a 0';
    END
END

-- Ejecución del procedimiento almacenado con @n=23
EXEC sp_4 @n = 23;

-- Ejecución del procedimiento almacenado con un valor no válido
EXEC sp_3 @n = -5;


--Seleccionar de la bd nortwhindo todas las ordenes de comprar para un año determinado 