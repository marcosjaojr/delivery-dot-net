CREATE TABLE Tipos
(
	ID_TIPO INT IDENTITY PRIMARY KEY NOT NULL,
	NOME_TIPO VARCHAR(100),
	DESCRICAO VARCHAR(MAX)
)

CREATE TABLE Fornecedores
(
	ID_FORNECEDOR INT IDENTITY PRIMARY KEY NOT NULL,
	NOME_FANTASIA_FORNECEDOR VARCHAR(MAX),
	RAZAO_SOCIAL_FORNECEDOR VARCHAR(MAX)
)

CREATE TABLE Fabricantes
(
	ID_FABRICANTE INT IDENTITY PRIMARY KEY NOT NULL,
	NOME_FANTASIA_FABRICANTE VARCHAR(MAX),
	RAZAO_SOCIAL_FABRICANTE VARCHAR(MAX),
	PAIS_FABRICANTE VARCHAR(100)
)

CREATE TABLE Produtos
(
	ID_PRODUTO INT IDENTITY PRIMARY KEY NOT NULL,
	NOME_PRODUTO VARCHAR(100),
	IMAGEM IMAGE,
	SABOR VARCHAR(100),
	COD_TIPO INT NOT NULL FOREIGN KEY REFERENCES Tipos (ID_TIPO),
	IDADE INT,
	TEOR_ALCOOLICO NUMERIC(2,2),
	VOLUME_ml INT,
	DESCRICAO VARCHAR(MAX),
	PRECO NUMERIC(12,2),
	PRECO_PROMOCIONAL NUMERIC(12,2),
	COD_FABRICANTE INT NOT NULL FOREIGN KEY REFERENCES Fabricantes (ID_FABRICANTE),
	CODIGO_DE_BARRA BIGINT,
	QUANTIDADE_ESTOQUE INT
)

CREATE TABLE Clientes
(
	ID_CLIENTE INT IDENTITY PRIMARY KEY NOT NULL,
	NOME_CLIENTE VARCHAR(100),
	EMAIL_CLIENTE VARCHAR(MAX),
	TELEFONE_CLIENTE BIGINT,
	CELULAR_CLIENTE BIGINT,
	CEP_CLIENTE VARCHAR(MAX),
	ENDERECO_CLIENTE VARCHAR(MAX),
	COMPLEMENTO_CLIENTE VARCHAR(MAX),
	NASCIMENTO_CLIENTE DATETIME,
	USUARIO_LOGIN VARCHAR(30),
	USUARIO_SENHA VARCHAR(30)
)

CREATE TABLE Funcionarios
(
	ID_FUNCIONARIO INT IDENTITY PRIMARY KEY NOT NULL,
	NOME_FUNCIONARIO VARCHAR(100),
	EMAIL_FUNCIONARIO VARCHAR(MAX),
	CPF_FUNCIONARIO VARCHAR(11),
	TELEFONE_CLIENTE BIGINT,
	CELULAR_CLIENTE BIGINT,
	NASCIMENTO_CLIENTE DATETIME,
	TIPO_DE_GANHO VARCHAR(30),
	CARGO VARCHAR(30),
	USUARIO_LOGIN VARCHAR(30),
	USUARIO_SENHA VARCHAR(30)

)

CREATE TABLE FIN_compras
(
	ID_COMPRA INT IDENTITY PRIMARY KEY NOT NULL,
	ID_PRODUTO INT NOT NULL FOREIGN KEY REFERENCES Produtos (ID_PRODUTO),
	ID_FUNCIONARIO INT NOT NULL FOREIGN KEY REFERENCES Funcionarios (ID_FUNCIONARIO),
	QUANTIDADE_COMPRADA INT,
	NUMERO_NOTA_FISCAL BIGINT,
	DATA_COMPRA DATETIME,
	COD_FORNECEDOR INT NOT NULL FOREIGN KEY REFERENCES Fornecedores (ID_FORNECEDOR)
)

CREATE TABLE FIN_vendas
(
	ID_VENDA INT IDENTITY PRIMARY KEY NOT NULL,
	ID_CLIENTE INT NOT NULL FOREIGN KEY REFERENCES Clientes (ID_CLIENTE),
	ID_PRODUTO INT NOT NULL FOREIGN KEY REFERENCES Produtos (ID_PRODUTO),
	ID_ENTREGADOR INT NOT NULL FOREIGN KEY REFERENCES Funcionarios (ID_FUNCIONARIO),
	QUANTIDADE_VENDIDA INT,
	DATA_VENDA DATETIME,
	VALOR_TOTAL NUMERIC(12,2),
	FORMA_DE_PAGAMENTO VARCHAR(50),
	STATUS_VENDA VARCHAR(30)
)