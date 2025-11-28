--create database CarePetsjop;
--use CarePetshop;

CREATE TABLE Cliente (
	ID_Cliente INTEGER PRIMARY KEY IDENTITY(1000, 10),
	CPF CHAR(11) NOT NULL UNIQUE,
	Nome VARCHAR (50) NOT NULL,
	Sexo CHAR(1) DEFAULT ('M'),
	CHECK(Sexo='M' OR Sexo='F'),
	Telefone Char(11) CHECK (telefone NOT LIKE '%[^0-9]%'),
);