/*Crear base de datos de la Actividad 1*/
create database db_SalesClothesAct1

/*Poner en uso la base de datos*/
use db_SalesClothesAct1

/* Configurar a idioma español en el servidor */
SET LANGUAGE Español
GO
SELECT @@language AS 'Idioma'
GO

/*Configurar el formato de fecha*/
SET DATEFORMAT dmy
GO

-- INICIO TABLA CLIENT
/*Crear la tabla client*/
CREATE TABLE client (
    id int  NOT NULL,
    type_document char(3)  NOT NULL,
    number_document char(15)  NOT NULL,
    names varchar(60)  NOT NULL,
    last_name varchar(90)  NOT NULL,
    email varchar(80)  NOT NULL,
    cell_phone char(9)  NOT NULL,
    birthdate date  NOT NULL,
    active bit  NOT NULL,
    CONSTRAINT client_pk PRIMARY KEY  (id)
);
/*Quitamos la Primary Key de la tabla client*/
ALTER TABLE client
	DROP CONSTRAINT client_pk
GO

/*Eliminamos la columna id en tabla cliente*/
ALTER TABLE client
	DROP COLUMN id
GO

/*Agregamos columna client con restricción*/
ALTER TABLE client
	ADD id int identity(1,1)
GO

/*Agregamos la Primary Key a la tabla client*/
ALTER TABLE client
	ADD CONSTRAINT client_pk 
	PRIMARY KEY (id)
GO

/* El tipo de documento puede ser solo DNI ó CNE, entonces eliminamos la columna*/
ALTER TABLE client
	DROP COLUMN type_document
GO

/* Agregar restricción para tipo documento */
ALTER TABLE client
	ADD type_document char(3)
	CONSTRAINT type_document_client 
	CHECK(type_document ='DNI' OR type_document ='CNE')
GO

/* Eliminar columna número de documento de tabla client */
ALTER TABLE client
	DROP COLUMN number_document
GO

/* El número de documento sólo debe permitir dígitos de 0 - 9 */
ALTER TABLE client
	ADD number_document char(9) not null
	CONSTRAINT number_document_client
	CHECK (number_document like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][^A-Z]')
GO

/* Eliminar columna email de tabla client */
ALTER TABLE client
	DROP COLUMN email
GO

/* Agregar columna email */
ALTER TABLE client
	ADD email varchar(80) not null
	CONSTRAINT email_client
	CHECK(email LIKE '%@%._%')
GO

/* Eliminar columna celular */
ALTER TABLE client
	DROP COLUMN cell_phone
GO

