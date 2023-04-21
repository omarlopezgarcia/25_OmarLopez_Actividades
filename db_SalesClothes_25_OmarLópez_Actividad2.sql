/*Poner en uso la base de datos*/
use db_SalesClothesAct1

/* Configurar a idioma español en el servidor */
SET LANGUAGE Español
GO
SELECT @@language AS 'Idioma'
GO

/*Configurar el formato de fecha*/
SET DATEFORMAT DMY
GO

/* Inserción de registros en tabla client */
INSERT INTO client 
(type_document, number_document, names, last_name, email, cell_phone, birthdate)
VALUES
('DNI', '78451233', 'Fabiola', 'Perales Campos', 'fabiolaperales@gmail.com', '991692597', '19/01/2005'),
('DNI', '14782536', 'Marcos', 'Dávila Palomino', 'marcosdavila@gmail.com', '982514752', '03/03/1990'),
('DNI', '78451236', 'Luis Alberto', 'Barrios Paredes', 'luisbarrios@outlook.com', '985414752', '03/10/1995'),
('CNE', '352514789', 'Claudia María', 'Martínez Rodríguez', 'claudiamartinez@yahoo.com', '995522147', '23/09/1992'),
('CNE', '142536792', 'Mario Tadeo', 'Farfán Castillo', 'mariotadeo@outlook.com', '973125478', '25/11/1997'),
('DNI', '58251433', 'Ana Lucrecia', 'Chumpitaz Prada', 'anachumpitaz@gmail.com', '982514361', '17/10/1992'),
('DNI', '15223369', 'Humberto', 'Cabrera Tadeo', 'humbertocabrera@yahoo.com', '977112234', '27/05/1990'),
('CNE', '442233698', 'Rosario', 'Prada Velásquez', 'rosarioprada@outlook.com', '971144782', '05/11/1990')
GO
/*Ver datos de la tabla client*/
SELECT * FROM client 
GO
/*Inserción de registros en tabla seller*/

INSERT INTO seller
(type_document, number_document, names, last_name, cell_phone, email)
VALUES
('DNI', '11224578', 'Oscar', 'Paredes Flores', '985566251', 'oparedes@miempresa.com'),
('CNE', '889922365', 'Azucena', 'Valle Alcazar', '966338874', 'avalle@miempresa.com'),
('DNI', '44771123', 'Rosario', 'Huarca Tarazona', '933665521', 'rhuarca@miempresa.com')
GO

/*Ver datos de la tabla seller*/
SELECT * FROM seller 
GO
/*Inserción de registros en tabla clothes*/

INSERT INTO clothes
(descriptions, brand, amount, size, price)
VALUES
('Polo camisero', 'Adidas', '20', 'Medium', '40.50'),
('Short Playero', 'Nike', '30', 'Medium', '55.50'),
('Camisa Sport', 'Adams', '60', 'Large', '60.80'),
('Camisa Sport', 'Adams', '70', 'Medium', '58.75'),
('Buzo de verano', 'Reebok', '45', 'Small', '62.89'),
('Pantalón Jean', 'Lewis', '35', 'Large', '73.60')
GO

/*Ver datos de la tabla clothes*/
SELECT * FROM clothes 
GO

/* Listar todos los datos de los clientes (client) cuyo tipo de documento sea DNI */

SELECT
	last_name as 'APELLIDOS',
	names as 'NOMBRE',
	email as 'EMAIL',
	cell_phone as '# CELULAR',
	type_document as 'DOCUMENTO',
	number_document as '# DOC.'
FROM
	client
WHERE
	type_document = 'DNI'
GO

/* Listar todos los datos de los clientes (client) cuyo servidor de correo electrónico sea outlook.com */

SELECT
	last_name as 'APELLIDOS',
	names as 'NOMBRE',
	email as 'EMAIL',
	cell_phone as '# CELULAR',
	type_document as 'DOCUMENTO',
	number_document as '# DOC.'
FROM
	client
WHERE
	email LIKE '%@outlook.com'
GO

/* Listar todos los datos de los vendedores (seller) cuyo tipo de documento sea CNE. */

SELECT
	last_name as 'APELLIDOS',
	names as 'NOMBRE',
	email as 'EMAIL',
	cell_phone as '# CELULAR',
	type_document as 'DOCUMENTO',
	number_document as '# DOC.'
FROM
	seller
WHERE
	type_document = 'CNE'
GO

/* Listar todas las prendas de ropa (clothes) cuyo costo sea menor e igual que S/. 55.00 */

SELECT
	descriptions as 'DESCRIPCIÓN',
	brand as 'MARCA',
	amount as 'MONTO',
	size as 'TALLA',
	price as 'PRECIO'
FROM
	clothes
WHERE
	price = '55.00' or price < '55.00'
GO

/* Listar todas las prendas de ropa (clothes) cuya marca sea Adams */

SELECT
	descriptions as 'DESCRIPCIÓN',
	brand as 'MARCA',
	amount as 'MONTO',
	size as 'TALLA',
	price as 'PRECIO'
FROM
	clothes
WHERE
	brand = 'Adams'
GO

/* Eliminar lógicamente los datos de un cliente client de acuerdo a un determinado id */

DELETE FROM client
WHERE id = '3'
GO

select * from client
go

/* Eliminar lógicamente los datos de un cliente seller de acuerdo a un determinado id */

DELETE FROM seller
WHERE id = '2'
GO

select * from seller
go

/* Eliminar lógicamente los datos de un cliente clothes de acuerdo a un determinado id */

DELETE FROM clothes
WHERE id = '4'
GO

select * from clothes
go

