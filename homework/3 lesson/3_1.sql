
-- Использованы связи один-ко-многим/один-к-одному/многие-ко-многим

-- Первичным ключом является genre_id
-- Родительская таблица
create table if not exists student04.genre (
    genre_id	SMALLINT	primary key,
    name		varchar(40)	not null
    );

-- Первичным ключом является country_id
-- Родительская таблица
create table if not exists student04.country (
    country_id	SMALLINT	primary key,
    name		varchar(40)	not null
    );

-- Первичным ключом является author_id
-- Родительская таблица
create table if not exists student04.author	(
    author_id	BIGSERIAL	primary key,
    first_name		varchar(40)	not null,
    second_name		varchar(40)	null,
    country_id      BIGSERIAL references student04.country(country_id),
    date_of_birth   date    not null
    );

-- Первичным ключом является book_id
-- Родительская таблица
create table if not exists student04.book (
    book_id     BIGSERIAL	primary key,
    name		varchar(40)	not null,
    year		int4	not null,
    pages       int8	not null default 0
    );


-- Первичным ключом является (genre_id, book_id)
-- Внешним ключом является genre_id, book_id
-- Дочерняя таблица по отношению к book, genre
create table if not exists student04.book_genre (
    genre_id	SMALLINT	references student04.genre(genre_id),
    book_id	BIGSERIAL	references student04.book(book_id),
    primary key (genre_id, book_id)
);

-- Первичным ключом является (book_id, author_id)
-- Внешним ключом является book_id, author_id
-- Дочерняя таблица по отношению к book, author
create table if not exists student04.book_author (
    book_id	BIGSERIAL	references student04.book(book_id),
    author_id	BIGSERIAL	references student04.author(author_id),
    primary key (book_id, author_id)
    );


-- Первичным ключом является user_id
-- Родительская таблица
create table if not exists student04.user	(
    user_id         BIGSERIAL	primary key,
    first_name		varchar(40)	 null,
    second_name		varchar(40)	 null,
    date_of_birth   date    not null,
    login           varchar(10) not null,
    password_sault  varchar(10) not null
);


-- Первичным ключом является (book_id, user_id)
-- Внешним ключом является book_id, user_id
-- Дочерняя таблица по отношению к book, user
create table if not exists student04.user_book (
    book_id	BIGSERIAL	references student04.book(book_id),
    user_id	BIGSERIAL	references student04.user(user_id),
    primary key (book_id, user_id)
    );

create table if not exists student04.book_small partition of student04.book for values from (0) TO (1000);
create table if not exists student04.book_medium partition of student04.book for values from (1000) TO (10000);
create table if not exists student04.book_big partition of student04.book for values from (10000) to (maxvalue);