/* Validar que el celular esté conformado por 9 números */
ALTER TABLE client
	ADD cell_phone char(9) not null
	CONSTRAINT cellphone_client
	CHECK (cell_phone like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
GO

/* Eliminar columna fecha de nacimiento */
ALTER TABLE client
	DROP COLUMN birthdate
GO

/* Sólo debe permitir el registro de clientes mayores de edad */
ALTER TABLE client
	ADD  birthdate date not null
	CONSTRAINT birthdate_client
	CHECK((YEAR(GETDATE())- YEAR(birthdate )) >= 18)
GO

/* Eliminar columna active de tabla client */
ALTER TABLE client
	DROP COLUMN active
GO

/* El valor predeterminado será activo al registrar clientes */
ALTER TABLE client
	ADD active bit DEFAULT (1) not null
GO

-- FIN TABLA CLIENT

-- INICIO TABLA SELLER
/*Crear la tabla seller*/
CREATE TABLE seller (
    id int  NOT NULL,
    type_document char(3)  NOT NULL,
    number_document char(15)  NOT NULL,
    names varchar(60)  NOT NULL,
    last_name varchar(90)  NOT NULL,
    salary decimal(8,2)  NOT NULL,
    cell_phone char(9)  NOT NULL,
    email varchar(80)  NOT NULL,
    activo bit  NOT NULL,
    CONSTRAINT seller_pk PRIMARY KEY  (id)
);

/*Quitamos la Primary Key de la tabla seller*/
ALTER TABLE seller
	DROP CONSTRAINT seller_pk
GO

/*Eliminamos la columna id en tabla seller*/
ALTER TABLE seller
	DROP COLUMN id
GO

/*Agregamos columna seller con restricción*/
ALTER TABLE seller
	ADD id int identity(1,1)
GO

/*Agregamos la Primary Key a la tabla seller*/
ALTER TABLE seller
	ADD CONSTRAINT seller_pk 
	PRIMARY KEY (id)
GO

/* El tipo de documento puede ser solo DNI ó CNE, entonces eliminamos la columna*/
ALTER TABLE seller
	DROP COLUMN type_document
GO

/* Agregar restricción para tipo documento */
ALTER TABLE seller
	ADD type_document char(3) not null
	CONSTRAINT type_document_seller 
	CHECK(type_document ='DNI' OR type_document ='CNE')
GO

/* Eliminar columna número de documento de tabla seller */
ALTER TABLE seller
	DROP COLUMN number_document
GO

/* El número de documento sólo debe permitir dígitos de 0 - 9 */
ALTER TABLE seller
	ADD number_document char(9) not null
	CONSTRAINT number_document_seller
	CHECK (number_document like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][^A-Z]')
GO

/*Poner en salario como valor predeterminado de 1025, primero eliminar*/
ALTER TABLE seller
	DROP COLUMN salary
GO

/*Poner como valor predeterminado de 1025*/
ALTER TABLE seller
	ADD salary decimal(8,2)
	CONSTRAINT salary_seller
	DEFAULT '1025'
GO

/* Eliminar columna celular */
ALTER TABLE seller
	DROP COLUMN cell_phone
GO

/* Validar que el celular esté conformado por 9 números */
ALTER TABLE seller
	ADD cell_phone char(9) not null
	CONSTRAINT cellphone_seller
	CHECK (cell_phone like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
GO

/* Eliminar columna email de tabla seller */
ALTER TABLE seller
	DROP COLUMN email
GO

/* Agregar columna email */
ALTER TABLE seller
	ADD email varchar(80)
	CONSTRAINT email_seller
	CHECK(email LIKE '%@%._%')
GO

/* Eliminar columna active de tabla seller */
ALTER TABLE seller
	DROP COLUMN activo
GO

/* El valor predeterminado será activo */
ALTER TABLE seller
	ADD activo bit DEFAULT (1)
GO

-- FIN TABLA SELLER

-- INICIO TABLA CLOTHES
/*Crear la tabla clothes*/
CREATE TABLE clothes (
    id int  NOT NULL,
    descriptions varchar(60)  NOT NULL,
    brand varchar(60)  NOT NULL,
    amount int  NOT NULL,
    size varchar(10)  NOT NULL,
    price decimal(8,2)  NOT NULL,
    active bit  NOT NULL,
    CONSTRAINT clothes_pk PRIMARY KEY  (id)
);

/*Quitamos la Primary Key de la tabla clothes*/
ALTER TABLE clothes
	DROP CONSTRAINT clothes_pk
GO

/*Eliminamos la columna id en tabla clothes*/
ALTER TABLE clothes
	DROP COLUMN id
GO

/*Agregamos columna clothes con restricción*/
ALTER TABLE clothes
	ADD id int identity(1,1)
GO

/*Agregamos la Primary Key a la tabla clothes*/
ALTER TABLE clothes
	ADD CONSTRAINT clothes_pk 
	PRIMARY KEY (id)
GO

/* Eliminar columna active de tabla clothes */
ALTER TABLE clothes
	DROP COLUMN active
GO

/* El valor predeterminado será activo */
ALTER TABLE clothes
	ADD active bit DEFAULT (1)
GO

-- FIN TABLA CLOTHES

-- INICIO TABLA SALE
/*Crear la tabla sale*/
CREATE TABLE sale (
    id int  NOT NULL,
    date_time datetime  NOT NULL,
    active bit  NOT NULL,
	seller_id int  NOT NULL,
    client_id int  NOT NULL,
    CONSTRAINT sale_pk PRIMARY KEY  (id)
);

/*Quitamos la Primary Key de la tabla sale*/
ALTER TABLE sale
	DROP CONSTRAINT sale_pk
GO

/*Eliminamos la columna id en tabla sale*/
ALTER TABLE sale
	DROP COLUMN id
GO

/*Agregamos columna sale con restricción*/
ALTER TABLE sale
	ADD id int identity(1,1)
GO

/*Agregamos la Primary Key a la tabla sale*/
ALTER TABLE sale
	ADD CONSTRAINT sale_pk 
	PRIMARY KEY (id)
GO

/*Eliminar campo date_time para las restricciones*/
ALTER TABLE sale
	DROP COLUMN date_time
GO

/*Poner valor predeterminado la fecha y hora del servidor*/
ALTER TABLE sale
	ADD date_time datetime
GO
SET DATEFORMAT DMY

/* Eliminar columna active de tabla sale */
ALTER TABLE sale
	DROP COLUMN active
GO

/* El valor predeterminado será activo */
ALTER TABLE sale
	ADD active bit DEFAULT (1)
GO

-- FIN TABLA SALE

-- INICIO TABLA SALE_DETAIL
/*Crear la tabla sale_detail*/
CREATE TABLE sale_detail (
    id int  NOT NULL,
    sale_id int  NOT NULL,
    clothes_id int  NOT NULL,
	amount int  NOT NULL,
    CONSTRAINT sale_detail_pk PRIMARY KEY  (id)
);

-- FIN TABLA SALE_DETAIL

--	RELACIONES ENTRE TABLAS
/* Ver relaciones creadas entre las tablas de la base de datos */
SELECT 
    fk.name [Constraint],
    OBJECT_NAME(fk.parent_object_id) [Tabla],
    COL_NAME(fc.parent_object_id,fc.parent_column_id) [Columna FK],
    OBJECT_NAME (fk.referenced_object_id) AS [Tabla base],
    COL_NAME(fc.referenced_object_id, fc.referenced_column_id) AS [Columna PK]
FROM 
    sys.foreign_keys fk
    INNER JOIN sys.foreign_key_columns fc ON (fk.OBJECT_ID = fc.constraint_object_id)
GO

/*Relación de tabla sale entre sale_client*/
ALTER TABLE sale ADD CONSTRAINT sale_client
    FOREIGN KEY (client_id)
    REFERENCES client (id);

/*Relación de tabla sale_detail con clothes*/
ALTER TABLE sale_detail ADD CONSTRAINT sale_detail_clothes
    FOREIGN KEY (clothes_id)
    REFERENCES clothes (id);

/*Relación de tabla sale_detail con sale*/
ALTER TABLE sale_detail ADD CONSTRAINT sale_detail_sale
    FOREIGN KEY (sale_id)
    REFERENCES sale (id);

/*Relación de tabla sale con seller*/
ALTER TABLE sale ADD CONSTRAINT sale_seller
    FOREIGN KEY (seller_id)
    REFERENCES seller (id);
