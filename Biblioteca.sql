CREATE DATABASE biblioteca;

USE biblioteca;

/* Lógico_1: */

CREATE TABLE USUARIO (
    ENDEREÇO VARCHAR (255),
    TELEFONE VARCHAR (11),
    DADOS_DO_CURSO VARCHAR (45)
);

CREATE TABLE OBRAS (
    TITULO VARCHAR (45) PRIMARY KEY,
    CODIGO_ISBN INTEGER,
    ANO_DE_PUBLICACAO DATE,
    EDIÇÃO INTEGER,
    AUTOR VARCHAR (20),
    IDIOMA VARCHAR (20),
    CLASSIFICAÇÃO INTEGER
);

CREATE TABLE AUTORES (
    NOME VARCHAR (45) PRIMARY KEY,
    NACIONALIDADE VARCHAR (45)
);

CREATE TABLE EDITORA (
    CIDADE VARCHAR (45),
    OBRAS VARCHAR (255),
    FK_OBRAS_titulo VARCHAR (45)
);

CREATE TABLE aluga (
    fk_OBRAS_titulo VARCHAR (45)
);

CREATE TABLE faz (
    fk_AUTORES_nome VARCHAR (45),
    fk_OBRAS_titulo VARCHAR (45)
);
 
ALTER TABLE EDITORA ADD CONSTRAINT FK_EDITORA_1
    FOREIGN KEY (FK_OBRAS_titulo)
    REFERENCES OBRAS (TITULO)
    ON DELETE CASCADE;
 
ALTER TABLE aluga ADD CONSTRAINT FK_aluga_1
    FOREIGN KEY (fk_OBRAS_titulo)
    REFERENCES OBRAS (TITULO)
    ON DELETE SET NULL;
 
ALTER TABLE faz ADD CONSTRAINT FK_faz_1
    FOREIGN KEY (fk_AUTORES_nome)
    REFERENCES AUTORES (NOME)
    ON DELETE RESTRICT;
 
ALTER TABLE faz ADD CONSTRAINT FK_faz_2
    FOREIGN KEY (fk_OBRAS_titulo)
    REFERENCES OBRAS (TITULO)
    ON DELETE SET NULL;