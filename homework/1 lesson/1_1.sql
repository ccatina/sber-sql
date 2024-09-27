-- Использованы связи один-ко-многим/многие-ко-многим


-- Первичным ключом является genre_id
-- Родительская таблица
create table if not exists student04.genre (
    genre_id	SMALLINT	primary key,
    name		varchar(40)	not null
    );

-- Первичным ключом является artist_id
-- Родительская таблица
create table if not exists student04.artist	(
    artist_id	BIGSERIAL	primary key,
    name		varchar(40)	not null
    );

-- Первичным ключом является album_id
-- Родительская таблица
create table if not exists student04.album	(
    album_id	BIGSERIAL	primary key,
    name		varchar(40)	not null,
    year		int4		not null
    );

-- Первичным ключом является track_id
-- Родительская таблица
create table if not exists student04.track (
    track_id	BIGSERIAL	primary key,
    name		varchar(40)	not null,
    year		int4	not null,
    count_of_plays	int8	not null default 0
    );

-- Первичным ключом является (album_id, artist_id)
-- Внешним ключом является album_id, artist_id
create table if not exists student04.album_artist (
    album_id	BIGSERIAL	references student04.album(album_id),
    artist_id	BIGSERIAL	references student04.artist(artist_id),
    primary key (album_id, artist_id)

    );


-- Первичным ключом является (track_id, artist_id)
-- Внешним ключом является track_id, artist_id
-- Дочерняя таблица по отношению к track, artist
create table if not exists student04.track_artist (
    track_id	BIGSERIAL	references student04.track(track_id),
    artist_id	BIGSERIAL	references student04.artist(artist_id),
    primary key (track_id, artist_id)

    );

-- Первичным ключом является (track_id, album_id)
-- Внешним ключом является track_id, album_id
-- Дочерняя таблица по отношению к track, album
create table if not exists student04.track_album (
    track_id	BIGSERIAL	references student04.track(track_id),
    album_id 	BIGSERIAL	references student04.album(album_id),
    primary key (track_id, album_id)
    );



-- Первичным ключом является (genre_id, track_id)
-- Внешним ключом является genre_id, track_id
-- Дочерняя таблица по отношению к track, genre
create table if not exists student04.track_genre (
    genre_id	SMALLINT	references student04.genre(genre_id),
    track_id	BIGSERIAL	references student04.track(track_id),
    primary key (genre_id, track_id)
    );

-- Первичным ключом является (genre_id, album_id)
-- Внешним ключом является genre_id, album_id
-- Дочерняя таблица по отношению к genre, album
create table if not exists student04.album_genre (
    genre_id	SMALLINT	references student04.genre(genre_id),
    album_id	BIGSERIAL	references student04.album(album_id),
    primary key (genre_id, album_id)
    );





