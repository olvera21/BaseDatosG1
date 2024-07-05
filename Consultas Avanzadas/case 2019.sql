select BusinessEntityID,
Salariedflag
from HumanResources.Employee
order by
Case SalariedFlag
when 1 then BusinessEntityID
END DESC,
Case
when SalariedFlag = 0 then BusinessEntityID
end;

select BusinessEntityID,
  lastName,
  TerritoryName,
  CountryRegionName
  from Sales.vSalesPerson
  where TerritoryName IS NOT NULL
  order by
  case CountryRegionName
  when 'united states' then TerritoryName
  else CountryRegionName
  end
  
  SELECT v.AccountNumber,
        v.name,
		case when v.PurchasingWebServiceURL is null then'no url'
  end
  as '  v.PurchasingWebServiceURL '
  from
  [Purchasing].[Vendor] as v;

--Funcion IFF

SELECT IIF(1=1, 'VERDADERO', 'FALSO') AS 'RESULTADO';

CREATE VIEW vista_genero
AS
SELECT e.LoginID, e.JobTitle, e.Gender, IIf(e.Gender='F', 'MUJER','HOMBRE') AS 'SEXO'
FROM HumanResources.Employee AS e;

SELECT UPPER(JobTitle) as [Titulo] 
FROM vista_genero
WHERE SEXO = 'MUJER';

IF OBJECT_ID (N'tempdb..#StudentsC1') is not NULL
begin
    drop table #StudentsC1;
end

CREATE TABLE #StudentsC1(
    StudentID       INT
    ,StudentName    VARCHAR(50)
    ,StudentStatus  BIT
);

INSERT INTO #StudentsC1(StudentID, StudentName, StudentStatus) VALUES(1,'Axel Romero',1)
INSERT INTO #StudentsC1(StudentID, StudentName, StudentStatus) VALUES(2,'Sofía Mora',1)
INSERT INTO #StudentsC1(StudentID, StudentName, StudentStatus) VALUES(3,'Rogelio Rojas',0)
INSERT INTO #StudentsC1(StudentID, StudentName, StudentStatus) VALUES(4,'Mariana Rosas',1)
INSERT INTO #StudentsC1(StudentID, StudentName, StudentStatus) VALUES(5,'Roman Zavaleta',1)




IF OBJECT_ID(N'tempdb..#StudentsC2') is not NULL
begin
drop table #StudentsC2
END


CREATE TABLE #StudentsC2(
    StudentID       INT
    ,StudentName    VARCHAR(50)
    ,StudentStatus  BIT
);


INSERT INTO #StudentsC2(StudentID, StudentName, StudentStatus) VALUES(1,'Axel Romero Rendón',1)
INSERT INTO #StudentsC2(StudentID, StudentName, StudentStatus) VALUES(2,'Sofía Mora Ríos',0)
INSERT INTO #StudentsC2(StudentID, StudentName, StudentStatus) VALUES(6,'Mario Gonzalez Pae',1)
INSERT INTO #StudentsC2(StudentID, StudentName, StudentStatus) VALUES(7,'Alberto García Morales',1)

SELECT * FROM #StudentsC1;

SELECT * FROM #StudentsC2;

SELECT* FROM 
#StudentsC1 as s1 
INNER JOIN #StudentsC2 as s2
on s1.StudentID = s2.StudentID;

SELECT* FROM 
#StudentsC1 as s1 
RIGHT JOIN #StudentsC2 as s2
on s1.StudentID = s2.StudentID;

UPDATE s2 
set s2.StudentName = s1.StudentName,
    s2.StudentStatus = s1.StudentStatus
FROM
#StudentsC1 as s1
INNER JOIN #StudentsC2 as s2
on s1.StudentID = s2.StudentID

SELECT * FROM #StudentsC2;
