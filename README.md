# Sistema de streaming de música

> Status do projeto: Em andamento

> Esse projeto nos foi proposto no 5ºSemestre na disciplina de Banco de Dados

> Escrevemos esse projeto juntos durante as aulas

### Tópicos

🔹[Desenvolvedores](#busts_in_silhouette-desenvolvedores)

## Diagrama Relacional
### Modelo de Entidade Relacional

<div align="center">
   <img width=400 height=250 src="https://github.com/user-attachments/assets/a53083ce-8a2a-4e18-ab57-eb1c42cbec59"/>
</div>

### Modelo Relacional na 3FN
```mermaid
classDiagram

   ARTISTA "1" --o{ DISCO : possui
   ARTISTA_MUSICA }o-- "1" ARTISTA : interpreta
   ARTISTA_MUSICA ||--o{ MUSICA : interpreta
    
   DISCO "1" --o{ MUSICA : contem
   USUARIO "1" --o{ PLAYLIST : cria
   PLAYLIST "1" --o{ MUSICAS_PLAYLISTS : contem
   MUSICAS_PLAYLISTS }o--|| MUSICA : esta em


   class MUSICA
   MUSICA : + int id_musica
   MUSICA : + string titulo
   MUSICA : + int duracao
   MUSICA : + int id_disco

   class MUSICAS_PLAYLISTS
   MUSICAS_PLAYLISTS : + int id_playlist
   MUSICAS_PLAYLISTS : + int id_musica

   class ARTISTAS_MUSICAS
   ARTISTAS_MUSICAS : + int id_artista
   ARTISTAS_MUSICAS : + int id_musica

   class DISCO
   DISCO : + int id_disco
   DISCO : + string titulo
   DISCO : + int data_lancamento
   DISCO : + int id_artista

   class ARTISTA
   ARTISTA : + int id_artista
   ARTISTA : + string nome
   ARTISTA : + int data_nascimento

   class PLAYLIST
   PLAYLIST : + int id_playlist
   PLAYLIST : + string titulo
   PLAYLIST : + int id_usuario

    class USUARIO
    USUARIO : + int id_usuario
    USUARIO : + string nome
    USUARIO : + string email
    USUARIO : + int data_registro

```

## Como executar o código
### Parte de criação de tabelas

```codigo
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
```

### Parte de inserção de dados
```codigo
-- INSERÇÃO DE DADOS:

INSERT INTO artista (nome, data_nascimento) VALUES
('Luna Star', '1980-01-15'),
('Jack Melody', '1992-03-22'),
('Bella Harmony', '1985-06-30'),
('Max Thunder', '1995-11-05'),
('Sofia Dreams', '1978-09-10'),
('Oliver Waves', '1990-02-28'),
('Ella Chords', '1982-07-14'),
('Leo Rhythm', '2000-04-20'),
('Zara Vibes', '1993-12-03'),
('Nina Breeze', '1987-08-16');

INSERT INTO usuario (nome, email, data_registro) VALUES
('Alice Nova', 'alice.nova@example.com', '2023-01-01'),
('Ben Echo', 'ben.echo@example.com', '2023-01-05'),
('Clara Sky', 'clara.sky@example.com', '2023-01-10'),
('Dante Blaze', 'dante.blaze@example.com', '2023-02-15'),
('Eva Sunshine', 'eva.sunshine@example.com', '2023-02-20'),
('Finn Wave', 'finn.wave@example.com', '2023-03-01'),
('Gina Star', 'gina.star@example.com', '2023-03-10'),
('Hugo Sound', 'hugo.sound@example.com', '2023-03-15'),
('Ivy Moon', 'ivy.moon@example.com', '2023-03-20'),
('Jake Pulse', 'jake.pulse@example.com', '2023-03-25');

INSERT INTO disco (titulo, data_lancamento, id_artista) VALUES
('Echoes of the Past', '2020-01-01', 1),
('Melodies of Tomorrow', '2021-03-15', 2),
('Dreamscape', '2022-06-30', 3),
('Rhythms of the Night', '2022-09-25', 4),
('Whispers in the Wind', '2021-12-10', 5),
('Ocean Breeze', '2023-01-15', 6),
('Starlight Journey', '2022-02-20', 7),
('Musical Fusion', '2021-11-30', 8),
('Vibrant Colors', '2023-03-01', 9),
('Infinite Echo', '2022-07-04', 10);

INSERT INTO musica (titulo, duracao, id_disco) VALUES
-- Música do disco 1
('Awakening', 215, 1),
('New Horizons', 180, 1),
('Echo of Time', 200, 1),
('Silent Whisper', 220, 1),
('Endless Journey', 190, 1),
-- Música do disco 2
('Midnight Dream', 240, 2),
('Electric Pulse', 200, 2),
('Dancing Shadows', 210, 2),
('Morning Light', 220, 2),
('Rhythm of Love', 180, 2),
-- Música do disco 3
('Gentle Waves', 230, 3),
('Celestial Dance', 250, 3),
('Dreamer', 190, 3),
('Floating', 210, 3),
('Illusions', 220, 3),
-- Música do disco 4
('Lost in Time', 190, 4),
('Dance of the Stars', 205, 4),
('Night Song', 230, 4),
('Echoes of the Heart', 215, 4),
('Waves of Emotion', 240, 4),
-- Música do disco 5
('Whispers of the Night', 230, 5),
('Sunset Glow', 215, 5),
('Journey', 205, 5),
('Reflections', 220, 5),
('Serenity', 240, 5),
-- Música do disco 6
('Ocean Breeze', 195, 6),
('Dance with Me', 240, 6),
('Heartbeat', 215, 6),
('Dreamcatcher', 195, 6),
('Colors of Life', 205, 6),
-- Música do disco 7
('Celestial Dream', 250, 7),
('Mystic Valley', 200, 7),
('Radiant Light', 190, 7),
('Floating Hearts', 210, 7),
('Underwater', 220, 7),
-- Música do disco 8
('Fading Lights', 205, 8),
('Lasting Impressions', 200, 8),
('Infinite Journey', 240, 8),
('Colorful Days', 215, 8),
('Melodic Breeze', 220, 8),
-- Música do disco 9
('Rhythm of Life', 210, 9),
('Elysium', 195, 9),
('Whispers of Love', 205, 9),
('Chasing Stars', 225, 9),
('Harmony', 230, 9),
-- Música do disco 10
('Celestial Waves', 220, 10),
('Echoes of the Sea', 215, 10),
('Moonlight Sonata', 190, 10),
('Nature’s Dance', 210, 10),
('Sound of Dreams', 240, 10);

INSERT INTO playlist (titulo, id_usuario) VALUES
('Chill Vibes', 1),
('Morning Motivation', 2),
('Workout Jams', 3),
('Evening Relaxation', 4),
('Party Anthems', 5),
('Road Trip Classics', 6),
('Romantic Evening', 7),
('Focus and Concentrate', 8),
('Throwback Hits', 9),
('New Discoveries', 10);

INSERT INTO musicas_artistas (id_musica, id_artista) VALUES
(1, 1), (1, 2),
(2, 1), (2, 3),
(3, 1), (3, 4),
(4, 2), (4, 5),
(5, 2), (5, 6),
(6, 3), (6, 7),
(7, 3), (7, 8),
(8, 4), (8, 5),
(9, 4), (9, 6),
(10, 5), (10, 7),
(11, 6), (11, 8),
(12, 7), (12, 9),
(13, 8), (13, 10),
(14, 1), (14, 3),
(15, 1), (15, 2),
(16, 2), (16, 3),
(17, 2), (17, 4),
(18, 3), (18, 5),
(19, 4), (19, 6),
(20, 5), (20, 7),
(21, 6), (21, 8),
(22, 7), (22, 9),
(23, 8), (23, 10),
(24, 1), (24, 5),
(25, 2), (25, 4),
(26, 3), (26, 6),
(27, 4), (27, 7),
(28, 5), (28, 8),
(29, 6), (29, 9),
(30, 7), (30, 10),
(31, 1), (31, 3),
(32, 2), (32, 4),
(33, 3), (33, 5),
(34, 4), (34, 6),
(35, 5), (35, 7),
(36, 6), (36, 8),
(37, 7), (37, 9),
(38, 8), (38, 10),
(39, 1), (39, 2),
(40, 3), (40, 4),
(41, 5), (41, 6),
(42, 7), (42, 8),
(43, 9), (43, 10),
(44, 1), (44, 4),
(45, 2), (45, 5),
(46, 3), (46, 6),
(47, 4), (47, 8),
(48, 5), (48, 9),
(49, 6), (49, 7),
(50, 8), (50, 10);

INSERT INTO playlists_musicas (id_playlist, id_musica) VALUES
(1, 1), (1, 2), (1, 3), (1, 4), (1, 5),
(2, 6), (2, 7), (2, 8), (2, 9), (2, 10),
(3, 11), (3, 12), (3, 13), (3, 14), (3, 15),
(4, 16), (4, 17), (4, 18), (4, 19), (4, 20),
(5, 21), (5, 22), (5, 23), (5, 24), (5, 25),
(6, 26), (6, 27), (6, 28), (6, 29), (6, 30),
(7, 31), (7, 32), (7, 33), (7, 34), (7, 35),
(8, 36), (8, 37), (8, 38), (8, 39), (8, 40),
(9, 41), (9, 42), (9, 43), (9, 44), (9, 45),
(10, 46), (10, 47), (10, 48), (10, 49), (10, 50);
```

## :busts_in_silhouette: Desenvolvedores
| [<img loading="lazy" src="https://github.com/Mariah-Gomes/ProjetoCompMovel1/assets/141663285/e6827fd1-d8fe-4740-b6fc-fbbfccd05752" width=115><br><sub>Mariah Santos Gomes</sub>](https://github.com/Mariah-Gomes) | [<img loading="lazy" src="https://github.com/Mariah-Gomes/ProjetoCompMovel1/assets/141663285/66d7e656-b9e4-43b7-94fa-931b736df881" width=115><br><sub>Iago Rosa de Oliveira</sub>](https://github.com/iagorosa28) |
| :---: | :---: |

# Dados dos desenvolvedores
Iago Rosa de Oliveira R.A.: 22.224.027-7
Mariah Santos Gomes R.A.: 22.224.026-9
