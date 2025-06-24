CREATE database aula16;

CREATE TABLE categoria (
	categoria_id serial,
	nome varchar(20),
	ultima_atualizacao timestamp
);

-- comando para excluir tabela
-- drop table categoria;

CREATE TABLE filme_categoria(
	filme_ida int,
	categoria_id int,
	ultima_atualizacao timestamp
	);
	
CREATE TABLE filme (
	filme_id serial,
	titulo varchar (35),
	descricao text,
	ano_lancamento char (4),
	linguagem_id int,
	duracao_aluguel int,
	preco_aluguel NUMERIC (4,2),
	duracao int,
	multa NUMERIC (4,2),
	classificacao_indicativia int,
	ultima_atualizacao timestamp,
	ocasiao_especial text,
	sinopse tex
);

CREATE TABLE linguagem (
	linguagem_id serial,
	nome varchar (20),
	ultima_atualizacao timestamp
);

CREATE TABLE ator_filme (
	ator_id int,
	filme_id int,
	ultima_atualizacao timestamp
);

CREATE TABLE inventario (
	inventario_id serial,
	filme_id int,
	loja_id int,
	ultima_atualizacao timestamp
);

CREATE TABLE aluguel (
	aluguel_id serial,
	data_aluguel timestamp,
	inventario_id int,
	cliente_id int,
	data_retorno timestamp,
	funcionario_id int,
	ultima_atualizacao timestamp
	);

CREATE TABLE pagamento (
	pagamento_id serial,
	cliente_id int,
	funcionario_id int,
	aluguel_id int,
	quantia NUMERIC (4,2),
	pagamento_data timestamp
);

CREATE TABLE funcionario (
	funcionario_id serial,
	primeiro_nome varchar (20),
	ultimo_nome varchar(20),
	endereco_id int,
	email varchar (60),
	loja_id int,
	ativo bool,
	usuario varchar(30),
	senha char (8),
	ultima_atualizacao timestamp,
	foto bytea
);

CREATE TABLE ator (
	ator_id serial,
	primeiro_nome varchar (20),
	ultimo_nome varchar(20),
	ultima_atualizacao timestamp
);

CREATE TABLE cliente (
	cliente_id serial,
	loja_id int,
	primeiro_nome varchar (20),
	ultimo_nome varchar(20),
	email varchar (60),
	endereco_id int,
	ultima_atualizacao timestamp,
	ativo bool
);

CREATE TABLE encdereco (
	endereco_id serial,
	endereco varchar(40),
	endereco2 varchar(40),
	distrito varchar(30),
	cidade_id int,
	cep char (8),
	telefone char (11),
	ultima_atualizacao timestamp
);

CREATE TABLE cidade (
	cidade_id serial,
	cidade varchar (30),
	pais_id int,
	ultima_atualizacao timestamp
);

CREATE TABLE pais (
	pais_id serial,
	pais varchar (30),
	ultima_atualizacao timestamp
);

CREATE TABLE loja (
	loja_id serial,
	gerente_funcionario_id int,
	endereco_id int,
	ultima_atualizacao timestamp
);

--remover coluna
ALTER TABLE loja DROP column ultima atualizacao;
--adicionar coluna
ALTER TABLE loja ADD column ultima_atualizacao timestamp;
--renomear coluna
ALTER TABLE loja rename COLUMN ult_atual;
--alterar o tipo de dado da coluna
ALTER TABLE loja ALTER COLUMN ultima_atualizacao
	SET DATA TYPE timestamp;

--criação de chaves primarias
ALTER TABLE categoria ADD PRIMARY KEY (categoria_id);
ALTER TABLE filme ADD PRIMARY KEY (filme_id);
ALTER TABLE linguagem ADD PRIMARY KEY (linguagem_id);
ALTER TABLE inventario ADD PRIMARY KEY (inventario_id);
ALTER TABLE pais ADD PRIMARY KEY (pais_id);
ALTER TABLE ator ADD PRIMARY KEY (ator_id);
ALTER TABLE cidade ADD PRIMARY KEY (cidade_id);
ALTER TABLE loja ADD PRIMARY KEY (loja_id);
ALTER TABLE pagamento ADD PRIMARY KEY (pagamento_id);
ALTER TABLE endereco ADD PRIMARY KEY (endereco_id);
ALTER TABLE cliente ADD PRIMARY KEY (cliente_id);
ALTER TABLE funcionario ADD PRIMARY KEY (funcionario_id);
ALTER TABLE aluguel ADD PRIMARY KEY (aluguel_id);

--criação de chaves estrqangeiras
ALTER TABLE filme_categoria
ADD CONSTRAINT fk_categoria
FOREIGN KEY (categoria_id)
REFERENCES categoria(categoria_id);

ALTER TABLE filme_categoria
ADD CONSTRAINT fk_filme
FOREIGN KEY (filme_id)
REFERENCES filme(filme_id);

ALTER TABLE filme
ADD CONSTRAINT fk_linguagem
FOREIGN KEY (linguagem_id)
REFERENCES linguagem(linguagem_id);

ALTER TABLE ator_filme
ADD CONSTRAINT fk_ator
FOREIGN KEY (ator_id)
REFERENCES ator(ator_id));

ALTER TABLE ator_filme
ADD CONSTRAINT fk_filme
FOREIGN KEY (filme_id)
REFERENCES filme(filme_id);

ALTER TABLE inventario  --tabela que possui a chave estrangeira
ADD CONSTRAINT fk_filme --ADD restrição na tabela a ser alterada
FOREIGN KEY (filme_id)  --define a chave estrangeira na tabela a ser alterada
REFERENCES filme(filme_id);  --referencia a tabela que possui a chave primaria

ALTER TABLE aluguel
ADD CONSTRAINT fk_inventario
FOREIGN KEY (inventario_id)
REFERENCES inventario(inventario_id);

ALTER TABLE aluguel
ADD CONSTRAINT fk_funcionario
FOREIGN KEY (funcionario_id)
REFERENCES funcionario(funcionario_id);

ALTER TABLE pagamento
ADD CONSTRAINT fk_aluguel
FOREIGN KEY (aluguel_id)
REFERENCES aluguel(aluguel_id);

ALTER TABLE pagamento
ADD CONSTRAINT fk_funcionario
FOREIGN KEY (funcionario_id)
REFERENCES funcionario(funcionario_id);

