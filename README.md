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
#### Música
#### Disco
#### Artistas
#### Playlist
#### Usuário
```mermaid
classDiagram
    class USUARIO
    USUARIO : + int id_usuario
    USUARIO : + string nome
    USUARIO : + string email
    USUARIO : + int data_registro

   class MUSICA
   MUSICA : + int id_musica
   MUSICA : + string titulo
   MUSICA : + int duracao
   MUSICA : + int id_disco


```
#### Músicas e Playlistas
#### Artistas e Músicas


## Como executar o código

## :busts_in_silhouette: Desenvolvedores
| [<img loading="lazy" src="https://github.com/Mariah-Gomes/ProjetoCompMovel1/assets/141663285/e6827fd1-d8fe-4740-b6fc-fbbfccd05752" width=115><br><sub>Mariah Santos Gomes</sub>](https://github.com/Mariah-Gomes) | [<img loading="lazy" src="https://github.com/Mariah-Gomes/ProjetoCompMovel1/assets/141663285/66d7e656-b9e4-43b7-94fa-931b736df881" width=115><br><sub>Iago Rosa de Oliveira</sub>](https://github.com/iagorosa28) |
| :---: | :---: |
