create database library;

create table genres
(   id UUID PRIMARY KEY,
    genre VARCHAR(30) NOT NULL
);

create table authors
(   id UUID PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    surname VARCHAR(30) NOT NULL
);

create table readers
(   id UUID PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    surname VARCHAR(30) NOT NULL,
    library_card_number INT  NOT NULL,
    fine DECIMAL
);

create table books
(
    id UUID PRIMARY KEY,
    name VARCHAR(60) NOT NULL,
    ISBN CHAR(17) NOT NULL,
    genre_id UUID NOT NULL,

    CONSTRAINT  genre_id_fk FOREIGN KEY (genre_id) REFERENCES genres (id)
);

create table author_book_connection
(
    id UUID PRIMARY KEY,
    author_id UUID NOT NULL,
    book_id UUID NOT NULL,

    CONSTRAINT  book_id_fk FOREIGN KEY (book_id) REFERENCES books (id),
    CONSTRAINT  author_id_fk FOREIGN KEY (author_id) REFERENCES authors (id)
);

create table book_lending
(
    id UUID PRIMARY KEY,
    reader_id UUID NOT NULL,
    book_id UUID NOT NULL,
    issue_date DATE  NOT NULL,
    return_date DATE,

    CONSTRAINT  book_id_fk FOREIGN KEY (book_id) REFERENCES books (id),
    CONSTRAINT  reader_id_fk FOREIGN KEY (reader_id) REFERENCES readers (id)
);

