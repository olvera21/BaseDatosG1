create or alter proc sp_4
@n int --parametro de entrada
as
begin
Declare @i int = 0
declare @c int = 0 

if @n>0
begin
	while @i<=@n
	begin 
		set @c = @c + @i
		set @i+= 1
	end
	print ('La suma de los puntos es: '+ cast (@c as varchar))
end
else
begin
	print 'El valor de n debe ser mayor a 0'
end 
end

exec sp_4 6

CREATE PROCEDURE ano
    @Ano INT
AS
BEGIN
    SELECT *, YEAR(OrderDate) AS Anio
    FROM Orders
    WHERE YEAR(OrderDate) = @Ano;
END;

EXEC ano @Ano = 1996;


    @Ano INT
AS
BEGIN
    SELECT *, YEAR(OrderDate) AS Anio
    FROM Orders
    INNER JOIN Customers
    WHERE YEAR(OrderDate) = @Ano;
END;