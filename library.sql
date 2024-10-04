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

INSERT INTO genres (id, genre ) VALUES (gen_random_uuid(),'detective');
INSERT INTO genres (id, genre ) VALUES (gen_random_uuid(),'memoir');
INSERT INTO genres (id, genre ) VALUES (gen_random_uuid(),'poetry');
INSERT INTO genres (id, genre ) VALUES (gen_random_uuid(),'drama');

INSERT INTO authors (id, name, surname ) VALUES (gen_random_uuid(),'Matthew', 'Morrison');
INSERT INTO authors (id, name, surname ) VALUES (gen_random_uuid(),'Christopher', 'Lyons');
INSERT INTO authors (id, name, surname ) VALUES (gen_random_uuid(),'Margaret', 'Bradley');
INSERT INTO authors (id, name, surname) VALUES (gen_random_uuid(),'Sibyl', 'Underwood');

INSERT INTO books (id, name, ISBN, genre_id ) VALUES (gen_random_uuid(),'White acacia', '978-2-266-11156-0','31d0778c-7838-41e8-9072-5fa227bac5f5');
INSERT INTO books (id, name, ISBN, genre_id ) VALUES (gen_random_uuid(),'My struggle', '978-2-277-11156-1','5fef5d8d-28a8-4cf7-8a71-d52b7eda6692');
INSERT INTO books (id, name, ISBN, genre_id ) VALUES (gen_random_uuid(),'Hot summer', '978-2-255-11156-2','c1755cb6-b9e1-49be-b515-36396e9e3a61');
INSERT INTO books (id, name, ISBN, genre_id ) VALUES (gen_random_uuid(),'Death in the desert', '978-2-266-11156-0','dbdde944-23e6-492d-bfa8-a72be0781ff0');

INSERT INTO author_book_connection (id, author_id, book_id ) VALUES (gen_random_uuid(),'8b74163f-a8ce-4c9b-8569-144e652c1191', '4c2e68a0-8e79-4796-a49f-1e141e1ad674');
INSERT INTO author_book_connection (id, author_id, book_id ) VALUES (gen_random_uuid(),'d354907b-7daf-4199-abf6-f73c53193a62', '2c737664-81fd-4aaa-8941-b22f22f46bd0');
INSERT INTO author_book_connection (id, author_id, book_id ) VALUES (gen_random_uuid(),'314ae72d-7210-415a-8628-f394c253b07c', 'b5a66b4f-502e-4e02-a7ab-47ec9a29a19e');
INSERT INTO author_book_connection (id, author_id, book_id ) VALUES (gen_random_uuid(),'85441b0d-6b7c-4c23-84b4-63de93293e33', 'b5a66b4f-502e-4e02-a7ab-47ec9a29a19e');
INSERT INTO author_book_connection (id, author_id, book_id ) VALUES (gen_random_uuid(),'85441b0d-6b7c-4c23-84b4-63de93293e33', 'c8735262-abcb-4a37-9210-f5c60f930266');
INSERT INTO author_book_connection (id, author_id, book_id ) VALUES (gen_random_uuid(),'8b74163f-a8ce-4c9b-8569-144e652c1191', 'c8735262-abcb-4a37-9210-f5c60f930266');


SELECT * FROM books WHERE name = 'White acacia' OR name = 'Hot summer'

SELECT books.name,isbn ,genres.genre FROM books  JOIN genres ON genres.id = books.genre_id
WHERE name = 'White acacia'