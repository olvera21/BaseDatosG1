--Consultas avanzadas--
SELECT c.CategoryName as "Nombre categoria",
 p.productName as "Nombre producto",
 p.UnitePrice as "Precoo",
  P.UnitsInstock as "Existencia" FROM
Categories AS c 
INNER JOIN Products AS p 
on c.CategoryID = p.CategoryID 
where Categoryname ('Berverage', )
