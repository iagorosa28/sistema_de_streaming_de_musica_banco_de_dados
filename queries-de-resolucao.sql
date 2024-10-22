--QUERIES DE RESOLUÇÃO

--1:
SELECT titulo, duracao FROM musica;

--2:
SELECT a.nome
FROM artista AS a
JOIN musicas_artistas as ma ON a.id = ma.id_artista
GROUP BY a.nome
HAVING COUNT (ma.id_musica) > 11;

--3:
SELECT titulo
FROM disco
WHERE EXTRACT (YEAR FROM data_lancamento) > 2022;

--4:
SELECT m.titulo, a.nome
FROM musica as m
JOIN musicas_artistas as ma ON m.id = ma.id_musica
JOIN artista as a ON a.id = ma.id_artista
ORDER BY m.titulo;

--5:
SELECT p.titulo
FROM playlist AS p
JOIN playlists_musicas AS pm ON p.id = pm.id_playlist
JOIN musica AS m ON m.id = pm.id_musica
WHERE m.titulo = 'Celestial Dance';

--6:
SELECT DISTINCT u.nome
FROM usuario as u
JOIN playlist as p ON u.id = p.id_usuario
JOIN playlists_musicas as pm ON p.id = pm.id_playlist
JOIN musica as m ON pm.id_musica = m.id
JOIN disco as d ON m.id_disco = d.id
WHERE d.titulo = 'Vibrant Colors';

--7:
SELECT AVG(duracao)
FROM musica as m
JOIN musicas_artistas as ma ON m.id = ma.id_musica
JOIN artista as a ON a.id = ma.id_artista
WHERE a.nome = 'Luna Star';

--8:
SELECT nome
FROM artista
WHERE id NOT IN (SELECT DISTINCT id_artista FROM musicas_artistas);

--9:
SELECT d.titulo
FROM disco AS d
JOIN musica AS m ON d.id = m.id_disco
GROUP BY d.titulo
HAVING COUNT(m.id) >= 5;

--10:
SELECT DISTINCT a.nome
FROM artista AS a
JOIN disco AS d ON a.id = d.id_artista
JOIN musicas_artistas AS ma ON a.id = ma.id_artista
JOIN musica AS m ON m.id = ma.id_musica
JOIN playlists_musicas AS pm ON m.id = pm.id_musica
JOIN playlist AS p ON p.id = pm.id_playlist
WHERE EXTRACT (YEAR FROM d.data_lancamento) < 2022 AND p.titulo = 'Romantic Evening';

--11:
SELECT m.titulo
FROM musica AS m
JOIN musicas_artistas AS ma ON m.id = ma.id_musica
GROUP BY m.titulo
HAVING COUNT(ma.id_artista) > 1;

--12:
SELECT m.titulo
FROM musica AS m
JOIN playlists_musicas AS pm ON m.id = pm.id_musica
GROUP BY m.titulo
HAVING COUNT(pm.id_playlist) > 1;

--13:
SELECT u.nome
FROM usuario AS u
JOIN playlist AS p ON u.id = p.id_usuario
JOIN playlists_musicas AS pm ON p.id = pm.id_playlist
JOIN musica AS m ON m.id = pm.id_musica
WHERE m.titulo = 'Celestial Dance';

--14:
SELECT titulo
FROM musica
WHERE id_disco = (SELECT id FROM disco WHERE titulo = 'Rhythms of the Night')
ORDER BY duracao DESC
LIMIT 1;

--15:
SELECT titulo
FROM disco AS d
JOIN artista AS a ON a.id = d.id_artista
WHERE a.nome = 'Luna Star' AND EXTRACT (YEAR FROM d.data_lancamento) = 2020;

--16:
SELECT DISTINCT a.nome
FROM artista AS a
JOIN musicas_artistas AS ma ON a.id = ma.id_artista
JOIN musica AS m ON m.id = ma.id_musica
JOIN playlists_musicas AS pm ON m.id = pm.id_musica
JOIN playlist AS p ON p.id = pm.id_playlist
JOIN usuario AS u ON u.id = p.id_usuario
WHERE u.nome = 'Dante Blaze';

--17:
SELECT titulo
FROM musica
WHERE id NOT IN(SELECT id_musica FROM playlists_musicas);

--*18:
SELECT m.titulo, a.nome
FROM artista AS a
JOIN musicas_artistas AS ma ON a.id = ma.id_artista
JOIN musica AS m ON m.id = ma.id_musica
JOIN playlists_musicas AS pm ON m.id = pm.id_musica
JOIN playlist AS p ON p.id = pm.id_playlist
GROUP BY m.titulo, a.nome
HAVING COUNT(m.id) > 3;

--*19:
SELECT DISTINCT d.titulo
FROM disco AS d
JOIN artista AS a ON a.id = d.id_artista
WHERE d.id_artista IN (
    SELECT id_artista 
    FROM disco
    GROUP BY id_artista
    HAVING COUNT(id) > 2);

--20:
SELECT u.nome, p.titulo 
FROM usuario AS u
JOIN playlist AS p ON u.id = p.id_usuario 
JOIN playlists_musicas AS pm ON p.id = pm.id_playlist 
GROUP BY u.nome, p.titulo 
HAVING COUNT(pm.id_musica) >= 5;

--*Todas as queries que possuem um * antes do número significa que deu erro