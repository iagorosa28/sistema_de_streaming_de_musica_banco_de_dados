CREATE DATABASE projeto1;

-- CRIAÇÃO TABELAS:

CREATE SEQUENCE artista_id_seq;
CREATE TABLE artista (
  id INT PRIMARY KEY DEFAULT nextval('artista_id_seq'),
  nome VARCHAR NOT NULL,
  data_nascimento DATE
);

CREATE SEQUENCE usuario_id_seq;
CREATE TABLE usuario (
  id INT PRIMARY KEY DEFAULT nextval('usuario_id_seq'),
  nome VARCHAR NOT NULL,
  email VARCHAR UNIQUE NOT NULL,
  data_registro DATE NOT NULL
);

CREATE SEQUENCE disco_id_seq;
CREATE TABLE disco (
  id INT PRIMARY KEY DEFAULT nextval('disco_id_seq'),
  titulo VARCHAR NOT NULL,
  data_lancamento DATE,
  id_artista INT NOT NULL REFERENCES artista(id)
);

CREATE SEQUENCE musica_id_seq;
CREATE TABLE musica (
  id INT PRIMARY KEY DEFAULT nextval('musica_id_seq'),
  titulo VARCHAR NOT NULL,
  duracao INT NOT NULL,
  id_disco INT NOT NULL REFERENCES disco(id)
);

CREATE SEQUENCE playlist_id_seq;
CREATE TABLE playlist (
  id INT PRIMARY  KEY DEFAULT nextval('playlist_id_seq'),
  titulo VARCHAR NOT NULL,
  id_usuario INT NOT NULL REFERENCES usuario(id)
);

CREATE TABLE musicas_artistas (
  id_musica INT NOT NULL REFERENCES musica(id),
  id_artista INT NOT NULL REFERENCES artista(id),
  PRIMARY KEY (id_musica, id_artista)
);

CREATE TABLE playlists_musicas (
  id_playlist INT NOT NULL REFERENCES playlist(id),
  id_musica INT NOT NULL REFERENCES musica(id),
  PRIMARY KEY (id_playlist, id_musica)
);