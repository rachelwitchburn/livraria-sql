CREATE DATABASE IF NOT EXISTS livraria;
use livraria;

CREATE TABLE autor (
	autor_id INT AUTO_INCREMENT,
    nome VARCHAR(100),
    CONSTRAINT PKautor PRIMARY KEY (autor_id)
);

CREATE TABLE editor (
	editor_id INT AUTO_INCREMENT,
    nome VARCHAR(100),
    CONSTRAINT PKeditor PRIMARY KEY (editor_id)
);

CREATE TABLE livro (
	livro_id INT AUTO_INCREMENT AUTO_INCREMENT,
    autor_id INT,
    editor_id INT,
    titulo VARCHAR(100),
    ano_publicacao YEAR,
    preco DECIMAL (10,2),
    CONSTRAINT PKlivro PRIMARY KEY (livro_id),
    CONSTRAINT FKautor FOREIGN KEY (autor_id) REFERENCES autor(autor_id),
    CONSTRAINT FKeditor FOREIGN KEY (editor_id) REFERENCES editor(editor_id)
);

DESCRIBE livro;

INSERT INTO autor (nome)
VALUES
('J.K. Rowling'),
('George R.R. Martin'),
('J.R.R. Tolkien');

INSERT INTO editor (nome)
VALUES
('Bloomsbury'),
('Bantam Books'),
('HarperCollins');

INSERT INTO livro (autor_id, editor_id, titulo, ano_publicacao, preco)
VALUES
(1, 1, 'Harry Potter e a pedra filosofal', 1997, 35.90),
(2, 2, 'Game of thrones', 1996, 45.00),
(3, 3, 'O senhor dos anéis: A sociedade do anel', 1954, 50.00);

select livro.titulo, autor.nome AS nome_autor
FROM livro
INNER JOIN autor
ON (livro.autor_id = autor.autor_id);

select livro.titulo AS titulo_livro, autor.nome AS nome_autor, editor.nome AS nome_editora
FROM livro
INNER JOIN autor
ON (livro.autor_id = autor.autor_id)
INNER JOIN editor
ON (livro.editor_id = editor.editor_id);

select livro.ano_publicacao, livro.titulo, livro.preco, editor.nome AS nome_editor
FROM livro
INNER JOIN editor
ON (livro.editor_id = editor.editor_id)
WHERE livro.ano_publicacao > 1990;