drop database if exists trabalho;
create database trabalho CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
use trabalho;

create table colecao(
	`idColecao` INT NOT NULL,
    `nome` VARCHAR(255) NOT NULL,
    PRIMARY KEY(`idColecao`)
);

create table ator(
	`idAtor` INT NOT NULL,
     `genero` INT NOT NULL,
     `nome` VARCHAR(255) NOT NULL,
     PRIMARY KEY(`idAtor`)
);

create table diretor(
	`idDiretor` INT NOT NULL,
     `genero` INT NOT NULL,
     `nome` VARCHAR(255) NOT NULL,
     PRIMARY KEY(`idDiretor`)
);

create table filme(
	`idFilme` INT NOT NULL ,
    `titulo` VARCHAR(100) NOT NULL ,
	`bilheteria` DOUBLE NOT NULL ,
	`custo` DOUBLE NOT NULL ,
    `lancamento` DATE NOT NULL,
    `nota` DOUBLE NOT NULL,
    `duracao` DOUBLE NOT NULL,
    `idColecao` INT,
    PRIMARY KEY(`idFilme`),
    FOREIGN KEY(`idColecao`) REFERENCES `colecao` (`idColecao`)
);

create table elenco(
	`idFilme` INT NOT NULL,
    `idAtor` INT NOT NULL,
    PRIMARY KEY(`idFilme`,`idAtor`),
    FOREIGN KEY(`idFilme`) references `filme` (`idFilme`),
    FOREIGN KEY(`idAtor`) references `ator` (`idAtor`)
);

create table direcao(
	`idFilme` INT NOT NULL,
    `idDiretor` INT NOT NULL,
    PRIMARY KEY(`idFilme`,`idDiretor`),
    FOREIGN KEY(`idFilme`) references `filme` (`idFilme`),
    FOREIGN KEY(`idDiretor`) references `diretor` (`idDiretor`)
);
