CREATE DATABASE CarePetshop;
USE CarePetshop;

CREATE TABLE Cliente (
	ID_Cliente INTEGER PRIMARY KEY IDENTITY(1, 1),
	CPF CHAR(11) NOT NULL UNIQUE,
	Nome VARCHAR (50) NOT NULL,
	Sexo CHAR(1) DEFAULT ('M'),
	CHECK(Sexo='M' OR Sexo='F'),
	Telefone Char(11) CHECK (telefone NOT LIKE '%[^0-9]%') NOT NULL,
	Email VARCHAR(50) UNIQUE,
	Endereco VARCHAR(50) NOT NULL,
);

CREATE TABLE Pet (
	ID_Pet INTEGER PRIMARY KEY IDENTITY(1, 1),
	Nome_Pet VARCHAR(30) NOT NULL NOT NULL,
	Especie VARCHAR(10) NOT NULL,
	Raca VARCHAR(30) NOT NULL,
	Idade INTEGER CHECK (Idade >=0) NOT NULL,
	Sexo CHAR(1) DEFAULT ('M'),
	CHECK(Sexo='M' OR Sexo='F'),
	Observacoes VARCHAR(50),
	ID_Cliente INTEGER CONSTRAINT FK_Cliente REFERENCES Cliente(ID_Cliente) ON DELETE CASCADE
);

CREATE TABLE Operacao_Comercial (
	ID_Operacao INTEGER PRIMARY KEY IDENTITY(1000, 10),
	ID_Pet INTEGER CONSTRAINT FK_Pet REFERENCES Pet(ID_Pet),
	Tipo_Operacao VARCHAR(20) NOT NULL,
	Data_Operacao DATE NOT NULL,
	Valor_Total MONEY NOT NULL,
	Status VARCHAR(20) NOT NULL,
	CHECK(Status='Pendente' OR Status='Concluido' OR Status='Cancelado'),
	ID_Pagamento INTEGER CONSTRAINT FK_Pagamento REFERENCES Pagamento(ID_Pagamento)
);

CREATE TABLE Pagamento (
	ID_Pagamento INTEGER PRIMARY KEY IDENTITY(5000, 10),
	Metodo_Pagamento VARCHAR(20) NOT NULL,
	CHECK(Metodo_Pagamento='Dinheiro' OR Metodo_Pagamento='Cartao de Credito' OR Metodo_Pagamento='Cartao de Debito' OR Metodo_Pagamento='Pix'),
	Data_Pagamento DATE NOT NULL,
	Valor MONEY NOT NULL
);

CREATE TABLE Servico (
	ID_Servico INTEGER PRIMARY KEY IDENTITY(3,-1),
	Nome_Servico VARCHAR(30) NOT NULL,
	CHECK(Nome_Servico='Banho' OR Nome_Servico='Tosa' OR Nome_Servico='Estetica'),
	Preco MONEY NOT NULL,
	Duracao TIME NOT NULL
);

CREATE TABLE Produto (
	ID_Produto INTEGER PRIMARY KEY IDENTITY(200, 5),
	Nome_Produto VARCHAR(30) NOT NULL,
	Descricao VARCHAR(100),
	Valor_Servico MONEY NOT NULL,
	Quantidade_Estoque INTEGER CHECK (Quantidade_Estoque >=0) NOT NULL
);