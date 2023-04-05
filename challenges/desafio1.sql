-- Descomente e altere as linhas abaixo:

-- DROP DATABASE IF EXISTS SpotifyClone;
-- CREATE DATABASE IF NOT EXISTS SpotifyClone;
-- CREATE TABLE SpotifyClone.tabela1(
--     coluna1 tipo restricoes,
--     coluna2 tipo restricoes,
--     colunaN tipo restricoes,
-- ) engine = InnoDB;
-- CREATE TABLE SpotifyClone.tabela2(
--     coluna1 tipo restricoes,
--     coluna2 tipo restricoes,
--     colunaN tipo restricoes,
-- ) engine = InnoDB;
-- INSERT INTO SpotifyClone.tabela1 (coluna1, coluna2)
-- VALUES
--   ('exemplo de dados 1', 'exemplo de dados A'),
--   ('exemplo de dados 2', 'exemplo de dados B'),
--   ('exemplo de dados 3', 'exemplo de dados C');
-- INSERT INTO SpotifyClone.tabela2 (coluna1, coluna2)
-- VALUES
--   ('exemplo de dados 1', 'exemplo de dados X'),
--   ('exemplo de dados 2', 'exemplo de dados Y');


DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE IF NOT EXISTS SpotifyClone;
USE SpotifyClone;

CREATE TABLE plano(
    plano_id INT PRIMARY KEY AUTO_INCREMENT,
    tipo_plano VARCHAR(50) NOT NULL,
    valor REAL NOT NULL
) engine = InnoDB;

CREATE TABLE pessoa_usuaria(
    pessoa_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    idade INT NOT NULL,
    data_assinatura VARCHAR(50) NOT NULL,
    plano_id INT NOT NULL,
    FOREIGN KEY (plano_id) REFERENCES plano(plano_id)
) engine = InnoDB;

CREATE TABLE artista(
    artista_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL
) engine = InnoDB;

CREATE TABLE seguindo(
    pessoa_id INTEGER,
    artista_id INTEGER,
    CONSTRAINT PRIMARY KEY (pessoa_id, artista_id),
    FOREIGN KEY (pessoa_id) REFERENCES pessoa_usuaria (pessoa_id),
    FOREIGN KEY (artista_id) REFERENCES artista (artista_id)
) engine = InnoDB;

CREATE TABLE album(
    album_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    artista_id INT NOT NULL,
    ano_lancamento INT NOT NULL,
    FOREIGN KEY (artista_id) REFERENCES artista (artista_id)
) engine = InnoDB;

CREATE TABLE musica(
    musica_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    duracao INT NOT NULL,
    album_id INT NOT NULL,
    FOREIGN KEY (album_id) REFERENCES album (album_id)
) engine = InnoDB;

CREATE TABLE historico_usuario(
    usuario_id INTEGER,
    musica_id INTEGER,
    data_historico DATETIME NOT NULL,
    UNIQUE (usuario_id, musica_id),
    CONSTRAINT PRIMARY KEY (usuario_id, musica_id),
    FOREIGN KEY (usuario_id) REFERENCES pessoa_usuaria (pessoa_id),
    FOREIGN KEY (musica_id) REFERENCES musica (musica_id)
) engine = InnoDB;

INSERT INTO plano (tipo_plano, valor)
VALUES
  ('gratuito', 0.0),
  ('familiar', 7.99),
  ('universitário', 5.99),
  ('pessoal', 6.99);
  
INSERT INTO pessoa_usuaria (nome, idade, data_assinatura, plano_id)
VALUES
	('Barbara Liskov', 82, '2019-10-20', 1),
	('Robert Cecil Martin', 58, '2019-10-20', 1),
	('Ada Lovelace', 37, '2017-01-06', 2),
	('Martin Fowler', 46, '2017-12-30', 2),
	('Sandi Metz', 58, '2017-01-17', 2),
	('Paulo Freire', 19, '2018-04-29', 3),
	('Bell Hooks', 26, '2018-02-14', 3),
	('Christopher Alexander', 85, '2018-01-05', 4),
	('Judith Butler', 45, '2020-05-13', 4),
	('Jorge Amado', 58, '2017-02-17', 4);

INSERT INTO artista (nome)
VALUES
  ('Beyoncé'),
  ('Queen'),
  ('Elis Regina'),
  ('Baco Exu do Blues'),
  ('Blind Guardian'),
  ('Nina Simone');

INSERT INTO seguindo (pessoa_id, artista_id)
VALUES
	  (1, 1),
    (1, 2),
    (1, 3),
    (2, 1),
    (2, 3),
    (3, 2),
    (4, 4),
    (5, 5),
    (5, 6),
    (6, 6),
    (6, 1),
    (7, 6),
    (9, 3),
    (10, 2);

INSERT INTO album (nome, artista_id, ano_lancamento)
VALUES
    ('Renaissance', 1, '2022'),
    ('Jazz', 2, '1978'),
    ('Hot Space', 2, '1982'),
    ('Falso Brilhante', 3, '1998'),
    ('Vento de Maio', 3, '2001'),
    ('QVVJFA?', 4, '2003'),
    ('Somewhere Far Beyond?', 5, '2007'),
    ('I Put A Spell On You', 6, '2007');
  
INSERT INTO musica (nome, duracao, album_id)
VALUES
    ("BREAK MY SOUL", 279, 1),
    ("VIRGO'S GROOVE", 369, 1),
    ("ALIEN SUPERSTAR", 116, 1),
    ("Don't Stop Me Now", 203, 2),
    ("Under Pressure", 152, 3),
    ("Como Nossos Pais", 105, 4),
    ("O Medo de Amar é o Medo de Ser Livre", 207, 5),
    ("Samba em Paris", 267, 6),
    ("The Bard's Song", 244, 7),
    ("Feeling Good", 100, 8);

INSERT INTO historico_usuario (usuario_id, musica_id, data_historico)
VALUES 
    (1, 8, "2022-02-28 10:45:55"),
    (1, 2, "2020-05-02 05:30:35"),
    (1, 10, "2020-03-06 11:22:33"),
    (2, 10, "2022-08-05 08:05:17"),
    (2, 7, "2020-01-02 07:40:33"),
    (3, 10, "2020-11-13 16:55:13"),
    (3, 2, "2020-12-05 18:38:30"),
    (4, 8, "2021-08-15 17:10:10"),
    (5, 8, "2022-01-09 01:44:33"),
    (5, 5, "2020-08-06 15:23:43"),
    (6, 7, "2017-01-24 00:31:17"),
    (6, 1, "2017-10-12 12:35:20"),
    (7, 4, "2011-12-15 22:30:49"),
    (8, 4, "2012-03-17 14:56:41"),
    (9, 9, "2022-02-24 21:14:22"),
    (10, 3, "2015-12-13 08:30:22");